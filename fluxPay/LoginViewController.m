//
//  LoginViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/26/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _loginButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _loginButton.layer.cornerRadius = 1;
    _loginButton.layer.borderWidth = 1;

    

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
