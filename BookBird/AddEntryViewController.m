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
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    
    self.bookTextTextView.text = pb.string;
    [self.notesTextView becomeFirstResponder];
    _entryDict = [[NSMutableDictionary alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *button = (UIButton*)sender;
    [_entryDict setObject:button.titleLabel.text forKey:@"Type"];
    [button setSelected:YES]; //button should remain selected
}

- (IBAction)addEntryPressed:(id)sender {
    [_entryDict setObject:_notesTextView.text forKey:@"Notes"];
    [_entryDict setObject:_bookTextTextView.text forKey:@"Selection"];
    //save entry dict to other place so table view has info
    [_readingVC.tableDataSource addObject:_entryDict];
    [_readingVC.elementsTableView reloadData];
    
    //for text view
    [self.notesTextView resignFirstResponder];
    
    //dismiss
    [self.navigationController popViewControllerAnimated:YES];
}

@end
