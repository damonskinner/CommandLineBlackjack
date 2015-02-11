//
//  FISCard.h
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISCard : NSObject
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSNumber *rank;

-(instancetype) initWithSuit: (NSString *) suit rank: (NSNumber *) rank;
-(BOOL) validRank:(NSNumber *)rank;
-(BOOL) validSuit:(NSString *)suit;

-(void) setSuit:(NSString *)suit;
-(void) setRank:(NSNumber *)rank;
@end
