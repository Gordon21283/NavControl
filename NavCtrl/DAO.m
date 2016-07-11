//
//  DAO.m
//  NavCtrl
//
//  Created by Gordon Kung on 5/9/16.
//  Copyright © 2016 Aditya Narayan. All rights reserved.
//

#import "DAO.h"
#import "Company.h"
#import "Product.h"

static DAO *sharedMyManager = nil;


@implementation DAO
{
    sqlite3 *database;
    NSString *dbPathString;
}

#pragma mark Singleton Method

- (id)init {
    if (self = [super init]) {
        
        [self createDatabase];
        [self populateCompanylistFromSQLData];
    }
    return self;
}

+ (id)sharedManager {
    //ensures object is created only once
    //    @synchronized(self) {
    if(sharedMyManager == nil){
        sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}

#pragma mark Create SQLiteDatabase
-(void)createDatabase {
    
    // Get path to current document and add database
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [path objectAtIndex:0];
    dbPathString = [docPath stringByAppendingPathComponent:@"NavigationControl.db"];
    NSLog(@"%@", dbPathString);
    
    // Creates an NSFileManager instance and subsequently uses it to detect if the database file already exists.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // Check to see if the database exists in the documents directory
    if (![fileManager fileExistsAtPath:dbPathString]){
        // If database is not there, copy it from the bundle to the document directory
        NSError *error = nil;
        NSString *bundleDBPath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"NavigationControl.db"];
        [fileManager copyItemAtPath:bundleDBPath toPath:dbPathString error:&error];
    }
    else
    {
        NSLog(@"Database exists");
    }
    
    self.companyList = [[NSMutableArray alloc]init];

    
}

-(void)populateCompanylistFromSQLData {
    
    // All SQL must be converted into prepared statement before it can be run
    sqlite3_stmt *statement;
    
    // Open database to access it; Check if successfully opened
    if (sqlite3_open([dbPathString UTF8String], &database)== SQLITE_OK) {
        
        // Create query to select all company data to populate list
        NSString *querySQLCompanies = [NSString stringWithFormat:@"SELECT * FROM Company"];
        // Convert an NSString to C string
        const char *query_sql = [querySQLCompanies UTF8String];
        // Run query through database
        if (sqlite3_prepare_v2(database, query_sql, -1, &statement, NULL)== SQLITE_OK)
        {
            // While there are rows, SQL will be converted to a statement
            while (sqlite3_step(statement)== SQLITE_ROW)
            {
                // Initialize company object
                Company *company = [[Company alloc]init];
                
                // Populate company object with database info
                company.companyName = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                company.companyLogo = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                company.stockSymbol = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
                
                // NSInteger companyId =
                int companyId = sqlite3_column_int(statement, 0);
                company.companyid = companyId;
                
                // Call with argument company id
                company.companyProducts = [self populateProductsFromSQLData:companyId];
                
                [self.companyList addObject:company];
                
            }
            
        }
        
    }
    
    sqlite3_close(database);
}

-(NSMutableArray *)populateProductsFromSQLData:(NSUInteger)companyId {
    
    NSMutableArray *tempProductArray = [[NSMutableArray alloc]init];
    
    // All SQL must be converted into prepared statement before it can be run
    sqlite3_stmt *statement;
    
    // Query 'companyId' from SQLdatabases
    NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM Product WHERE companyId = %lu",companyId];
    
    // Convert an NSString to C string
    const char *query_sql = [querySQL UTF8String];
    // Run query through database
    if (sqlite3_prepare_v2(database, query_sql, -1, &statement, NULL)== SQLITE_OK) {
        // While there are rows, SQL will be converted to a statement
        while (sqlite3_step(statement)== SQLITE_ROW) {
            // Initialize product object
            Product *product = [[Product alloc]init];
            product.productID = sqlite3_column_int(statement, 0);
            product.companyid = sqlite3_column_int(statement, 1);
            product.productName = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
            product.productImage = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 3)];
            product.productURL = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 4)];
            
            [tempProductArray addObject:product];
            
        }
    }
    return tempProductArray;
}


