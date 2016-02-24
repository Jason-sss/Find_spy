//
//  Identity.h
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Identity : NSObject<NSCopying>

@property (nonatomic,strong)NSString *normal;
@property (nonatomic,strong)NSString *spy;
@property (nonatomic)unsigned int count;
@property (nonatomic)unsigned int spyNo;
@property (nonatomic)BOOL appointMode;

+(Identity *)shareInstance;

@end
