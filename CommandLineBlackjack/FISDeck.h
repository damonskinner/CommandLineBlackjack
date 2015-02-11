//
//  FISDeck.h
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISCard.h"

@interface FISDeck : NSObject

@property (nonatomic, strong) NSMutableArray *cards;
-(FISCard *)drawRandomCard;

@end
