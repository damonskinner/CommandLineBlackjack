//
//  ExecuteProgram.m
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "ExecuteProgram.h"
#import "FISBlackjackGame.h"

@implementation ExecuteProgram

+(void) run {
//    NSLog(@"Program running...");
    
    [self menu];
    
}

+(void) menu {
//    NSLog(@"Menu called");
    NSString *menuChoice=[self getInputWithMessage:@"\r\rWould you like to play a game? Yes/No"];
    menuChoice=[menuChoice lowercaseString];
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
    FISBlackjackGame *newGame = [[FISBlackjackGame alloc] init];
    [newGame deal];
    
    NSLog(@"\r\rYou have : %@", newGame.handScore);
    sleep(1);
    
    
    [self hitChoice:newGame];
    
    if(newGame.isBlackjack){
        sleep(2);
        NSLog(@"\r\rYou hit blackjack!  Your final score was: %@", newGame.handScore);
        [self playAgain];
    }
    if(newGame.isBusted){
        sleep(2);
        NSLog(@"\r\rYou busted!  Your final score was: %@", newGame.handScore);
        [self playAgain];
    }
    
    NSLog(@"\r\rThe dealer has: %@   %@  for a total of : %@,", newGame.dealerHand[0], newGame.dealerHand[1], newGame.dealerHandScore);
    if ([newGame.dealerHandScore integerValue]<17){
        NSLog(@"\r\rDealer is hitting until hitting 17...");
        do {
            [newGame dealerHit];
        } while ([newGame.dealerHandScore integerValue] <17);
    }
    
    sleep(1);
    if([newGame.dealerHandScore integerValue]>21){
        NSLog(@"\r\rThe dealer busted!  You win!");
    } else if ([newGame.dealerHandScore integerValue]==21) {
        NSLog(@"\r\rThe dealer hit blackjack!  You lose!");
    } else {
        if ([newGame.dealerHandScore integerValue]<[newGame.handScore integerValue]){
            NSLog(@"\r\rDealer has: %@ You have: %@ You win!",newGame.dealerHandScore, newGame.handScore);
        } else if ([newGame.dealerHandScore integerValue]>[newGame.handScore integerValue]){
            NSLog(@"\r\rDealer has: %@ You have: %@ You lose!",newGame.dealerHandScore, newGame.handScore);
        } else {
            NSLog(@"\r\rDealer has: %@ You have: %@ You push!",newGame.dealerHandScore, newGame.handScore);
        }
    }
    
    
    
    [self playAgain];
}

+(void) hitChoice:(FISBlackjackGame *)newGame {
    NSLog(@"\r\rThe dealer is showing: %@", newGame.dealerHand[1]);
    NSString *hitting=[self getInputWithMessage:@"\r\rWould you like to hit? Yes/No"];
    hitting=[hitting lowercaseString];
    if ([hitting isEqualToString:@"yes"] || [hitting isEqualToString:@"y"]){
        [newGame hit];
    } else if ([hitting isEqualToString:@"no"] || [hitting isEqualToString:@"n"]) {
        return;
    } else {
        NSLog(@"\r\rPlease enter a valid choice");
        [self hitChoice:newGame];
    }
    if(!(newGame.isBusted)){
        [self hitChoice:newGame];
    }
}

+(void) playAgain {
    NSString *menuChoice=[self getInputWithMessage:@"\r\rWould you like to play again? Yes/No"];
    menuChoice=[menuChoice lowercaseString];
    if ([menuChoice isEqualToString:@"yes"] || [menuChoice isEqualToString:@"y"]){
        [self gameStart];
    } else if ([menuChoice isEqualToString:@"no"] || [menuChoice isEqualToString:@"n"]) {
        [self endGame];
    } else {
        NSLog(@"\r\rPlease enter a valid choice");
        [self playAgain];
    }
}

+(void) endGame {
    NSLog(@"\r\rThank you for playing!");
    exit (0);
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
