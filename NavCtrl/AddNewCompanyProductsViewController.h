//
//  AddNewCompanyProductsViewController.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/12/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Product.h"
#import "Company.h"


@interface AddNewCompanyProductsViewController : UIViewController

@property (retain, nonatomic) DAO *dao;
@property (retain, nonatomic) Company *currentCompany;
@property (retain, nonatomic) Product *addProduct;

// add placeholder text 

@property (retain, nonatomic) IBOutlet UITextField *addNewProductName;
@property (retain, nonatomic) IBOutlet UITextField *addNewProductImage;
@property (retain, nonatomic) IBOutlet UITextField *addNewProductURL;

- (IBAction)saveNewProductButton:(id)sender;


@end
