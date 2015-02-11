//
//  FISPlayingCardDeck.m
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "FISPlayingCardDeck.h"
#import "FISCard.h"

@implementation FISPlayingCardDeck

-(instancetype)init {
    self = [super init];
    
    NSMutableArray *cardsArray=[[NSMutableArray alloc] init];
    
    if (self)
    {
        for (NSInteger i=1;i<=13;i++){
            [cardsArray addObject:[[FISCard alloc] initWithSuit:@"♠️" rank:@(i)]];
            [cardsArray addObject:[[FISCard alloc] initWithSuit:@"♥️" rank:@(i)]];
            [cardsArray addObject:[[FISCard alloc] initWithSuit:@"♣️" rank:@(i)]];
            [cardsArray addObject:[[FISCard alloc] initWithSuit:@"♦️" rank:@(i)]];
        }
        self.cards=cardsArray;
    }
    
    return self;
}



@end
