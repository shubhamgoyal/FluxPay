//
//  SecondLoginWebViewController.m
//  fluxPay
//
//  Created by Rameez Remsudeen  on 2/27/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "SecondLoginWebViewController.h"
#import <MBProgressHUD.h>
#import "RTSpinKitView.h"
#import "BillViewController.h"

@interface SecondLoginWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) NSURLRequest * oldRequest;
@property (strong, nonatomic) RTSpinKitView *spinner;
@property (strong, nonatomic)  MBProgressHUD *hud;
@property BOOL isSpinning;

@property BOOL shouldSegue;

@end

@implementation SecondLoginWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.delegate = self;
    
    [self.webView setScalesPageToFit:YES];
    
    
    NSURL * url = [[NSURL alloc] initWithString:@"http://hax.sg:8000/bank/1"];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:4.0]];
    
    [self addObserver:self forKeyPath:@"shouldSegue" options:0 context:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:<#(SEL)#> name:<#(NSString *)#> object:<#(id)#>]
    
    _shouldSegue = NO;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self && [keyPath isEqualToString: @"shouldSegue"])
    {
        BillViewController * bill = [self.storyboard instantiateViewControllerWithIdentifier:@"bill"];
        [self.navigationController pushViewController:(UIViewController *)bill animated:YES];
        NSLog(@"hji");
        
    }
}

-(void) startSpinning
{
    _spinner = [[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStylePlane color:[UIColor colorWithRed:0.466 green:0.156 blue:0.643 alpha:1.000]];
    
    _hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hud.square = YES;
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.customView = _spinner;
    _hud.dimBackground = YES;
    _hud.cornerRadius = 2;
    _hud.labelFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:20];
    _hud.color = [UIColor colorWithWhite:0.126 alpha:0.600];
    _hud.labelText = @"Loading..";
    
    [_spinner startAnimating];
    _isSpinning = YES;
}

-(void) stopSpinning
{
    _isSpinning = NO;
    [_spinner stopAnimating];
    [_hud hide:YES];
    
    
}


- (NSURLRequest *)connection: (NSURLConnection *)connection
             willSendRequest: (NSURLRequest *)request
            redirectResponse: (NSURLResponse *)redirectResponse;
{
    if (redirectResponse) {
        // we don't use the new request built for us, except for the URL
        NSURL *newURL = [request URL];
        // Previously, store the original request in _originalRequest.
        // We rely on that here!
        NSMutableURLRequest *newRequest = [_oldRequest mutableCopy];
        [newRequest setURL: newURL];
        return newRequest;
    } else {
        return request;
    }
}

- (void)updateAddress:(NSURLRequest*)request
{
    NSURL* url = [request mainDocumentURL];
    NSString* absoluteString = [url absoluteString];
//    self.addressField.text = absoluteString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma Web View Delegate Methods

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"Heyy");
    
    NSLog(@"xyy url is %@", [request mainDocumentURL]);
    
    
    if ([[[request mainDocumentURL]absoluteString] containsString:@"success"]) {
        
        _shouldSegue = YES;
        
        return NO;

        
    }
    

    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSString * currentURL = webView.request.URL.absoluteString;
    
    if ([currentURL containsString:@"success"]) {
        
//        [self startSpinning];
//    NSLog(@"sycess url is %@", currentURL);
        
        //Shift to next view
        
        //get request
        
        //dont put hp
        
        
    }
    
    else
        
    {
        NSLog(@"Fail");
        NSLog(@"%@ hello", currentURL);
    }
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