-(void)createNewCompany:(NSString *)companyName andlogo:(NSString *)logo andstockSymbol:(NSString *)stockSymbol {
    
    Company *newCompany = [[Company alloc]initWithCompanyName:companyName andCompanyLogo:logo andstockSymbol:stockSymbol];
    
    // Add new company using SQL
    NSString *querySQL = [NSString stringWithFormat:@"INSERT INTO Company (CompanyName, CompanyLogo, StockSymbol) VALUES ('%@', '%@', '%@')", companyName, logo, stockSymbol];
    NSLog(@"%@" , querySQL);

    if (sqlite3_exec(database, [querySQL UTF8String], NULL, NULL, NULL) == SQLITE_OK)
    {
        NSLog(@"save");
    }
    else {
        NSLog(@"error saving");
    }
    
    [self.companyList addObject: newCompany];
    
}

-(void)createNewProduct:(NSString *)productName andimage:(NSString *)image andurl:(NSString *)url andCompanyId:(int)companyId {
    
    int productCount=0;
    for(Company *company in self.companyList){
        productCount += company.companyProducts.count;
    }
    
    Product *newProduct = [[Product alloc]initWithCompanyid:companyId andProductName: productName andProductImage:image andProductURL:url andProductID:productCount+1];
    
    // Add new product using SQL
    NSString *querySQL = [NSString stringWithFormat:@"INSERT INTO Product (productName, productImage, productURL, companyId) VALUES ('%@', '%@', '%@', '%d')", productName, image, url, companyId];
    
    if (sqlite3_exec(database, [querySQL UTF8String], NULL, NULL, NULL) == SQLITE_OK)
    {
        NSLog(@"save");
    }
    else {
        NSLog(@"error saving");
    }
    
    for(int i = 0; i < self.companyList.count; i++) {
        
        if ([self.companyList[i] companyid] == newProduct.companyid) {
            [[self.companyList[i] companyProducts] addObject:newProduct];
        }
    }
}

#pragma mark - Delete using SQL
-(void)deleteCompanyFromSQL:(int) companyID {
    char *error;
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM Company WHERE id = '%d'", companyID];
    
    // Execute query
    if (sqlite3_exec(database, [deleteQuery UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"company deleted");
    }
}

-(void)deleteProductFromSQL:(int) productID {
    char *error;
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM Product WHERE id = '%d'", productID];
    
    // Execute query
    if (sqlite3_exec(database, [deleteQuery UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"product deleted");
    } else {
        NSLog(@"%s", error); 
    }
}

#pragma mark - Update Using SQL
-(void)editCompany:(Company *)company {
    char *error;
    NSString *editQuery = [NSString stringWithFormat:@"UPDATE Company SET companyName = '%@', companyLogo = '%@' WHERE id = '%d'", company.companyName, company.companyLogo, company.companyid];
    
    // Execute query
    if (sqlite3_exec(database,[editQuery UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"Company has been updated");
    } else {
        NSLog(@"%s", error);
    }
}

-(void)editProudct:(Product *)product {
    char *error;
    NSString *editQuery = [NSString stringWithFormat:@"UPDATE Product SET productName = '%@', productImage = '%@', productURL = '%@' WHERE id = '%d'", product.productName, product.productImage, product.productURL, product.productID];
    
    // Execute query
    if (sqlite3_exec(database,[editQuery UTF8String], NULL, NULL, &error) == SQLITE_OK) {
        NSLog(@"Product has been updated");
    } else {
        NSLog(@"%s", error);
    }
}
 
+ (id)allocWithZone:(NSZone *)zone {
    return [[self sharedManager] retain];
}


-(id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return self;
}

- (oneway void)release {
    // never release
}
- (id)autorelease {
    return self;
}

- (void)dealloc {
    [super dealloc];
    
}

@end
