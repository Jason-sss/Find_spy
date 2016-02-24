//
//  CheckIdentityViewController.m
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import "CheckIdentityViewController.h"
#import "newGame.h"

@interface CheckIdentityViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showAndHide;
@property (nonatomic) bool isBackground;
@property (nonatomic,strong) newGame *newgame;
@property (nonatomic,strong) Identity *identity;
@property (nonatomic) unsigned int countDown;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UILabel *guideLabel;

@end

@implementation CheckIdentityViewController
- (IBAction)showAndHide:(id)sender {
        if(_identity.appointMode == FALSE){
        //random spy mode
            if(_countDown <= (_identity.count + 1)*2){
                [self.showAndHide setBackgroundImage:[self backGroundImageOfButton] forState:UIControlStateNormal];
                self.isBackground = !self.isBackground;
                if (!_isBackground) {
                    [self.showAndHide setTitle:[self.newgame getIdentityForRandom:_identity] forState:UIControlStateNormal];
                    if (_countDown == (_identity.count + 1)*2) {
                        self.backButton.enabled = true;
                        self.showAndHide.enabled = false;
                        _guideLabel.text = @"";
                        [self.backButton setTitle:@"Start a new game" forState:UIControlStateNormal];
                        return;
                    }
                    _guideLabel.text = @"Turn back to next one";
                }else{
                    [self.showAndHide setTitle:@" " forState:UIControlStateNormal];
                    _guideLabel.text = @"";
                }
                _countDown++;
            }
        }else{
        //appoint spy mode
            if(_countDown <= (_identity.count + 1)*2){
                [self.showAndHide setBackgroundImage:[self backGroundImageOfButton] forState:UIControlStateNormal];
                self.isBackground = !self.isBackground;
                if (!_isBackground) {
                    [self.showAndHide setTitle:[self.newgame getIdentityForAppointed:_identity] forState:UIControlStateNormal];
                    if (_countDown == (_identity.count + 1)*2) {
                        self.backButton.enabled = true;
                        self.showAndHide.enabled = false;
                        _guideLabel.text = @"";
                        [self.backButton setTitle:@"Start a new game" forState:UIControlStateNormal];
                        return;
                    }
                    _guideLabel.text = @"Turn back to next one";
                }else{
                    [self.showAndHide setTitle:@" " forState:UIControlStateNormal];
                    _guideLabel.text = @"";
                }
                _countDown++;
     
            }
   
        }
}

-(UIImage *)backGroundImageOfButton{
    return [UIImage imageNamed:self.isBackground ? @"white" : @"unknow"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isBackground = true;
    _identity = [Identity shareInstance];
    self.newgame = [[newGame alloc] init];
    self.newgame.num = 1;
    self.countDown = 0;
    _backButton.enabled = false;
    [_backButton setTitle:@"" forState:UIControlStateNormal];
    // Do any additional setup after loading the view
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
