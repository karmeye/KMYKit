//
//  KMYCollectionViewCellConfigurator.m
//  KMYKit
//
//  Created on 25/04/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewCellConfigurator.h"

#import "KMYDefaultCollectionViewCell.h"

@interface KMYCollectionViewCellConfiguratorReuseInfo :  NSObject

@property (nonatomic, strong)   Class                                                       cls;
@property (nonatomic, copy)     KMYCollectionViewCellConfiguratorCellConfigurationHandler   handler;

+ (KMYCollectionViewCellConfiguratorReuseInfo *)infoWithClass:(nonnull Class)cls handler:(nullable KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler;

@end

@implementation KMYCollectionViewCellConfiguratorReuseInfo

+ (KMYCollectionViewCellConfiguratorReuseInfo *)infoWithClass:(Class)cls handler:(KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler {
    return [KMYCollectionViewCellConfiguratorReuseInfo kmy_objectWithInitializer:^(KMYCollectionViewCellConfiguratorReuseInfo *info) {
        info.cls        = cls;
        info.handler    = handler;
    }];
}

@end

@interface KMYCollectionViewCellConfigurator ()

@property (nonatomic, strong)   NSMutableDictionary     *reuseIdentifierInfoMapping;

/// A dictionary with @c Class as the key and the handler block the value.
/// Associates the included cell classes with a default configuration.
@property (nonatomic, strong)   NSDictionary            *defaultCellConfigurationHandlers;

@end

@implementation KMYCollectionViewCellConfigurator

#pragma mark - Public -

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls {
    [self registerClass:cls withReuseIdentifier:[cls defaultReuseIdentifier] configurationHandler:NULL];
}

- (void)registerClass:(Class)cls withReuseIdentifier:(NSString*)reuseIdentifier {
    [self registerClass:cls withReuseIdentifier:reuseIdentifier configurationHandler:NULL];
}

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls configurationHandler:(KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler {
    [self registerClass:cls withReuseIdentifier:[cls defaultReuseIdentifier] configurationHandler:handler];
}

- (void)registerClass:(Class)cls withReuseIdentifier:(NSString*)reuseIdentifier configurationHandler:(KMYCollectionViewCellConfiguratorCellConfigurationHandler)handler {
    KMYAssert(reuseIdentifier);
    KMYAssert(cls);
    self.reuseIdentifierInfoMapping[reuseIdentifier] = [KMYCollectionViewCellConfiguratorReuseInfo infoWithClass:cls handler:handler];
}

- (NSString *)defaultCellReuseIdentifier {
    if (!_defaultCellReuseIdentifier) {
        _defaultCellReuseIdentifier = [[KMYDefaultCollectionViewCell defaultReuseIdentifier] copy];
    }
    return _defaultCellReuseIdentifier;
}

#pragma mark - KMYCollectionViewCellConfigurator Protocol

- (void)registerClassesForCellReuseWithCollectionView:(UICollectionView *)collectionView {
    KMYAssert(collectionView);

    // Register the default classes and identifiers first.
    [[[self class] defaultClassReuseIdentifierMapping] enumerateKeysAndObjectsUsingBlock:^(NSString *reuseIdentifier, Class cls, BOOL *stop) {
        [collectionView registerClass:cls forCellWithReuseIdentifier:reuseIdentifier];
    }];

    if (_reuseIdentifierInfoMapping) {
        [self.reuseIdentifierInfoMapping enumerateKeysAndObjectsUsingBlock:^(NSString *reuseIdentifier, KMYCollectionViewCellConfiguratorReuseInfo *info, BOOL *stop) {
            [collectionView registerClass:info.cls forCellWithReuseIdentifier:reuseIdentifier];
        }];
    }
}

- (NSString *)reuseIdentifierForItem:(__kindof KMYUIItem *)item {
    return item.collectionViewCellReuseIdentifier ?: self.defaultCellReuseIdentifier;
}

- (void)configureCell:(__kindof UICollectionViewCell*)cell withItem:(__kindof KMYUIItem*)item atIndexPath:(NSIndexPath *)indexPath {

    NSString *reuseIdentifier = [self reuseIdentifierForItem:item];
    KMYAssert(reuseIdentifier);

    KMYCollectionViewCellConfiguratorReuseInfo *info = _reuseIdentifierInfoMapping ? self.reuseIdentifierInfoMapping[reuseIdentifier] : nil;

    // Find the class to be reused based on the reuse identifier
    Class reuseClass = info ? info.cls : [[self class] defaultClassReuseIdentifierMapping][reuseIdentifier];

    // Always call default config handler before any custom handler
    KMYCollectionViewCellConfiguratorCellConfigurationHandler defaultHandler = [self defaultCellConfigurationHandlerForClass:reuseClass];
    KMYInvokeBlockIfSet(defaultHandler, cell, item, indexPath);
    KMYInvokeBlockIfSet(info.handler, cell, item, indexPath);
    KMYInvokeBlockIfSet(self.cellConfigurationHandler, cell, item, indexPath);
}

#pragma mark - Private -

- (NSMutableDictionary *)reuseIdentifierInfoMapping {
    if (!_reuseIdentifierInfoMapping) _reuseIdentifierInfoMapping = [[NSMutableDictionary alloc] init];
    return _reuseIdentifierInfoMapping;
}

/// @return A dictionary with the defualt reuse identifier as the key and the associated @c Class as the value.
+ (NSDictionary*)defaultClassReuseIdentifierMapping {
    static NSDictionary *defaultClassReuseIdentifierMapping;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultClassReuseIdentifierMapping = @{ [KMYDefaultCollectionViewCell defaultReuseIdentifier]      : [KMYDefaultCollectionViewCell class] };
    });
    return defaultClassReuseIdentifierMapping;
}

- (KMYCollectionViewCellConfiguratorCellConfigurationHandler)defaultCellConfigurationHandlerForClass:(Class)cls {
    return self.defaultCellConfigurationHandlers[NSStringFromClass(cls)];
}

- (NSDictionary<Class, KMYCollectionViewCellConfiguratorCellConfigurationHandler> *)defaultCellConfigurationHandlers {
    if (!_defaultCellConfigurationHandlers) {
        _defaultCellConfigurationHandlers = [[NSMutableDictionary kmy_dictionaryWithInitializer:^(NSMutableDictionary *d) {
            d[NSStringFromClass([KMYDefaultCollectionViewCell class])] = ^(KMYDefaultCollectionViewCell *cell, KMYUIItem *item, NSIndexPath *indexPath) {
                cell.textLabel.text = item.text;
                cell.detailTextLabel.text = item.detailText;
                cell.imageView.image = item.image;
            };

        }] copy];
    }
    return _defaultCellConfigurationHandlers;
}

@end
































