//
//  ReadingViewController.m
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "ReadingViewController.h"
#import "AddEntryViewController.h"

@interface ReadingViewController ()

@end

@implementation ReadingViewController

@synthesize articleURL, articleData, articleContent, people, places, events, emotions, readingContentWebView, elementsTableView;

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
  UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                  style:UIBarButtonSystemItemDone target:self  action:@selector(addEntryPressed:)];
  self.navigationItem.rightBarButtonItem = rightButton;
  [self fetchArticleWithAPIKey];
    _tableDataSource = [[NSMutableArray alloc] init];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.elementsTableView reloadData];
}

- (void)addEntryPressed:(id)sender {
  AddEntryViewController *addEntryVC = [[AddEntryViewController alloc] init];
    addEntryVC.readingVC = self;
  [addEntryVC setTitle:@"Add new entry"];
  [self.navigationController pushViewController:addEntryVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchArticleWithAPIKey {

  NSString *adjustedURLString = [self.articleURL stringByReplacingOccurrencesOfString:@"?" withString:@"?content-fmt=html&"];
  NSURL *getArticleURL = [NSURL URLWithString:adjustedURLString];
  self.articleData = [NSData dataWithContentsOfURL:getArticleURL];
  NSJSONSerialization *jsonData = [NSJSONSerialization JSONObjectWithData:self.articleData options:NSJSONWritingPrettyPrinted error:nil];
  self.articleContent = [(NSDictionary*)jsonData objectForKey:@"article"];
  
  NSString *webContent = [self.articleContent objectForKey:@"content"] ;
  [self.readingContentWebView loadHTMLString:webContent baseURL:nil];
  
}



#pragma mark TABLEVIEW THINGS

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  }

  cell.textLabel.text = [[self.tableDataSource objectAtIndex:indexPath.row] objectForKey:@"Notes"];
  
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

  return [_tableDataSource count];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//  NSDictionary *tocDict = [self.articleList objectAtIndex:indexPath.row];
//  NSString *urlString = [tocDict objectForKey:@"url"];
//  ReadingViewController *readingVC = [[ReadingViewController alloc] init];
//  readingVC.articleURL = urlString;
//  [self.navigationController pushViewController:readingVC animated:YES];
}

@end
