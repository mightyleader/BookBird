//
//  HKFirstViewController.h
//  BookBird
//
//  Created by Rob Stearn on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKFirstViewController : UIViewController //<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) NSMutableArray *books;
@property (nonatomic, retain) NSData *requestData;
@property (nonatomic, strong) NSError *error;
@property (weak, nonatomic) IBOutlet UICollectionView *theCollectionView;
@property (weak, nonatomic) IBOutlet UIToolbar *navBar;

- (void)fetchBooksWithAPIKey;

@end
