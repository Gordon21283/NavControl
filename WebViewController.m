//
//  WebViewController.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/6/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

// UIWebview load url;
    
//    NSURL *url = [NSURL URLWithString:self.myCompanyProductsURL];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:urlRequest];
    
// WkWebView
    
    NSURL *url = [[NSURL alloc]initWithString: self.myCompanyProductsURL];
    _webView = [[WKWebView alloc]initWithFrame: self.view.frame];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:_webView];
    
 
}




- (void)dealloc {
    [_webView release];
    [super dealloc];
}
@end
