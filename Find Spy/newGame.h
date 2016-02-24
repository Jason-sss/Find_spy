//
//  newGame.h
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StartGameViewController.h"

@interface newGame : NSObject

//@property (nonatomic,strong) NSString *tag;
@property (nonatomic) bool spyExist;
@property (nonatomic) unsigned int num;

-(NSString *)getIdentityForRandom:(Identity *)identity;
-(NSString *)getIdentityForAppointed:(Identity *)identity;


@end
