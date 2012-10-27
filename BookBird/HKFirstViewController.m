//
//  HKFirstViewController.m
//  BookBird
//
//  Created by Rob Stearn on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "HKFirstViewController.h"

@interface HKFirstViewController ()

@end

@implementation HKFirstViewController

@synthesize books, theCollectionView, requestData, error;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    self.title = @"BookBird";
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

- (void)fetchBooksWithAPIKey {
  NSURL *getBooksListURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?apikey=%@&limit=100", kBooksList, kFinalAPIKey]];
  self.requestData = [NSData dataWithContentsOfURL:getBooksListURL];
  NSJSONSerialization *jsonData = [NSJSONSerialization JSONObjectWithData:self.requestData options:NSJSONWritingPrettyPrinted error:nil];
  for (id key in (NSDictionary*)jsonData) {
    if ([key isEqual:@"books"]) {
      self.books = [(NSDictionary*)jsonData objectForKey:@"books"];
    }
  }
}



#pragma mark COLLECTION VIEW DELEGATE AND DAATSOURCE METHODS

//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//  return nil;
//}
//
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//  return 1;
//}


@end
