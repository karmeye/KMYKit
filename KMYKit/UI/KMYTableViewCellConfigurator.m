//
//  KMYTableViewCellConfigurator.m
//  KMYKit
//
//  Created on 29/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYTableViewCellConfigurator.h"

#import "KMYTextFieldTableViewCell.h"
#import "KMYDefaultStyleTableViewCell.h"
#import "KMYSubtitleStyleTableViewCell.h"
#import "KMYButtonTableViewCell.h"
#import "KMYDestructiveButtonTableViewCell.h"

@interface KMYTableViewCellConfiguratorReuseInfo :  NSObject

@property (nonatomic, strong)   Class                                                   cls;
@property (nonatomic, copy)     KMYTableViewCellConfiguratorCellConfigurationHandler    handler;

+ (KMYTableViewCellConfiguratorReuseInfo *)infoWithClass:(nonnull Class)cls handler:(nullable KMYTableViewCellConfiguratorCellConfigurationHandler)handler;

@end

@implementation KMYTableViewCellConfiguratorReuseInfo

+ (KMYTableViewCellConfiguratorReuseInfo *)infoWithClass:(Class)cls handler:(KMYTableViewCellConfiguratorCellConfigurationHandler)handler {
    return [KMYTableViewCellConfiguratorReuseInfo kmy_objectWithInitializer:^(KMYTableViewCellConfiguratorReuseInfo *info) {
        info.cls        = cls;
        info.handler    = handler;
    }];
}

@end

@interface KMYTableViewCellConfigurator ()

@property (nonatomic, strong)   NSMutableDictionary     *reuseIdentifierInfoMapping;

/// A dictionary with @c Class as the key and the handler block the value.
/// Associates the included cell classes with a default configuration.
@property (nonatomic, strong)   NSDictionary            *defaultCellConfigurationHandlers;

@end

@implementation KMYTableViewCellConfigurator

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - Public -

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls {
    [self registerClass:cls withReuseIdentifier:[cls defaultReuseIdentifier] configurationHandler:NULL];
}

- (void)registerClass:(Class)cls withReuseIdentifier:(NSString*)reuseIdentifier {
    [self registerClass:cls withReuseIdentifier:reuseIdentifier configurationHandler:NULL];
}

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls configurationHandler:(KMYTableViewCellConfiguratorCellConfigurationHandler)handler {
    [self registerClass:cls withReuseIdentifier:[cls defaultReuseIdentifier] configurationHandler:handler];
}

- (void)registerClass:(Class)cls withReuseIdentifier:(NSString*)reuseIdentifier configurationHandler:(KMYTableViewCellConfiguratorCellConfigurationHandler)handler {
    KMYAssert(reuseIdentifier);
    KMYAssert(cls);
    self.reuseIdentifierInfoMapping[reuseIdentifier] = [KMYTableViewCellConfiguratorReuseInfo infoWithClass:cls handler:handler];
}

#pragma mark - KMYTableViewCellConfigurator Protocol

- (void)registerClassesForCellReuseWithTableView:(UITableView *)tableView {
    KMYAssert(tableView);

    // Register the default classes and identifiers first.
    [[[self class] defaultClassReuseIdentifierMapping] enumerateKeysAndObjectsUsingBlock:^(NSString *reuseIdentifier, Class cls, BOOL *stop) {
        [tableView registerClass:cls forCellReuseIdentifier:reuseIdentifier];
    }];

    // Register custom or overrided classes and identifiers.
    if (_reuseIdentifierInfoMapping) {
        [self.reuseIdentifierInfoMapping enumerateKeysAndObjectsUsingBlock:^(NSString *reuseIdentifier, KMYTableViewCellConfiguratorReuseInfo *info, BOOL *stop) {
            [tableView registerClass:info.cls forCellReuseIdentifier:reuseIdentifier];
        }];
    }
}

