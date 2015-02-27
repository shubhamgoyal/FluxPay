//
//  ViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/25/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldEffects.h"
#import <APNumberPad.h>

#import <APNumberPadStyle.h>
#import "APDarkPadStyle.h"



@interface ViewController ()<APNumberPadStyle>
@property (weak, nonatomic) IBOutlet UITextField *NumberField;
@property (weak, nonatomic) IBOutlet UITextField *moneyField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *notifButton;
@property (weak, nonatomic) IBOutlet UITextField *currencyField;

@end

@implementation ViewController


- (UIColor *)numberPadBackgroundColor
{
    return [UIColor clearColor];
    
}

- (UIColor *)numberButtonBackgroundColor
{
    return [UIColor clearColor];

}
- (IBAction)notifButtonPressed:(id)sender {
    
    UILocalNotification * notification = [[UILocalNotification alloc] init];
    NSDate * dateWithTenSecsFromNow = [[NSDate alloc]  initWithTimeIntervalSinceNow:20];
    
    notification.fireDate = dateWithTenSecsFromNow;
    
    notification.alertBody = [NSString stringWithFormat:@"You have paid %@ %@?", _NumberField.text ,_moneyField.text  ];
    notification.alertAction = @"Confirmation";
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BG1"]];
    
    [self.view insertSubview:imageView atIndex:0];
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView * view = [[UIVisualEffectView alloc] initWithEffect:blur];
    view.frame = self.view.bounds;
    [self.view insertSubview:view atIndex:1];
    self.NumberField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.moneyField.keyboardAppearance = UIKeyboardAppearanceDark;
    self.currencyField.keyboardAppearance = UIKeyboardAppearanceDark;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - keyboard movements
- (void)keyboardWillShow:(NSNotification *)notification
{
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = -keyboardSize.height;
        self.view.frame = f;
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect f = self.view.frame;
        f.origin.y = 0.0f;
        self.view.frame = f;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)numberPad:(APNumberPad *)numberPad functionButtonAction:(UIButton *)functionButton textInput:(UIResponder<UITextInput> *)textInput {
    [textInput insertText:@"#"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_NumberField endEditing:YES];
    [_moneyField endEditing:YES];
    [_currencyField endEditing:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
@end
