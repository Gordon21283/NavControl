//
//  AddNewCompanyViewController.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/11/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO.h"
#import "Company.h"

@interface AddNewCompanyViewController : UIViewController

@property (retain, nonatomic) DAO *dao;
@property (retain, nonatomic) Company *addCompany;

// add placeholder text 
@property (retain, nonatomic) IBOutlet UITextField *addNewCompany;
@property (retain, nonatomic) IBOutlet UITextField *addCompanyLogo;
@property (retain, nonatomic) IBOutlet UITextField *addCompanyStockSymbol;


- (IBAction)saveButton:(id)sender;


@end
