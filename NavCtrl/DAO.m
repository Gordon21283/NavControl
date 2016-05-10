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

// Make the DAO a singleton
- (id)init {
    if (self = [super init]) {
        [self getAllCompanyAndProducts];
    }
    return self;
}

+ (id)sharedManager {
    //ensures object is created only once
    @synchronized(self) {
        if(sharedMyManager == nil)
            sharedMyManager = [[super allocWithZone:NULL] init];
    }
    return sharedMyManager;
}

-(void)getAllCompanyAndProducts {
    
    self.companylist = [[NSMutableArray alloc]init];
    
    NSMutableArray *appleProductsArray = [[NSMutableArray alloc]init];
    
    [appleProductsArray addObject:[[Product alloc]initWithCompanyid:1 withProductName:@"iPad" withProductURL:@"http://www.apple.com/ipad/"]];
    
    [appleProductsArray addObject:[[Product alloc]initWithCompanyid:1 withProductName:@"IPod Touch" withProductURL:@"http://www.apple.com/ipod-touch/"]];
    
    [appleProductsArray addObject:[[Product alloc]initWithCompanyid:1 withProductName:@"IPhone" withProductURL:@"http://www.apple.com/iphone/"]];
    
    // Samsung products
    NSMutableArray *samsungProductsArray = [[NSMutableArray alloc]init];
    
    [samsungProductsArray addObject:[[Product alloc]initWithCompanyid:2 withProductName:@"Galaxy S4" withProductURL:@"http://www.gsmarena.com/samsung_i9500_galaxy_s4-5125.php"]];
    
    [samsungProductsArray addObject:[[Product alloc]initWithCompanyid:2 withProductName:@"Galaxy Note" withProductURL:@"http://www.gsmarena.com/samsung_galaxy_note5-7431.php"]];
    
    [samsungProductsArray addObject:[[Product alloc]initWithCompanyid:2 withProductName:@"Galaxy Tab" withProductURL:@"http://www.gsmarena.com/samsung_p1000_galaxy_tab-3370.php"]];
    
    // HTC products
    NSMutableArray *htcProductsArray = [[NSMutableArray alloc]init];
    
    [htcProductsArray addObject:[[Product alloc]initWithCompanyid:3 withProductName:@"HTC 10" withProductURL: @"http://www.htc.com/us/smartphones/htc-10/"]];
    
    [htcProductsArray addObject:[[Product alloc]initWithCompanyid:3 withProductName:@"HTC One A9" withProductURL:@"http://www.htc.com/us/smartphones/htc-one-a9/"]];
    
    [htcProductsArray addObject:[[Product alloc]initWithCompanyid:3 withProductName:@"HTC One M9" withProductURL:@"http://www.htc.com/us/smartphones/htc-one-m9/"]];
    
    //  Google products
    
    NSMutableArray *googleProductsArray = [[NSMutableArray alloc]init];
    
    [googleProductsArray addObject:[[Product alloc]initWithCompanyid:4 withProductName:@"Nexus 6P" withProductURL: @"https://store.google.com/product/nexus_6p"]];
    
    [googleProductsArray addObject:[[Product alloc]initWithCompanyid:4 withProductName:@"Nexus 5X" withProductURL:@"https://store.google.com/product/nexus_5x"]];
    [googleProductsArray addObject:[[Product alloc]initWithCompanyid:4 withProductName:@"Pixel C" withProductURL:@"https://store.google.com/product/pixel_c"]];
    
    self.companylist = [[NSMutableArray alloc]init];
    
    [self.companylist addObject:[[Company alloc]initWithCompanyName:@"Apple" withCompanyLogo:@"Apple_logo.png" withCompanyProducts:appleProductsArray]];
    
    [self.companylist addObject:[[Company alloc]initWithCompanyName:@"Samsung" withCompanyLogo:@"Samsung_logo.png" withCompanyProducts:samsungProductsArray]];
    
    [self.companylist addObject:[[Company alloc]initWithCompanyName:@"HTC" withCompanyLogo:@"HTC_logo.png" withCompanyProducts:htcProductsArray]];
    
    [self.companylist addObject:[[Company alloc]initWithCompanyName:@"Google" withCompanyLogo: @"Google_logo.png" withCompanyProducts:googleProductsArray]];
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
