//
//  VariableModel.m
//  Luminous
//
//  Created by Erick Martin on 7/23/15.
//  Copyright (c) 2015 Erick Martin. All rights reserved.
//

#import "VariableModel.h"

@implementation VariableModel

@synthesize variableName, variableType, variableAssignType, variablePrimitive;

-(id)initWithString:(NSString *)str{
    if(self = [super init]){
        
        NSArray *array = [str componentsSeparatedByString:@" "];
        if(array.count == 2){
            self.variableType = array[0];
            
            NSString *compareStr = [array[0] lowercaseString];
            
            if([compareStr isEqualToString:@"nsstring"]){
                self.variableType = @"NSString";
                self.variableAssignType = @"copy";
                self.variablePrimitive = @" *";
            }else if([compareStr isEqualToString:@"nsdate"]){
                self.variableType = @"NSDate";
                self.variablePrimitive = @" *";
            }else if([compareStr isEqualToString:@"nsarray"]){
                self.variableType = @"NSArray";
                self.variablePrimitive = @" *";
            }else if([compareStr isEqualToString:@"nsset"]){
                self.variableType = @"NSSet";
                self.variablePrimitive = @" *";
            }else if([compareStr isEqualToString:@"nsinteger"]){
                self.variableType = @"NSInteger";
                self.variableAssignType = @"assign";
                self.variablePrimitive = @" ";
            }else if([compareStr isEqualToString:@"nsnumber"]){
                self.variableType = @"NSNumber";
                self.variablePrimitive = @" *";
            }else if([compareStr isEqualToString:@"int"]){
                self.variableType = @"int";
                self.variableAssignType = @"assign";
                self.variablePrimitive = @" ";
            }else if([compareStr isEqualToString:@"float"]){
                self.variableType = @"float";
                self.variableAssignType = @"assign";
                self.variablePrimitive = @" ";
            }else{
                self.variablePrimitive = @" *";
                self.variableAssignType = @"retain";
            }
            
            self.variableName = array[1];
        }
        
    }
    return self;
}

@end
