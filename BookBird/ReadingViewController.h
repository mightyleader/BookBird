//
//  ReadingViewController.h
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadingViewController : UIViewController

@property (nonatomic, retain) NSString *articleURL;
@property (nonatomic, retain) NSData *articleData;
@property (nonatomic, retain) NSMutableDictionary *articleContent;
@property (nonatomic, retain) NSMutableArray *people;
@property (nonatomic, retain) NSMutableArray *places;
@property (nonatomic, retain) NSMutableArray *events;
@property (nonatomic, retain) NSMutableArray *emotions;
@property (weak, nonatomic) IBOutlet UIWebView *readingContentWebView;
@property (weak, nonatomic) IBOutlet UITableView *elementsTableView;


- (void)fetchArticleWithAPIKey;
- (void)addEntryPressed:(id)sender;

@end
