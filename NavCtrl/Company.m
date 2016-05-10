//
//  Company.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

-(instancetype)initWithCompanyName:(NSString *)companyName withCompanyLogo:(NSString *)companyLogo withCompanyProducts:(NSMutableArray *)companyProducts {
 
    self.companyName = companyName;
    self.companyLogo = companyLogo;
    self.companyProducts = companyProducts;

    return self;
}



@end
