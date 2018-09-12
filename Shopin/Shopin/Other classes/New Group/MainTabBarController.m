//
//  MainTabBarController.m
//  Munch Scout
//
//  Created by Golden Work on 3/9/17.
//  Copyright © 2017 GoldenWork Ltd. All rights reserved.
//

#import "MainTabBarController.h"

@implementation MainTabBarController{
    
}

- (void) viewDidLoad{
    [super viewDidLoad];
    [self setLayout];
}

-(void)setLayout{
    self.delegate = self;
    [[UITabBar appearance] setSelectionIndicatorImage:[[UIImage alloc] init]];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = 50;
    tabFrame.origin.y = self.view.frame.size.height - 50;
    self.tabBar.frame = tabFrame;
    
    CGFloat height = 50;
    CGRect frame = CGRectMake(0, 0, width, height);
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    backView.layer.shadowColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:66.f/255 green:213.f/255 blue:255.f/255 alpha:1.0]);
    backView.layer.shadowOffset = CGSizeMake(2, 2);
    backView.layer.shadowOpacity = 0.5;
    backView.layer.shadowRadius = 1.0;
    
    tabWidth = width/4;
    NSArray *imageNames = @[@"Home", @"Wishlist", @"My cart", @"Profile"];
    
    for (int i = 0 ; i < 4; i++){
        UIButton *btnTab = [[UIButton alloc] initWithFrame:CGRectMake(tabWidth * i, 0, tabWidth, height)];
        btnTab.tag = i + 100;
        if (i == 0){
            btnTab.selected = YES;
            previousBtnNo = i;
        }
        [btnTab setBackgroundColor:[UIColor colorWithRed:66.f/255 green:213.f/255 blue:255.f/255 alpha:1.0]];
        [btnTab setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_%@_False.png",imageNames[i]]] forState:UIControlStateNormal];
        [btnTab setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_%@_True.png",imageNames[i]]] forState:UIControlStateSelected];
        [btnTab addTarget:self action:@selector(btnTabPressed:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:btnTab];
    }
    [[self tabBar] addSubview:backView];
}

-(void)btnTabPressed:(UIButton*)sender{
    NSLog(@"tab %ld", (long)[self selectedIndex]);
    if ((sender.tag - 100) != [self selectedIndex]) {
        UIButton *preButton = (UIButton *)[self.view viewWithTag:[self selectedIndex] + 100];
        preButton.selected = NO;
        UIButton *nowButton = (UIButton *)[self.view viewWithTag:[sender tag]];
        nowButton.selected = YES;
        [self setSelectedIndex:sender.tag - 100];
    }
}
@end
