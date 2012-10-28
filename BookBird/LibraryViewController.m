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
    [self fetchBooksWithAPIKey];
    [self.libraryCollectionView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Decoration.png"]]];
    // Do any additional setup after loading the view from its nib.
    [self.libraryCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    
    [self.libraryCollectionView reloadData];
  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenFabric"]]];
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_books count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        NSDictionary *bookDataDict = [_books objectAtIndex:indexPath.row];
    NSString *coverImageString = [bookDataDict objectForKey:@"isbn"];
    if (![UIImage imageNamed:coverImageString]) {
        coverImageString = @"2011-03-08 15.28.39.jpg";
    }
    UIImageView *bookCoverImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:coverImageString]];
    [bookCoverImageView setFrame:CGRectMake(0, 0, 200, 311)];
    [cell.contentView addSubview:bookCoverImageView];
    
    //cell.backgroundView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    
//    NSString *bookTitle = [bookDataDict objectForKey:@"title"];
//    
//    UILabel *bookTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cell.contentView.bounds.size.height-40, cell.contentView.bounds.size.width, 40)];
//    bookTitleLabel.text = bookTitle;
//    bookTitleLabel.textColor = [UIColor whiteColor];
//    bookTitleLabel.font = [UIFont boldSystemFontOfSize:18];
//    bookTitleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
//    bookTitleLabel.numberOfLines = 10;
//    bookTitleLabel.textAlignment = NSTextAlignmentCenter;
//    
//    //Calculate the expected size based on the font and linebreak mode of your label
//    CGSize maximumLabelSize = CGSizeMake(bookTitleLabel.bounds.size.width,cell.contentView.bounds.size.height);
//    
//    CGSize expectedLabelSize = [bookTitle sizeWithFont:bookTitleLabel.font
//                                     constrainedToSize:maximumLabelSize
//                                         lineBreakMode:bookTitleLabel.lineBreakMode];
//    CGRect newFrame = bookTitleLabel.frame;
//    newFrame.size.height = expectedLabelSize.height;
//    bookTitleLabel.frame = newFrame;
//    
//    [cell.contentView addSubview:bookTitleLabel];
    
    //cell.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//}

//delegate methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //launch book detail view where user can select chapter/page number
}


- (void)fetchBooksWithAPIKey {
  NSURL *getBooksListURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?apikey=%@&limit=100", kBooksList, kFinalAPIKey]];
  self.requestData = [NSData dataWithContentsOfURL:getBooksListURL];
  NSJSONSerialization *jsonData = [NSJSONSerialization JSONObjectWithData:self.requestData options:NSJSONWritingPrettyPrinted error:nil];
  for (id key in (NSDictionary*)jsonData) {
    if ([key isEqual:@"books"]) {
      self.books = [(NSDictionary*)jsonData objectForKey:@"books"];
        [self.libraryCollectionView reloadData];
    }
  }
}

@end