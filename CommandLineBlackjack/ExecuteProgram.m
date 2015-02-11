//
//  ExecuteProgram.m
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "ExecuteProgram.h"

@implementation ExecuteProgram

+(void) run {
    NSLog(@"Program running...");
    
    [self menu];
    
}

+(void) menu {
    NSLog(@"Menu called");
    NSString *menuChoice=[self getInputWithMessage:@"\r\rWould you like to play a game? Yes/No"];
    if ([menuChoice isEqualToString:@"yes"] || [menuChoice isEqualToString:@"y"]){
        [self gameStart];
    } else if ([menuChoice isEqualToString:@"no"] || [menuChoice isEqualToString:@"n"]) {
        [self endGame];
    } else {
        NSLog(@"\r\rPlease enter a valid choice");
        [self menu];
    }

}

+(void) gameStart {

}

+(void) endGame {
    NSLog(@"\r\rThank you for playing!");
}

+ (NSString *)getInputWithMessage:(NSString *)message
{

    char input[50];
    NSLog(@"%@",message);

    fgets(input, sizeof(input), stdin);
    NSString *result = [NSString stringWithUTF8String:input];
//    system("clear");
    NSLog(@"");
    return [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];;
}




@end
