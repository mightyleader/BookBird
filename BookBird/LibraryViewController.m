//
//  LibraryViewController.m
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "LibraryViewController.h"

@interface LibraryViewController ()

@end

@implementation LibraryViewController

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

@end
