//
//  BookTOCViewController.h
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTOCViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSString *bookURL;
@property (nonatomic, retain) NSMutableArray *articleList;
@property (nonatomic, retain) NSData *articleData;
@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableOfContentsTableView;

@property (nonatomic, strong) NSString *bookTitleString;
@property (nonatomic, strong) NSString *bookAuthorString;

- (void)fetchArticlesWithAPIKey;

@end
