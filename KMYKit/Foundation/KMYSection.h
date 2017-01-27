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

+ (instancetype)sectionWithItems:(nullable NSArray *)items;
+ (instancetype)sectionWithItemsInitializer:(void (^)(NSMutableArray *items))itemsInitializer;
+ (instancetype)sectionWithInitializer:(void (^)(NSMutableDictionary<NSString *, id> *attributes, NSMutableArray *items))initializer;

- (nullable __kindof KMYItem *)itemAtIndex:(NSUInteger)index;
- (void)replaceItemAtIndex:(NSUInteger)index withItem:(__kindof KMYItem *)item;

@end

@interface KMYSection (Subclassing)

@property (nonatomic, strong, readonly, nullable)   NSDictionary<NSString *, id>    *attributeDictionary;

@end

@protocol KMYSectionProvider <NSObject>

- (NSArray<__kindof KMYSection *> *)sections;

@end


NS_ASSUME_NONNULL_END
