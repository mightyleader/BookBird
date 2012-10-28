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

@synthesize articleURL, articleData, articleContent, people, places, events, emotions;

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

  NSString *adjustedURLString = [self.articleURL stringByReplacingOccurrencesOfString:@"?" withString:@"?content-fmt=html&"];
  NSURL *getArticleURL = [NSURL URLWithString:adjustedURLString];
  self.articleData = [NSData dataWithContentsOfURL:getArticleURL];
  NSJSONSerialization *jsonData = [NSJSONSerialization JSONObjectWithData:self.articleData options:NSJSONWritingPrettyPrinted error:nil];
  self.articleContent = [(NSDictionary*)jsonData objectForKey:@"article"];
}

@end
