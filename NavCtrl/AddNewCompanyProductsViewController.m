//
//  AddNewCompanyProductsViewController.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "AddNewCompanyProductsViewController.h"

@interface AddNewCompanyProductsViewController ()

@end

@implementation AddNewCompanyProductsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.addNewProductName.text = @"foo";
    self.addNewProductImage.text = @"Microsoft_logo.png";
    self.addNewProductURL.text = @"http://www.yahoo.com";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveNewProductButton:(id)sender { 
    
    [[DAO sharedManager]createNewProduct:self.addNewProductName.text andimage:self.addNewProductImage.text andurl:self.addNewProductURL.text andCompanyId:self.currentCompany.companyid ];
     
     [self.navigationController popViewControllerAnimated:YES];

}


- (void)dealloc {
    [_addNewProductImage release];
    [_addNewProductName release];
    [_addNewProductURL release];
    [super dealloc];
}
@end
