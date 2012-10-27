//
//  LibraryViewController.h
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryViewController : UIViewController

@property (nonatomic, strong) NSData *requestData;
@property (nonatomic, strong) NSMutableArray *books;

- (void)fetchBooksWithAPIKey;

@end
