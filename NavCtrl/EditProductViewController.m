//
//  EditProductViewController.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/13/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "EditProductViewController.h"
#import "ProductViewController.h"

@interface EditProductViewController ()

@end

@implementation EditProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dao = [DAO sharedManager];
    
    self.editProductName.text = self.productToEdit.productName;
    self.editProductImage.text = self.productToEdit.productImage;
    self.editProductURL.text = self.productToEdit.productURL;

}

- (IBAction)saveEditProductButton:(id)sender {
    
    self.productToEdit.productName = self.editProductName.text;
    self.productToEdit.productImage = self.editProductImage.text;
    self.productToEdit.productURL = self.editProductURL.text;
    
    // Edit product from SQL
    [self.dao editProudct:self.productToEdit];
    
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)dealloc {
    [_editProductName release];
    [_editProductImage release];
    [_editProductURL release];
    [super dealloc];
}

@end
