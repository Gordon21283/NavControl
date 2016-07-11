//
//  AddNewCompanyViewController.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/11/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddNewCompanyViewController.h"
#import "Company.h"
#import "Product.h"

@interface AddNewCompanyViewController ()

@end

@implementation AddNewCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.addNewCompany.text = @"Microsoft";
    self.addCompanyLogo.text = @"Microsoft_logo.png";
    self.addCompanyStockSymbol.text = @"MSFT";

        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {

    [[DAO sharedManager] createNewCompany:self.addNewCompany.text andlogo:self.addCompanyLogo.text andstockSymbol:self.addCompanyStockSymbol.text];

    
    [self.navigationController popToRootViewControllerAnimated:YES];
}



- (void)dealloc {
    [_addNewCompany release];
    [_addCompanyLogo release];
    [_addCompanyStockSymbol release];
    [super dealloc];
}
    

@end
