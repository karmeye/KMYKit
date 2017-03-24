//
//  KMYViewController.m
//  KMYKit
//
//  Created on 25/03/16.
//  Copyright © 2016 Karmeye. All rights reserved.
//

#import "KMYViewController.h"

@interface KMYViewController ()

@property (nonatomic, strong, readwrite)        NSArray<id <KMYViewControllerBehaving>>         *behaviors;

@end

@implementation KMYViewController

#pragma mark - UIViewController -

- (instancetype)initWithNibName:(nullable NSString *)nibName bundle:(nullable NSBundle *)bundle {
    self = [super initWithNibName:nibName bundle:bundle];
    if (self) {
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if (self) {
    }
    return self;
}

- (void)loadView {
    [super loadView];

    for (id <KMYViewControllerBehaving> behavior in self.behaviors) {
        [behavior behaviorLoadView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    for (id <KMYViewControllerBehaving> behavior in self.behaviors) {
        [behavior behaviorViewControllerDidLoadView:self.view];
    }
}

#pragma mark - Public -

- (instancetype)initWithNibName:(nullable NSString *)nibName bundle:(nullable NSBundle *)bundle behavior:(id <KMYViewControllerBehaving>)behavior {
    self = [super initWithNibName:nibName bundle:bundle];
    if (self) {
        self.behaviors = behavior ? @[behavior] : @[];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder behavior:(id <KMYViewControllerBehaving>)behavior {
    self = [super initWithCoder:decoder];
    if (self) {
        self.behaviors = behavior ? @[behavior] : @[];
    }
    return self;
}

- (instancetype)initWithBehavior:(id <KMYViewControllerBehaving>)behavior {
    return [self initWithBehaviors:@[behavior]];
}

- (instancetype)initWithBehaviors:(NSArray<id <KMYViewControllerBehaving>> *)behaviors {
    self = [super init];
    if (self) {
        self.behaviors = behaviors;
    }
    return self;
}

- (void)setBehaviors:(NSArray<id<KMYViewControllerBehaving>> *)behaviors {
    _behaviors = [behaviors copy];

    for (id <KMYViewControllerBehaving> behavior in behaviors) {
        [behavior initializeBehaviorWithViewController:self];
    }
}

- (id <KMYViewControllerBehaving>)behavior {
    return self.behaviors.firstObject;
}

@end















































