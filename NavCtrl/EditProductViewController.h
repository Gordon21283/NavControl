//
//  EditProductViewController.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/13/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Product.h"

@interface EditProductViewController : UIViewController

@property (retain, nonatomic) DAO *dao;
@property (retain, nonatomic) Product *productToEdit;

@property (retain, nonatomic) IBOutlet UITextField *editProductName;
@property (retain, nonatomic) IBOutlet UITextField *editProductImage;
@property (retain, nonatomic) IBOutlet UITextField *editProductURL;

- (IBAction)saveEditProductButton:(id)sender;



@end
