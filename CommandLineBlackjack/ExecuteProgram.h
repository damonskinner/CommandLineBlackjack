//
//  ExecuteProgram.h
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISBlackjackGame.h"

@interface ExecuteProgram : NSObject

+(void) run;

+(NSString *)getInputWithMessage:(NSString *)message;
+(void) menu;
+(void) gameStart:(FISBlackjackGame *) newGame;
+(void) endGame:(FISBlackjackGame *) newGame;
+(void) placeBet:(FISBlackjackGame *) newGame;


@end
