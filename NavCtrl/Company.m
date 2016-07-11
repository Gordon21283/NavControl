//
//  Company.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

-(instancetype)initWithCompanyName:(NSString *)companyName andCompanyLogo:(NSString *)companyLogo andstockSymbol:(NSString *)stockSymbol{
 
    self.companyName = companyName;
    self.companyLogo = companyLogo;
    self.stockSymbol = stockSymbol;
    self.companyProducts = [[NSMutableArray alloc]init]; 

    return self;
}



@end
