//
//  EditCompanyViewController.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/13/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "EditCompanyViewController.h"
#import "CompanyViewController.h"

@interface EditCompanyViewController ()

@end

@implementation EditCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.editCompanyName.text = self.companyToEdit.companyName;
    self.editCompanyLogo.text = self.companyToEdit.companyLogo;
    self.dao = [DAO sharedManager]; 
}


- (IBAction)SaveEditCompanyButton:(id)sender {
    
    self.companyToEdit.companyName = self.editCompanyName.text;
    self.companyToEdit.companyLogo = self.editCompanyLogo.text;
    
    // Edit Company from SQL 
    [self.dao editCompany:self.companyToEdit];


    [self.navigationController popViewControllerAnimated:YES];
    
    // pop view controller or // pop to root view controller

}


- (void)dealloc {
    [_editCompanyName release];
    [_editCompanyLogo release];
    [super dealloc];
}
@end
