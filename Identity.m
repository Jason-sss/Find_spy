//
//  Identity.m
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import "Identity.h"

@implementation Identity

@synthesize normal;
@synthesize spy;
@synthesize count;
@synthesize spyNo;
@synthesize appointMode;

static Identity *shareSingleton = nil;

+(Identity *)shareInstance{
    if (shareSingleton == nil) {
        shareSingleton = [[super allocWithZone:NULL] init];
    }
    return shareSingleton;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self shareInstance];
}

-(id)copyWithZone:(NSZone *)zone{
    return self;
}



@end
