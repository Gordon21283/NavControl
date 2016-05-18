//
//  ProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ProductViewController.h"
#import "WebViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.appleProducts = [NSMutableArray arrayWithObjects:@"iPad", @"iPod Touch", @"iPhone", nil];
    self.samsungProducts = [NSMutableArray arrayWithObjects:@"Galaxy S4", @"Galaxy Note", @"Galaxy Tab", nil];
    self.htcProducts = [NSMutableArray arrayWithObjects:@"HTC 10", @"HTC One A9", @"HTC One M9", nil];
    self.googleProducts = [NSMutableArray arrayWithObjects:@"Nexus 6P",@"Nexus 5X", @"Pixel C", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([self.title isEqualToString:@"Apple"])
    {
        self.products = self.appleProducts;
    }
    else if ([self.title isEqualToString:@"Samsung"])
    {
        self.products = self.samsungProducts;
    }
    else if ([self.title isEqualToString:@"HTC"])
    {
        self.products = self.htcProducts;
    }
    else
        self.products = self.googleProducts;
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
    
    // fixes the issue when adding the image to the products would match
    NSString *productName = [self.products objectAtIndex:[indexPath row]];
    
    if ([productName isEqualToString:@"iPad"]) {
        cell.imageView.image = [UIImage imageNamed:@"iPad.png"];
    }
    else if ([productName isEqualToString:@"iPod Touch"]) {
        cell.imageView.image = [UIImage imageNamed:@"iPod_Touch.png"];
    }
    else if ([productName isEqualToString:@"iPhone"]) {
        cell.imageView.image = [UIImage imageNamed:@"iPhone.png"];
    }
    else if ([productName isEqualToString:@"Galaxy S4"]) {
        cell.imageView.image = [UIImage imageNamed:@"Galaxy_S4.png"];
    }
    else if ([productName isEqualToString:@"Galaxy Note"]) {
        cell.imageView.image = [UIImage imageNamed:@"Galaxy_Note.png"];
    }
    else if ([productName isEqualToString:@"Galaxy Tab"]) {
        cell.imageView.image = [UIImage imageNamed:@"Galaxy_Tab.png"];
    }
    else if ([productName isEqualToString:@"HTC 10"]) {
        cell.imageView.image = [UIImage imageNamed:@"HTC_10.png"];
    }
    else if ([productName isEqualToString:@"HTC One A9"]) {
        cell.imageView.image = [UIImage imageNamed:@"HTC_One_A9.png"];
    }
    else if ([productName isEqualToString:@"HTC One M9"]) {
        cell.imageView.image = [UIImage imageNamed:@"HTC_One_M9.png"];
    }
    else if ([productName isEqualToString:@"Nexus 6P"]) {
        cell.imageView.image = [UIImage imageNamed:@"Nexus_6P.png"];
    }
    else if ([productName isEqualToString:@"Nexus 5X"]) {
        cell.imageView.image = [UIImage imageNamed:@"Nexus_5X.png"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"Pixel_C.png"];
    }
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

#pragma mark - Add and Delete rows from Product Table view

 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
     [self.products removeObjectAtIndex: indexPath.row]; 
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }

#pragma mark - Rearranging Product Table View

 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
     NSString *stringToMove = [self.products objectAtIndex:fromIndexPath.row];
     [self.products removeObjectAtIndex:fromIndexPath.row];
     [self.products insertObject:stringToMove atIndex:toIndexPath.row];

 }


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
  //Navigation logic may go here, for example:
  //Create the next view controller.
 WebViewController *detailViewController = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
 
  // Pass the selected object to the new view controller.
     
  if ([[self.products objectAtIndex: indexPath.row]  isEqualToString:@"iPad"]) {         detailViewController.myCompanyProductsURL = @"http://www.apple.com/ipad/";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"iPod Touch"]) {
      detailViewController.myCompanyProductsURL = @"http://www.apple.com/ipod-touch/";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"iPhone"]) {
      detailViewController.myCompanyProductsURL = @"http://www.apple.com/iphone/";
  }
  else if ([[self.products objectAtIndex:indexPath.row]isEqualToString:@"Galaxy S4"]) {
      detailViewController.myCompanyProductsURL = @"http://www.gsmarena.com/samsung_i9500_galaxy_s4-5125.php";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Galaxy Note"]) {
      detailViewController.myCompanyProductsURL = @"http://www.gsmarena.com/samsung_galaxy_note5-7431.php";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Galaxy Tab"]) {
      detailViewController.myCompanyProductsURL = @"http://www.gsmarena.com/samsung_p1000_galaxy_tab-3370.php";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"HTC 10"]) {
      detailViewController.myCompanyProductsURL = @"http://www.htc.com/us/smartphones/htc-10/";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"HTC One A9"]) {
      detailViewController.myCompanyProductsURL = @"http://www.htc.com/us/smartphones/htc-one-a9/";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"HTC One M9"]) {
      detailViewController.myCompanyProductsURL = @"http://www.htc.com/us/smartphones/htc-one-m9/";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Nexus 6P"]) {
      detailViewController.myCompanyProductsURL = @"https://store.google.com/product/nexus_6p";
  }
  else if ([[self.products objectAtIndex:indexPath.row] isEqualToString:@"Nexus 5X"]) {
      detailViewController.myCompanyProductsURL = @"https://store.google.com/product/nexus_5x";
  }
  else {
      detailViewController.myCompanyProductsURL = @"https://store.google.com/product/pixel_c";
  }
    
     
  // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 


@end
