//
//  MainViewController.h
//  Luminous
//
//  Created by Erick Martin on 7/22/15.
//  Copyright (c) 2015 Erick Martin. All rights reserved.
//

#import "ViewController.h"

typedef enum{
    StateTypeModelHeader = 0,
    StateTypeModelMain = 1,
    StateTypeDatabase = 2
}StateType;

@interface MainViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, retain) IBOutlet UITextField *modelNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *primaryKeyTextField;
@property (nonatomic, retain) IBOutlet UITextView *inputTextView;
@property (nonatomic, retain) IBOutlet UITextView *resultTextView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *stateSegmented;
@property (nonatomic, retain) NSMutableArray *resultArray;

-(IBAction)changeState:(id)sender;
-(IBAction)generateTapped:(id)sender;
@end
