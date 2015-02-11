//
//  FISBlackjackGame.m
//  CommandLineBlackjack
//
//  Created by Damon Skinner on 2/11/15.
//  Copyright (c) 2015 Damon Skinner. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype)init{
    self=[super init];
    
    if (self)
    {
        _playingCardDeck=[[FISPlayingCardDeck alloc]init];
        _isBusted = NO;
        _isBlackjack=NO;
        _hand=[[NSMutableArray alloc] init];
        _handScore=@0;
        _dealerHand=[[NSMutableArray alloc] init];
        _dealerHandScore=@0;
        _dealerIsBusted=NO;
        _dealerIsBlackjack=NO;
        _money=100;
        _bet=0;
    }
    
    return self;
}

-(void) resetHands {
    _playingCardDeck=[[FISPlayingCardDeck alloc]init];
    _isBusted = NO;
    _isBlackjack=NO;
    _hand=[[NSMutableArray alloc] init];
    _handScore=@0;
    _dealerHand=[[NSMutableArray alloc] init];
    _dealerHandScore=@0;
    _dealerIsBusted=NO;
    _dealerIsBlackjack=NO;
    _bet=0;
}

- (void)deal{
    FISCard *firstCard=[self.playingCardDeck drawRandomCard];
    [self.hand addObject:firstCard];
    FISCard *secondCard=[self.playingCardDeck drawRandomCard];
    [self.hand addObject:secondCard];
    NSLog(@"\r\rYou have been dealt a: %@ and a: %@", firstCard, secondCard);

    FISCard *dealerFirstCard=[self.playingCardDeck drawRandomCard];
    [self.dealerHand addObject:dealerFirstCard];
    FISCard *dealerSecondCard=[self.playingCardDeck drawRandomCard];
    [self.dealerHand addObject:dealerSecondCard];
}
- (void)hit{
    if([self.hand count]!=0 && !(self.isBusted)){
        FISCard *newCard = [self.playingCardDeck drawRandomCard];
        [self.hand addObject:newCard];
        NSLog(@"\r\rYou were dealt a : %@  Your total score is now:  %@",newCard, self.handScore);
    }
}

- (void)dealerHit{
    if([self.dealerHand count]!=0 && !(self.dealerIsBusted) && !(self.dealerIsBlackjack)){
        sleep(1);
        FISCard *newCard = [self.playingCardDeck drawRandomCard];
        [self.dealerHand addObject:newCard];
        NSLog(@"\r\rThe dealer was dealt a : %@  The dealer's total score is now:  %@",newCard, self.dealerHandScore);
    }
}

- (NSNumber *) handScore {
    NSInteger score=0;
    NSInteger aceCount=0;
    for (FISCard *card in self.hand){
        
        if ([card.rank integerValue]==1) {
            if (score>10){
                score +=1;
            } else if (score<=10) {
                score+=11;
                aceCount++;
            }
        } else if([card.rank integerValue]>10) {
            score+=10;
        } else {
            score=score + [card.rank integerValue];
        }
        if (score>21 && aceCount>0){
            aceCount--;
            score-=10;
        }
    }
    
    return [NSNumber numberWithInteger:score];
}

- (NSNumber *) dealerHandScore {
    NSInteger score=0;
    NSInteger aceCount=0;
    for (FISCard *card in self.dealerHand){
        
        if ([card.rank integerValue]==1) {
            if (score>10){
                score +=1;
            } else if (score<=10) {
                score+=11;
                aceCount++;
            }
        } else if([card.rank integerValue]>10) {
            score+=10;
        } else {
            score=score + [card.rank integerValue];
        }
        if (score>21 && aceCount>0){
            aceCount--;
            score-=10;
        }
    }
    
    return [NSNumber numberWithInteger:score];
}

-(BOOL) isBusted {
    if ([self.handScore integerValue]>21){
        return YES;
    }
    return NO;
}

-(BOOL) isBlackjack {
    if ([self.handScore integerValue]==21){
        return YES;
    }
    return NO;
}

-(BOOL) dealerIsBusted {
    if ([self.dealerHandScore integerValue]>21){
        return YES;
    }
    return NO;
}

-(BOOL) dealerIsBlackjack {
    if ([self.dealerHandScore integerValue]==21){
        return YES;
    }
    return NO;
}

@end
