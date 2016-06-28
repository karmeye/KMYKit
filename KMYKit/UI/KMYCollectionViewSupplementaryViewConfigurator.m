//
//  KMYCollectionViewSupplementaryViewConfigurator.m
//  KMYKit
//
//  Created on 28/06/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYCollectionViewSupplementaryViewConfigurator.h"

@interface KMYCollectionViewSupplementaryViewConfiguratorReuseInfo :  NSObject

@property (nonatomic, copy)     Class                                                       cls;
@property (nonatomic, copy)     NSString                                                    *kind;
@property (nonatomic, copy)     NSString                                                    *reuseIdentifier;
@property (nonatomic, copy)     KMYCollectionViewSupplementaryViewConfiguratorHandler       handler;

@end

@implementation KMYCollectionViewSupplementaryViewConfiguratorReuseInfo
@end

#pragma mark -

@interface KMYCollectionViewSupplementaryViewConfigurator ()

@property (nonatomic, strong)   NSMutableDictionary     *reuseInfo;

@end


@implementation KMYCollectionViewSupplementaryViewConfigurator

#pragma mark - Public -

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forSupplementaryViewOfKind:(NSString *)kind {
    [self registerClass:cls forSupplementaryViewOfKind:kind withReuseIdentifier:[cls defaultReuseIdentifier]];
}

- (void)registerClass:(Class<KMYDefaultReusableIdentifying>)cls forSupplementaryViewOfKind:(NSString *)kind handler:(KMYCollectionViewSupplementaryViewConfiguratorHandler)handler {
    [self registerClass:cls forSupplementaryViewOfKind:kind withReuseIdentifier:[cls defaultReuseIdentifier] handler:handler];
}

- (void)registerClass:(Class)cls forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString*)reuseIdentifier {
    [self registerClass:cls forSupplementaryViewOfKind:kind withReuseIdentifier:reuseIdentifier handler:NULL];
}

- (void)registerClass:(Class)cls forSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:(NSString*)reuseIdentifier handler:(KMYCollectionViewSupplementaryViewConfiguratorHandler)handler {
    KMYAssert(kind);
    KMYAssert(reuseIdentifier);
    KMYAssert(cls);

    NSString * const reuseInfoKey = [self reuseInfoKeyFromIdentifier:reuseIdentifier kind:kind];
    KMYAssert(!_reuseInfo || (_reuseInfo && !_reuseInfo[reuseInfoKey]), @"This reuse identifier is already registered: %@", reuseIdentifier);

    self.reuseInfo[reuseInfoKey] = [KMYCollectionViewSupplementaryViewConfiguratorReuseInfo kmy_objectWithInitializer:^(KMYCollectionViewSupplementaryViewConfiguratorReuseInfo *info) {
        info.cls                = cls;
        info.kind               = kind;
        info.reuseIdentifier    = reuseIdentifier;
        info.handler            = handler;
    }];
}

#pragma mark - KMYCollectionViewSupplementaryViewConfigurating Protocol

- (void)registerClassesForSupplementaryViewsInCollectionView:(UICollectionView *)collectionView {
    if (_reuseInfo) {
        [self.reuseInfo enumerateKeysAndObjectsUsingBlock:^(NSString *key, KMYCollectionViewSupplementaryViewConfiguratorReuseInfo *info, BOOL *stop) {
            [collectionView registerClass:info.cls forSupplementaryViewOfKind:info.kind withReuseIdentifier:info.reuseIdentifier];
        }];
    }
}

- (NSString *)supplementaryViewReuseIdentifierForItem:(KMYUIItem *)item inSection:(KMYUISection *)section ofKind:(NSString *)kind {
    if (section.collectionViewSupplementaryViewReuseIdentifier) {
        return section.collectionViewSupplementaryViewReuseIdentifier;
    } else if (item.collectionViewSupplementaryViewReuseIdentifier) {
        return item.collectionViewSupplementaryViewReuseIdentifier;
    } else {
        return self.defaultReuseIdentifier;
    }
}

- (void)configureSupplementaryView:(UICollectionReusableView *)supplementaryView withItem:(KMYUIItem *)item inSection:(KMYUISection *)section ofKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    KMYAssert(kind);
    NSString * const reuseIdentifier    = [self supplementaryViewReuseIdentifierForItem:item inSection:section ofKind:kind];
    KMYAssert(reuseIdentifier);
    NSString * const reuseInfoKey       = [self reuseInfoKeyFromIdentifier:reuseIdentifier kind:kind];

    KMYCollectionViewSupplementaryViewConfiguratorReuseInfo *info = _reuseInfo ? self.reuseInfo[reuseInfoKey] : nil;
    KMYInvokeBlockIfSet(info.handler, supplementaryView, section, item, indexPath);
    KMYInvokeBlockIfSet(self.configurationHandler, supplementaryView, section, item, indexPath);
}

#pragma mark - Private -

- (NSString *)reuseInfoKeyFromIdentifier:(NSString *)reuseIdentifier kind:(NSString *)kind {
    return [reuseIdentifier stringByAppendingString:kind];
}

- (NSMutableDictionary *)reuseInfo {
    if (!_reuseInfo) _reuseInfo = [[NSMutableDictionary alloc] init];
    return _reuseInfo;
}

@end
























