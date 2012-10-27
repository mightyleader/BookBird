//
//  HKSecondViewController.m
//  BookBird
//
//  Created by Rob Stearn on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "HKSecondViewController.h"

@interface HKSecondViewController ()

@end

@implementation HKSecondViewController

@synthesize chapterID, people, places, feelings, events, webView, theTableView, navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    self.title = NSLocalizedString(@"Second", @"Second");
    self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark TABLE VIEW DELEGATE & DATA SOURCE METHODS
-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 1; //TODO: Replace with data from the arrays
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
  return 4;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
}

- (NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
  return @"";
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
}



@end
