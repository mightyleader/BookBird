//
//  AddEntryViewController.m
//  BookBird
//
//  Created by Sally on 28/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import "AddEntryViewController.h"

#define kCharacterTag 300
#define kEventTag 301
#define kPlaceTag 302
#define kEmotionTag 303

@interface AddEntryViewController ()

@end

@implementation AddEntryViewController

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
    [self.notesTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *buttonPressed = (UIButton*)sender;
    [_entryDict setObject:buttonPressed.titleLabel.text forKey:@"Type"];
    [buttonPressed setSelected:YES]; //button should remain selected
}

- (IBAction)addEntryPressed:(id)sender {
    [_entryDict setObject:_notesTextView.text forKey:@"Notes"];
    //save entry dict to other place so table view has info
    
}

@end
