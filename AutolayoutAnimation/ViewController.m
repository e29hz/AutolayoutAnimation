//
//  ViewController.m
//  AutolayoutAnimation
//
//  Created by 鄂鸿桢 on 16/3/23.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "ViewController.h"
#import "HomePageAnimationTool.h"
#import "ReactiveCocoa.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldBottomLineConstraints;
@property (weak, nonatomic) IBOutlet UIImageView *phoneIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomTipsView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

#pragma mark - Life Cycle
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _topTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _bottomTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _textFieldBottomLineConstraints.constant = 0;
    _phoneIconImageView.transform = CGAffineTransformMakeTranslation(-100, 0);
    
    [self.phoneNumberTextField.rac_textSignal subscribeNext:^(id x) {
        if (self.phoneNumberTextField.text.length == 11) {
            self.loginButton.userInteractionEnabled = YES;
        } else {
            self.loginButton.userInteractionEnabled = NO;
        }
        CGFloat progress = self.phoneNumberTextField.text.length / 11.0;
        [HomePageAnimationTool registerButtonWidthAnimation:_loginButton withView:self.view andProgress:progress];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [HomePageAnimationTool titleLabelAnimationWithLabel:_topTitleLabel withView:self.view];
    [HomePageAnimationTool titleLabelAnimationWithLabel:_bottomTitleLabel withView:self.view];
    
    [HomePageAnimationTool textFieldBottomLineAnimationWithConstraint:_textFieldBottomLineConstraints withView:self.view];
   
    [HomePageAnimationTool phoneIconAnimationWithLabel:_phoneIconImageView withView:self.view];
    
    [HomePageAnimationTool tipsLabelMaskAnimation:_topTipsLabel withBeginTime:0];
    [HomePageAnimationTool tipsLabelMaskAnimation:_bottomTipsView withBeginTime:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - override view method
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
