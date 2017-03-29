//
//  KMYViewController.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYViewController.h"

@interface KMYViewController ()

@property (nonatomic, strong)       NSMutableArray<id<KMYViewControllerBehaving>>   *mutableBehaviors;
@property (nonatomic, assign)       BOOL                                            hasExecutedViewDidLoad;

@end

@implementation KMYViewController

@dynamic behaviors;

#pragma mark - UIViewController -

- (void)loadView {
    [super loadView];

    for (id<KMYViewControllerBehaving> behavior in self.mutableBehaviors) {
        [behavior behaviorViewControllerLoadView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.hasExecutedViewDidLoad = YES;

    for (id<KMYViewControllerBehaving> behavior in self.mutableBehaviors) {
        [behavior behaviorViewControllerDidLoadView:self.view];
    }
}

#pragma mark - Public -

- (instancetype)initWithNibName:(nullable NSString *)nibName
                         bundle:(nullable NSBundle *)bundle
                      behaviors:(nullable NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    self = [self initWithNibName:nibName bundle:bundle];
    [self addBehaviors:behaviors];
    return self;
}


- (nullable instancetype)initWithCoder:(NSCoder *)decoder
                             behaviors:(nullable NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    self = [self initWithCoder:decoder];
    if (self) {
        [self addBehaviors:behaviors];
    }
    return self;
}

- (instancetype)initWithBehavior:(id<KMYViewControllerBehaving>)behavior {
    self = [self initWithNibName:nil bundle:nil];
    [self addBehavior:behavior];
    return self;
}

- (instancetype)initWithBehaviors:(NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    self = [self initWithNibName:nil bundle:nil];
    [self addBehaviors:behaviors];
    return self;
}

#pragma mark -

- (void)addBehavior:(id<KMYViewControllerBehaving>)behavior {
    KMYAssert(behavior);

    if ([self.mutableBehaviors containsObject:behavior]) {
        KMYAssertDebugFail(@"Behavior already added.");
    } else {
        [self.mutableBehaviors addObject:behavior];
        [behavior initializeBehaviorWithViewController:self];

        // If loadView has already been called.
        if (self.isViewLoaded) {
            [behavior behaviorViewControllerLoadView];

            // If viewDidLoad has already been called.
            if (self.hasExecutedViewDidLoad) {
                [behavior behaviorViewControllerDidLoadView:self.view];
            }
        }
    }
}

- (void)addBehaviors:(NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    for (id<KMYViewControllerBehaving> behavior in behaviors) {
        [self addBehavior:behavior];
    }
}

- (void)removeBehavior:(id<KMYViewControllerBehaving>)behavior {
    if ([self.mutableBehaviors containsObject:behavior]) {
        [behavior deinitializeBehaviorWithViewController:self];
        [self.mutableBehaviors removeObject:behavior];
    }
}

- (void)removeBehaviors:(NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    for (id<KMYViewControllerBehaving> behavior in behaviors) {
        [self removeBehavior:behavior];
    }
}

- (NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    return [self.mutableBehaviors copy];
}

#pragma mark - Private -

- (NSMutableArray<id<KMYViewControllerBehaving>> *)mutableBehaviors {
    if (_mutableBehaviors) return _mutableBehaviors;
    return _mutableBehaviors = [NSMutableArray array];
}

@end















































