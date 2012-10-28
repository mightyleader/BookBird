//
//  AddEntryViewController.h
//  BookBird
//
//  Created by Sally on 28/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadingViewController.h"

@interface AddEntryViewController : UIViewController <UITextViewDelegate>
@property (nonatomic, strong) ReadingViewController * readingVC;

@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UITextView *bookTextTextView;

@property (nonatomic, strong) NSMutableDictionary *entryDict;

- (IBAction)buttonPressed:(id)sender;
- (IBAction)addEntryPressed:(id)sender;

@end
