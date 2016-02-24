//
//  newGame.m
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import "newGame.h"

@implementation newGame

@synthesize spyExist;
@synthesize num;

-(NSString *)getIdentityForRandom:(Identity *)identity
{
    if (num <= identity.count) {
        if (spyExist) {
            num++;
            return identity.normal;
        }else if((!spyExist)&(num == identity.count)){
            //token the spy
            [Identity shareInstance].spyNo = num;
            num++;
            return identity.spy;
        }else{
            unsigned int random = arc4random() % 3;
            if (random == 0) {
                spyExist = true;
                [Identity shareInstance].spyNo = num;
                num++;
                return identity.spy;
            }else{
                num++;
                return identity.normal;
            }
        }
    }else if(num == (identity.count + 1)){
        num++;
        return @"No More !";
    }else{
        return [NSString stringWithFormat:@"The Spy is NO.%d",[Identity shareInstance].spyNo];
    }
}

-(NSString *)getIdentityForAppointed:(Identity *)identity
{
    if (num <= identity.count) {
        if (spyExist) {
            num++;
            return identity.normal;
        }else if (num == identity.spyNo){
            num++;
            spyExist = TRUE;
            return identity.spy;
        }else{
            num++;
            return identity.normal;
        }
    }else if (num == (identity.count + 1)) {
        num++;
        return @"No More!";
    }else{
        return [NSString stringWithFormat:@"The Spy is NO.%d",identity.spyNo];
    }
}


@end
