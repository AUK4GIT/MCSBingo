//
//  ViewController.m
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "ViewController.h"
#import "MCSBingoView.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet MCSBingoView *bingoView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)runTheGame:(id)sender{
    [self.bingoView runTheGame:^(int score) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"MCS Bingo"
                                      message:[NSString stringWithFormat:@"Your Score: %d",score]
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
