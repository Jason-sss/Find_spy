//
//  StartGameViewController.h
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Identity.h"

@interface StartGameViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong)Identity *identity;

@property (weak, nonatomic) IBOutlet UILabel *playerCount;

@property (weak, nonatomic) IBOutlet UISlider *countSlider;
@property (weak, nonatomic) IBOutlet UITextField *textNormal;
@property (weak, nonatomic) IBOutlet UITextField *textSpy;

-(IBAction)textFieldReturnEdit:(id)sender;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

@end
