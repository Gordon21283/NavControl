//
//  Company.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property (nonatomic, retain) NSString *companyName;
@property (nonatomic, retain) NSString *companyLogo;
@property (nonatomic, retain) NSMutableArray *companyProducts;

@property int companyid;

-(instancetype)initWithCompanyName:(NSString *)companyName withCompanyLogo:(NSString *)companyLogo withCompanyProducts:(NSMutableArray *)companyProducts;

@end
