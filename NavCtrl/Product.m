//
//  Product.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype)initWithCompanyid:(int)companyId andProductName:(NSString *)productName andProductImage:(NSString *)productImage andProductURL:(NSString *)productURL andProductID:(int)productID {

    self.companyid = companyId;
    self.productName = productName;
    self.productImage = productImage; 
    self.productURL = productURL;
    self.productID = productID;
    
    return self;

}

@end
