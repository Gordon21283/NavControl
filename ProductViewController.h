//
//  ProductViewController.h
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *products;

@property (nonatomic, retain) NSMutableArray *appleProducts;
@property (nonatomic, retain) NSMutableArray *samsungProducts;
@property (nonatomic, retain) NSMutableArray *htcProducts;
@property (nonatomic, retain) NSMutableArray *googleProducts;


@end
