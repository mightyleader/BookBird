//
//  SummaryViewController.h
//  BookBird
//
//  Created by Sally on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SummaryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UITextView *originalTextView;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic)  NSString *tweetText;
@property (weak, nonatomic)  NSString *notesText;
@property (weak, nonatomic)  NSString *originalText;
@property (weak, nonatomic)  NSString *typeText;


- (IBAction)tweetPressed:(id)sender;

@end
