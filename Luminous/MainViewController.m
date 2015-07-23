//
//  MainViewController.m
//  Luminous
//
//  Created by Erick Martin on 7/22/15.
//  Copyright (c) 2015 Erick Martin. All rights reserved.
//

#import "MainViewController.h"
#import "VariableModel.h"

@implementation MainViewController

@synthesize modelNameTextField, inputTextView, resultTextView, stateSegmented, resultArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - IBAction
-(IBAction)changeState:(id)sender{

}

-(IBAction)copyTapped:(id)sender{

    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = resultTextView.text;
}

-(IBAction)generateTapped:(id)sender{
    
    [self arrayOfVariableWithString:inputTextView.text];
    
    resultTextView.text = [self createModelHeader];
    
}

-(NSArray *)arrayOfVariableWithString:(NSString *)inputStr{
    self.resultArray = [NSMutableArray array];

    NSMutableArray *data = [[inputStr componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]] mutableCopy];
    
    for(NSString *string in data){
        VariableModel *varModel = [[VariableModel alloc] initWithString:string];
        [resultArray addObject:varModel];
    }
    return resultArray;
}

-(NSString *)createModelHeader{
    NSString *variableString = @"";
    
    for(VariableModel *varMod in resultArray){
        
        NSString *varInString = [NSString stringWithFormat:@"@property (nonatomic, %@) %@%@%@\n", varMod.variableAssignType, varMod.variableType, varMod.variablePrimitive, varMod.variableName];
        
        variableString = [variableString stringByAppendingString:varInString];
    }


    NSString *resultString = [NSString stringWithFormat:@""
    "#import <Foundation/Foundation.h>\n"
    "#import <CoreData/CoreData.h>\n\n\n"
    "@interface %@ : NSObject\n\n"
    "-(id)initWithDictionary:(NSDictionary *)jsonDict;\n"
    "-(id)initWithFMResultSet:(FMResultSet *)result;\n"
    "-(id)initWithCoder:(NSCoder *)decoder;\n"
    "-(void)encodeWithCoder:(NSCoder *)encoder;\n\n"
    "%@"
    "\n@end", modelNameTextField.text, variableString];
    
    return resultString;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
