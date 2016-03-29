//
//  KMYSection.h
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KMYItem.h"
#import "KMYItemAttributes.h"

NS_ASSUME_NONNULL_BEGIN

@interface KMYSection : NSObject <KMYItemAttributes>

@property (nonatomic, strong, readonly, nullable)   NSArray<__kindof KMYItem *> *items;
@property (nonatomic, assign, readonly)             NSUInteger                  numberOfItems;

+ (instancetype)sectionWithItems:(NSArray * _Nullable)items;
+ (instancetype)sectionWithItemsInitializer:(void (^)(NSMutableArray * items))itemsInitializer;
+ (instancetype)sectionWithInitializer:(void (^)(NSMutableDictionary * attributes, NSMutableArray * items))initializer;

- (KMYItem * _Nullable)itemAtIndex:(NSUInteger)index;

@end

@interface KMYSection (Subclassing)

@property (nonatomic, strong, readonly, nullable)   NSDictionary        *attributeDictionary;

@end

NS_ASSUME_NONNULL_END