- (void)configureCell:(UITableViewCell*)cell withItem:(KMYUIItem*)item atIndexPath:(NSIndexPath *)indexPath {

    KMYTableViewCellConfiguratorReuseInfo *info = _reuseIdentifierInfoMapping ? self.reuseIdentifierInfoMapping[item.reuseIdentifier] : nil;

    // Find the class to be reused based on the reuse identifier
    Class reuseClass = info ? info.cls : [[self class] defaultClassReuseIdentifierMapping][item.reuseIdentifier];

    // Always call default config handler before any custom handler
    KMYTableViewCellConfiguratorCellConfigurationHandler defaultHandler = [self defaultCellConfigurationHandlerForClass:reuseClass];
    KMYInvokeBlockIfSet(defaultHandler, cell, item, indexPath);
    KMYInvokeBlockIfSet(info.handler, cell, item, indexPath);

    switch (item.type) {

        case KMYUIItemTypeDisclosure:
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;

        case KMYUIItemTypeSelectable:
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            break;

        default:
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
    }

    KMYInvokeBlockIfSet(self.cellConfigurationHandler, cell, item, indexPath);
}

#pragma mark - Private -

- (NSMutableDictionary *)reuseIdentifierInfoMapping {
    if (!_reuseIdentifierInfoMapping) _reuseIdentifierInfoMapping = [[NSMutableDictionary alloc] init];
    return _reuseIdentifierInfoMapping;
}

/// @return A dictionary with the defualt reuse identifier as the key and the associated @c Class as the value.
+ (NSDictionary*)defaultClassReuseIdentifierMapping {
    static NSDictionary *_kmy_defaultClassReuseIdentifierMapping;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _kmy_defaultClassReuseIdentifierMapping = @{ [KMYDefaultStyleTableViewCell defaultReuseIdentifier]      : [KMYDefaultStyleTableViewCell class],
                                                     [KMYSubtitleStyleTableViewCell defaultReuseIdentifier]     : [KMYSubtitleStyleTableViewCell class],
                                                     [KMYTextFieldTableViewCell defaultReuseIdentifier]         : [KMYTextFieldTableViewCell class],
                                                     [KMYButtonTableViewCell defaultReuseIdentifier]            : [KMYButtonTableViewCell class],
                                                     [KMYDestructiveButtonTableViewCell defaultReuseIdentifier] : [KMYDestructiveButtonTableViewCell class] };
    });
    return _kmy_defaultClassReuseIdentifierMapping;
}

- (KMYTableViewCellConfiguratorCellConfigurationHandler)defaultCellConfigurationHandlerForClass:(Class)cls {
    return self.defaultCellConfigurationHandlers[NSStringFromClass(cls)];
}

- (NSDictionary<Class, KMYTableViewCellConfiguratorCellConfigurationHandler> *)defaultCellConfigurationHandlers {
    if (!_defaultCellConfigurationHandlers) {
        _defaultCellConfigurationHandlers = [[NSMutableDictionary kmy_dictionaryWithInitializer:^(NSMutableDictionary *d) {

            KMYTableViewCellConfiguratorCellConfigurationHandler setTextHandler = ^(KMYDefaultStyleTableViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                cell.textLabel.text = item.text;
                cell.detailTextLabel.text = item.detailText;
            };

            d[NSStringFromClass([KMYDefaultStyleTableViewCell class])] = ^(KMYDefaultStyleTableViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                setTextHandler(cell, item, indexPath);
            };

            d[NSStringFromClass([KMYSubtitleStyleTableViewCell class])] = ^(KMYSubtitleStyleTableViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                setTextHandler(cell, item, indexPath);
            };

            d[NSStringFromClass([KMYButtonTableViewCell class])] = ^(KMYButtonTableViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                setTextHandler(cell, item, indexPath);
            };

            d[NSStringFromClass([KMYDestructiveButtonTableViewCell class])] = ^(KMYDestructiveButtonTableViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                setTextHandler(cell, item, indexPath);
            };

            d[NSStringFromClass([KMYTextFieldTableViewCell class])] = ^(KMYTextFieldTableViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                cell.textField.placeholder = item.text;
            };

        }] copy];
    }
    return _defaultCellConfigurationHandlers;
}

@end






























