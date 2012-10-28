//
//  ReadingViewController.m
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "ReadingViewController.h"

@interface ReadingViewController ()

@end

@implementation ReadingViewController

@synthesize articleURL, articleData;

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
  NSURL *getArticleURL = [NSURL URLWithString:self.articleURL];
  self.articleData = [NSData dataWithContentsOfURL:getArticleURL];
  NSJSONSerialization *jsonData = [NSJSONSerialization JSONObjectWithData:self.articleData options:NSJSONWritingPrettyPrinted error:nil];
  for (id key in (NSDictionary*)jsonData) {
    if ([key isEqual:@"books"]) {
      //self.articleList = [[(NSDictionary*)jsonData objectForKey:@"book"] objectForKey:@"articles"];
    }
  }
  //NSLog(@"%@", self.articleList);
}

@end
