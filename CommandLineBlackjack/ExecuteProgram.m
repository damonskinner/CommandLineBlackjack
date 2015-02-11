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
//    NSLog(@"Program running...");
    NSLog(@"\r\rWelcome to Blackjack!  Race the dealer to hit 21, but don't bust!  Each game costs $5, and you begin with $100.  Blackjack pays time and a half!  Time to let it ride!");
    [self menu];
    
}

+(void) menu {
//    NSLog(@"Menu called");
    NSString *menuChoice=[self getInputWithMessage:@"\r\rWould you like to play a game? Yes/No"];
    menuChoice=[menuChoice lowercaseString];
    FISBlackjackGame *newGame = [[FISBlackjackGame alloc] init];
    if ([menuChoice isEqualToString:@"yes"] || [menuChoice isEqualToString:@"y"]){
        [self gameStart:newGame];
    } else if ([menuChoice isEqualToString:@"no"] || [menuChoice isEqualToString:@"n"]) {
        [self endGame:newGame];
    } else {
        NSLog(@"\r\rPlease enter a valid choice");
        [self menu];
    }

}

+(void) gameStart:(FISBlackjackGame *) newGame {

    [newGame resetHands];
    
    [self placeBet:newGame];
    
    [newGame deal];
    
    NSLog(@"\r\rYou have : %@\r Current Funds: $%f", newGame.handScore, newGame.money);
    sleep(1);
    
    
    [self hitChoice:newGame];
    
    if(newGame.isBlackjack){
        sleep(2);
        newGame.money+=(newGame.bet*2.5);
        NSLog(@"\r\rYou hit blackjack!  Your final score was: %@\rCurrent Funds: $%f", newGame.handScore, newGame.money);
        [self playAgain:newGame];
    }
    if(newGame.isBusted){
        sleep(2);
        NSLog(@"\r\rYou busted!  Your final score was: %@\rCurrent Funds: $%f", newGame.handScore,newGame.money);
        [self playAgain:newGame];
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
        newGame.money+=(newGame.bet*2);
        NSLog(@"\r\rThe dealer busted!  You win!\rCurrent Funds: $%f", newGame.money);
    } else if ([newGame.dealerHandScore integerValue]==21) {
        NSLog(@"\r\rThe dealer hit blackjack!  You lose!\rCurrent Funds: $%f", newGame.money);
    } else {
        if ([newGame.dealerHandScore integerValue]<[newGame.handScore integerValue]){
            newGame.money+=(newGame.bet*2);
            NSLog(@"\r\rDealer has: %@ You have: %@ You win!\rCurrent Funds: $%f",newGame.dealerHandScore, newGame.handScore, newGame.money);
        } else if ([newGame.dealerHandScore integerValue]>[newGame.handScore integerValue]){
            NSLog(@"\r\rDealer has: %@ You have: %@ You lose!\rCurrent Funds: $%f",newGame.dealerHandScore, newGame.handScore, newGame.money);
        } else {
            newGame.money+=(newGame.bet);
            NSLog(@"\r\rDealer has: %@ You have: %@ You push!\rCurrent Funds: $%f",newGame.dealerHandScore, newGame.handScore, newGame.money);
            
        }
    }
    
    
    
    [self playAgain:newGame];
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

+(void) placeBet:(FISBlackjackGame *) newGame{
    NSLog(@"\r\rCurrent funds: %f",newGame.money);
    NSString *betChoice=[self getInputWithMessage:@"\r\rHow much would you like to bet?"];
    if([betChoice floatValue]>newGame.money){
        NSLog(@"\r\rYou can't bet more money than you currently have.");
        [self placeBet:newGame];
    } else {
        newGame.bet=[betChoice floatValue];
        newGame.money=newGame.money-newGame.bet;
    }
}

+(void) playAgain:(FISBlackjackGame *) newGame {
    sleep(1);
    if (newGame.money>0){
        NSString *menuChoice=[self getInputWithMessage:@"\r\rWould you like to play again? Yes/No"];
        menuChoice=[menuChoice lowercaseString];
        if ([menuChoice isEqualToString:@"yes"] || [menuChoice isEqualToString:@"y"]){
            [self gameStart:newGame];
        } else if ([menuChoice isEqualToString:@"no"] || [menuChoice isEqualToString:@"n"]) {
            [self endGame:newGame];
        } else {
            NSLog(@"\r\rPlease enter a valid choice");
            [self playAgain:newGame];
        }
    } else {
        NSLog(@"\r\rI'm sorry, you're flat broke!");
        [self endGame:newGame];
    }
}

+(void) endGame:(FISBlackjackGame *) newGame {
    NSLog(@"\r\rThank you for playing!");
    if(newGame.money>0){
        NSLog(@"\r\rYour winnings: $%f",newGame.money);
    }
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
