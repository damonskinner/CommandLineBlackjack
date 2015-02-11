//
//  FISCard.m
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "FISCard.h"

@implementation FISCard
-(instancetype) initWithSuit: (NSString *) suit
                        rank: (NSNumber *) rank {
    self = [super init];
    
    if (self){
        if ([self validRank:rank]){
            _rank=rank;
        } else {
            _rank=@0;
        }
        
        if ([self validSuit:suit]){
            _suit=suit;
        } else {
            _suit=@"";
        }
    }
    return self;
}


-(instancetype) init {
    self = [self initWithSuit:@"" rank:@0];
    return self;
}

-(void) setRank:(NSNumber *)rank {
    _rank=rank;
    if (![self validRank:rank]){
        _rank=@0;
    }
}
-(void) setSuit:(NSString *)suit {
    _suit=suit;
    if (![self validSuit:suit]){
        _suit=@"";
    }
}


-(BOOL)validRank:(NSNumber *)rank{
    
    if (0<[rank integerValue] && [rank integerValue]<14){
        return YES;
    }else {
        return NO;
    }
}
-(BOOL)validSuit:(NSString *)suit{
    if([suit isEqualToString:@"♥️"] || [suit isEqualToString:@"♠️"] || [suit isEqualToString:@"♣️"] || [suit isEqualToString:@"♦️"]){
        return YES;
    } else {
        return NO;
    }
}

-(NSString *) description{
    
    return [NSString stringWithFormat:@"%@ %@",self.rank, self.suit];
}

@end
