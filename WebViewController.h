//
//  WebViewController.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/6/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WebViewController : UIViewController

//@property (retain, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSString *myCompanyProductsURL;

@property (strong, nonatomic) WKWebView *webView; 

@end
