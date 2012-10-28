//
//  AddEntryViewController.h
//  BookBird
//
//  Created by Sally on 28/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEntryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UITextView *bookTextTextView;

- (IBAction)buttonPressed:(id)sender;
@end
