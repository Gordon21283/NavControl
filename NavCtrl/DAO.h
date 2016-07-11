//
//  DAO.h
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Product.h"
#import <sqlite3.h>

@interface DAO : NSObject

@property (nonatomic, retain) NSMutableArray  *companyList;

+(id)sharedManager;
//-(void)getAllCompanyAndProducts;
-(void)createNewCompany:(NSString *)CompanyName andlogo:(NSString *)logo andstockSymbol:(NSString *)stockSymbol;
-(void)createNewProduct:(NSString *)productName andimage:(NSString *)image andurl:(NSString *)url andCompanyId:(int)companyId;

// dao has 4 methods *Create XRead *Update *Delete

-(void)createDatabase;
-(void)populateCompanylistFromSQLData;
-(void)deleteCompanyFromSQL:(int) companyID;
-(void)deleteProductFromSQL:(int) productID;
-(void)editCompany:(Company *)company;
-(void)editProudct:(Product *)product; 


@end
