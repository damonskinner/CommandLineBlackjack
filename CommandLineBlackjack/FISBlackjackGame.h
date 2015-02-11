//
//  FISBlackjackGame.h
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : NSObject
@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck; // returns the playingCardDeck in use
@property (strong, nonatomic) NSNumber *handScore; // returns the total value of cards in the hand. Remember: Aces can be 1 or 11.
@property (strong, nonatomic) NSMutableArray *hand; //returns the cards in the hand
@property (nonatomic) BOOL isBusted; // returns YES if handScore is more than 21
@property (nonatomic) BOOL isBlackjack; // returns YES if handScore is 21


- (instancetype)init;
- (void)deal;
- (void)hit;




@end
