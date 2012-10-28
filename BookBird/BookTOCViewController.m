//
//  BookTOCViewController.m
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "BookTOCViewController.h"

@interface BookTOCViewController ()

@end

@implementation BookTOCViewController

@synthesize bookURL, articleList, articleData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchArticlesWithAPIKey {
  NSURL *getArticleListURL = [NSURL URLWithString:self.bookURL];
  self.articleData = [NSData dataWithContentsOfURL:getArticleListURL];
  NSJSONSerialization *jsonData = [NSJSONSerialization JSONObjectWithData:self.articleData options:NSJSONWritingPrettyPrinted error:nil];
  for (id key in (NSDictionary*)jsonData) {
    if ([key isEqual:@"book"]) {
      self.articleList = [[(NSDictionary*)jsonData objectForKey:@"book"] objectForKey:@"articles"];
    }
  }
  NSLog(@"%@", self.articleList);
}

@end
