//
//  HKSecondViewController.h
//  BookBird
//
//  Created by Rob Stearn on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKSecondViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSString *chapterID;
@property (nonatomic, retain) NSMutableArray *people;
@property (nonatomic, retain) NSMutableArray *places;
@property (nonatomic, retain) NSMutableArray *feelings;
@property (nonatomic, retain) NSMutableArray *events;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITableView *theTableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;


@end
