//
//  FISDeck.m
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "FISDeck.h"

@implementation FISDeck


-(instancetype)init {
    self = [super init];
    
    if (self) {
        _cards=[[NSMutableArray alloc] init];
    }
    
    return self;
}

-(FISCard *)drawRandomCard {
    
    NSInteger rndValue = 1 + arc4random() % ([self.cards count] - 1);
    
    FISCard *randomCard = self.cards[rndValue];
    
    [self.cards removeObject:self.cards[rndValue]];
    
    return randomCard;
}


@end
