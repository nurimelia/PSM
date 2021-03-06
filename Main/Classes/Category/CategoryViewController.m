//
//  CategoryViewController.m
//  E-Report for iOS
//
//  Created by Nur Imelia on 08/03/15.
//  Copyright (c) 2015 Nur Imelia. All rights reserved.
//


#import "ChecklistItem.h"
#import "CategoryViewController.h"
#import "ListViewController.h"



@interface CategoryViewController () 





@end



#import "Checklist.h"




@implementation CategoryViewController {
    NSMutableArray *lists;

    
    
}


@synthesize dataModel;

@synthesize adMobView;


            
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        self.dataModel = [[DataModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:
                                     [UIImage imageNamed:@"background.png"]];
    

    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
    self.title = @"Category";

    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                   initWithImage:[UIImage imageNamed:@"cancel.png"]
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(back)];
    
    
    self.navigationItem.leftBarButtonItem = backButton;
  
    
    


    
    GADAdSize adSize = [self adSizeForOrientation:self.interfaceOrientation];
    bannerView_ = [[GADBannerView alloc] initWithAdSize:adSize];
    
    
    bannerView_.adUnitID = MY_BANNER_UNIT_ID;
    
    bannerView_.rootViewController = self;
    [self.adMobView addSubview:bannerView_];

    [self.tableView setTableHeaderView:adMobView];

    [bannerView_ loadRequest:[GADRequest request]];
    
    
    
}



- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)orientation
                                         duration:(NSTimeInterval)duration {
    bannerView_.adSize = [self adSizeForOrientation:orientation];
}





- (GADAdSize)adSizeForOrientation:(UIInterfaceOrientation)orientation {
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        return kGADAdSizeSmartBannerLandscape;
    }
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return kGADAdSizeSmartBannerPortrait;
    } else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        return kGADAdSizeBanner;
    }
    
    return kGADAdSizeBanner;
}





/*
 
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    id objectToMove = [dataModel.lists objectAtIndex:fromIndexPath.row];
    [dataModel.lists  removeObjectAtIndex:fromIndexPath.row];
    [dataModel.lists  insertObject:objectToMove atIndex:toIndexPath.row];
    [tableView reloadData];
    
}

 */




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
    int index = [self.dataModel indexOfSelectedChecklist];
    if (index >= 0 && index < [self.dataModel.lists count]) {
        Checklist *checklist = [self.dataModel.lists objectAtIndex:index];
        [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
    }
}


                 
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(
                                                                       NSInteger)section
{
    return [self.dataModel.lists count];
    
}


- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    //label.text = item.text;
    label.text = [NSString stringWithFormat:@"%d: %@", item.itemId, item.text];
 
//label.text = [NSString stringWithFormat:@"%@: %@", item.notes, item.text];
    
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //  [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    cell.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageNamed:@"category.png"]];
    
   //  cell.backgroundColor = [UIColor whiteColor];
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Checklist *checklist = [self.dataModel.lists objectAtIndex:indexPath.row];
    cell.textLabel.text = checklist.category;
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
       
     

    cell.imageView.image = [UIImage imageNamed:checklist.iconName];
    
    UIImage *image = [UIImage   imageNamed:@"ipad-arrow"];
                      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                      CGRect frame = CGRectMake(60.0, 60.0, image.size.width, image.size.height);
                      button.frame = frame;
                      [button setBackgroundImage:image forState:UIControlStateNormal];
                      
                      [button addTarget:self action:@selector(accessoryButtonTapped:event:)  forControlEvents:UIControlEventTouchUpInside];
                      button.backgroundColor = [UIColor clearColor];
                      cell.accessoryView = button;
                      
                      
    return cell;
    
    
    
    

}



- (void)accessoryButtonTapped:(id)sender event:(id)event
{
	NSSet *touches = [event allTouches];
	UITouch *touch = [touches anyObject];
	CGPoint currentTouchPosition = [touch locationInView:self.tableView];
	NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint: currentTouchPosition];
	if (indexPath != nil)
		
	{
        [self tableView: self.tableView accessoryButtonTappedForRowWithIndexPath: indexPath];
	}
}





- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{

    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];


}


    

    


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath
                                                                    *)indexPath
{
    [self.dataModel setIndexOfSelectedChecklist:indexPath.row];
    Checklist *checklist = [self.dataModel.lists objectAtIndex:indexPath.row];
     [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
     }





- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self) {
        [self.dataModel setIndexOfSelectedChecklist:-1];
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ListViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    } else if ([segue.identifier isEqualToString:@"AddChecklist"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        CategoryDetailViewController *controller = (CategoryDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }

}




- (void)listDetailViewControllerDidCancel:(CategoryDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)listDetailViewController:(CategoryDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist
{
    [self.dataModel.lists addObject:checklist];
//    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)listDetailViewController:(CategoryDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist
{
//    [self.dataModel sortChecklists];
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}








- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    
    UINavigationController *navigationController = [self.storyboard
                                                    instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    CategoryDetailViewController *controller = (CategoryDetailViewController *)
    navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = [self.dataModel.lists objectAtIndex:indexPath.row];
    
    controller.checklistToEdit = checklist;
    [self presentViewController:navigationController animated:YES completion:nil
     ];
}




  

// Implementation of Pull to add new item. It will trigger the performsegueidentifier method. and also it will release the refresh control property.

- (void)refresh
{
    [self performSegueWithIdentifier:@"AddChecklist" sender:self];

    [self.refreshControl endRefreshing];

}


-(void)back
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}



@end
