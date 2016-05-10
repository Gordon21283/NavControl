//
//  Product.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype)initWithCompanyid:(int)companyid withProductName:(NSString *)productName withProductURL:(NSString *)productURL {

    self.companyid = companyid;
    self.productName = productName;
    self.productURL = productURL;
    
    return self;

}

@end
