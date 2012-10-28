//
//  BookTOCViewController.m
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "BookTOCViewController.h"
#import "ReadingViewController.h"

@interface BookTOCViewController ()

@end

@implementation BookTOCViewController

@synthesize bookURL, articleList, articleData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"Table of Contents";

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.bookAuthorLabel.text = self.bookAuthorString;
    self.bookTitleLabel.text = self.bookTitleString;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableOfContentsTableView deselectRowAtIndexPath:self.tableOfContentsTableView.indexPathForSelectedRow animated:NO];
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
  [self.tableOfContentsTableView reloadData];
}


//tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    NSDictionary *bookDict = [self.articleList objectAtIndex:indexPath.row];
    cell.textLabel.text = [bookDict objectForKey:@"title"];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [articleList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *tocDict = [self.articleList objectAtIndex:indexPath.row];
    NSString *urlString = [tocDict objectForKey:@"url"];
    ReadingViewController *readingVC = [[ReadingViewController alloc] init];
    readingVC.articleURL = urlString;
    [self.navigationController pushViewController:readingVC animated:YES];
}

@end
