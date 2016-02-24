//
//  StartGameViewController.m
//  Find Spy
//
//  Created by Jason on 11/11/15.
//  Copyright © 2015 Jason Shen. All rights reserved.
//

#import "StartGameViewController.h"
#import "CheckIdentityViewController.h"

@interface StartGameViewController ()

@property (strong,nonatomic) Identity *newid;
@property (strong, nonatomic) IBOutlet UISwitch *enableBlank;

@property (strong, nonatomic) IBOutlet UITextField *spyTextField;
@property (strong, nonatomic) IBOutlet UIButton *appointSpyButton;

//view上移后文本框与键盘的间隔
#define INTER_VAL 10

@end

@implementation StartGameViewController



-(IBAction)slideValueChanged:(id)sender {
    self.playerCount.text = [NSString stringWithFormat:@"%.0f",_countSlider.value];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //it happens when
    [_countSlider addTarget:self action:@selector(slideValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.newid =  [Identity shareInstance];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.textNormal.returnKeyType = UIReturnKeyDone;
    _textNormal.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textSpy.returnKeyType = UIReturnKeyDone;
    _textSpy.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textNormal resignFirstResponder];
    [_spyTextField resignFirstResponder];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{

}


- (IBAction)Random_To_startGame:(id)sender {
    
    self.newid.count = _countSlider.value;
    self.newid.appointMode = FALSE;
    if ([self.textNormal.text  isEqual: @""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"No normal tag!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
/*    }else if ([self.textSpy.text isEqual:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"No spy tag!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
*/    }else{
        _newid.normal = self.textNormal.text;
        _newid.spy = self.textSpy.text;
        
        //CheckIdentityViewController *nextView = [[CheckIdentityViewController alloc] init];
        
        UIStoryboard *checkView = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        UIViewController *nextView = [checkView instantiateViewControllerWithIdentifier:@"checkIdentity"];
        
        [self.navigationController pushViewController:nextView animated:YES];

    }

}

-(IBAction)Appoint_To_Start:(id)sender
{
    
    self.newid.count = _countSlider.value;
    self.newid.appointMode = TRUE;
    if ([self.textNormal.text  isEqual: @""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"No normal tag!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
/*    }else if ([self.textSpy.text isEqual:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"No spy tag!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okAction];
        
        [self presentViewController:alert animated:YES completion:nil];
*/    }else{
        _newid.normal = self.textNormal.text;
        _newid.spy = self.textSpy.text;
        
        //CheckIdentityViewController *nextView = [[CheckIdentityViewController alloc] init];
        
        UIStoryboard *checkView = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
        
        UINavigationController *nextView = [checkView instantiateViewControllerWithIdentifier:@"PickSpy"];
        
        [self.navigationController showViewController:nextView sender:_appointSpyButton];
    }

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldReturnEdit:(id)sender {
    [sender resignFirstResponder];
}

 
-(void)keyboardWillShow:(NSNotification *)noti
{
    CGFloat kbHeight = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    CGFloat offset = kbHeight - self.spyTextField.frame.origin.y + INTER_VAL;
    
    
    self.view.frame = CGRectMake(0, offset, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)keyboardWillHide:(NSNotification *)noti
{
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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
