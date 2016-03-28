//
//  KMYSection.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KMYItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMYSection : NSObject <KMYItemAttributes>

@property (nonatomic, strong, readonly, nullable)   NSArray<KMYItem *>  *items;
@property (nonatomic, assign, readonly)             NSUInteger          numberOfItems;

+ (instancetype)sectionWithItems:(NSArray * _Nullable)items;
+ (instancetype)sectionWithItemsInitializer:(void (^)(NSMutableArray * _Nullable items))itemsInitializer;

- (KMYItem * _Nullable)itemAtIndex:(NSUInteger)index;

@end

@interface KMYSection (Subclassing)

@property (nonatomic, strong, readonly, nullable)   NSDictionary        *attributeDictionary;

@end

NS_ASSUME_NONNULL_END