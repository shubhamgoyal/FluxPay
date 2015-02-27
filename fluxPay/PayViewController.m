//
//  PayViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/27/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()
@property (weak, nonatomic) IBOutlet UIButton *payButton;
@property (weak, nonatomic) IBOutlet UIButton *transferButton;

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _payButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _payButton.layer.cornerRadius = 5;
    _payButton.layer.borderWidth = 1;
    
    _transferButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _transferButton.layer.cornerRadius = 5;
    _transferButton.layer.borderWidth = 1;
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BG1"]];
    
    [self.view insertSubview:imageView atIndex:0];
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * view = [[UIVisualEffectView alloc] initWithEffect:blur];
    view.frame = self.view.bounds;
    [self.view insertSubview:view atIndex:1];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
