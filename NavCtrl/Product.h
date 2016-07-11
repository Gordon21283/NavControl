//
//  Product.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property int companyid;

@property (nonatomic, retain) NSString *productName;
@property (nonatomic, retain) NSString *productImage;
@property (nonatomic, retain) NSString *productURL;
@property (nonatomic) int productID;


-(instancetype)initWithCompanyid:(int)companyId andProductName:(NSString *)productName andProductImage:(NSString *)productImage andProductURL:(NSString *)productURL andProductID:(int)productID;

@end
