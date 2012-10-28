//
//  BookTOCViewController.h
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTOCViewController : UIViewController

@property (nonatomic, retain) NSString *bookURL;
@property (nonatomic, retain) NSMutableArray *articleList;
@property (nonatomic, retain) NSData *articleData;

- (void)fetchArticlesWithAPIKey;

@end
