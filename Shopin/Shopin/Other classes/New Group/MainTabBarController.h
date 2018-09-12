//
//  MainTabBarController.h
//  Munch Scout
//
//  Created by Golden Work on 3/9/17.
//  Copyright © 2017 GoldenWork Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController<UITabBarControllerDelegate>{
    CGFloat tabWidth;
    int previousBtnNo;
}

@property (weak, nonatomic) UIColor *selectedColor;
@property (weak, nonatomic) UIColor *unselectedColor;
-(void)setLayout;
-(void)btnTabPressed:(UIButton*)sender;
@end
