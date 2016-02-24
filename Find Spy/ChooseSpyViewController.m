//
//  ChooseSpyViewController.m
//  Find Spy
//
//  Created by Jason on 2/1/16.
//  Copyright © 2016 Jason Shen. All rights reserved.
//

#import "ChooseSpyViewController.h"

@interface ChooseSpyViewController () <UIPickerViewAccessibilityDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIButton *goButton;
@property (nonatomic,strong) Identity *identity;
@property (strong, nonatomic) IBOutlet UIPickerView *pickSpyView;
@property (strong, nonatomic) NSMutableArray *numArray;

@end

@implementation ChooseSpyViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return _identity.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_numArray objectAtIndex:row];
    //NSLog(@"%ld",row);
    //return @"spy";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _identity.spyNo = (int)row + 1;
    //NSLog(@"%d",_identity.spyNo);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _identity = [Identity shareInstance];
    _identity.spyNo = 1;
   
    // Do any additional setup after loading the view.
    _numArray = [[NSMutableArray alloc] init];
    for (int i = 1; i <=_identity.count ; i++) {
        [_numArray addObject:[NSString stringWithFormat:@"NO.%d",i]];
    }
    _pickSpyView.delegate = self;
    _pickSpyView.dataSource = self;
    _pickSpyView.showsSelectionIndicator = YES;
    
}

- (IBAction)startGame:(id)sender {
    
    //appoint spy

    //_identity.spyNo = 3;

    //go to next view
    UIStoryboard *checkView = [UIStoryboard storyboardWithName:@"Main"bundle:nil];
        
    UINavigationController *nextView = [checkView instantiateViewControllerWithIdentifier:@"checkIdentityRoot"];
        
    [self.navigationController showViewController:nextView sender:_goButton];
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
