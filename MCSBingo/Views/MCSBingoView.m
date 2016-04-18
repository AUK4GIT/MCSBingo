//
//  MCSBingoView.m
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "MCSBingoView.h"
#import "MCSBingoModel.h"
#import "MCSCharacterView.h"

@implementation MCSBingoView
{
    NSArray *arrayOfCharacterView;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.bingoModel = [[MCSBingoModel alloc] init];
    }
    return self;
}

- (void)awakeFromNib {
    NSLog(@"%lu",(unsigned long)[self subviews].count);
    MCSCharacterView *randomCharView1 = (MCSCharacterView *)[self viewWithTag:1];
    NSAssert(!(randomCharView1 == nil), @"Error characterview with tag 1 not found");
    randomCharView1.randomCharacter = [self.bingoModel getCharacterObjectForRow:1 column:1];
    
    MCSCharacterView *randomCharView2 = (MCSCharacterView *)[self viewWithTag:2];
    NSAssert(!(randomCharView2 == nil), @"Error characterview with tag 2 not found");
    randomCharView2.randomCharacter = [self.bingoModel getCharacterObjectForRow:1 column:2];
    
    MCSCharacterView *randomCharView3 = (MCSCharacterView *)[self viewWithTag:3];
    NSAssert(!(randomCharView3 == nil), @"Error characterview with tag 3 not found");
    randomCharView3.randomCharacter = [self.bingoModel getCharacterObjectForRow:1 column:3];
    
    MCSCharacterView *randomCharView4 = (MCSCharacterView *)[self viewWithTag:4];
    NSAssert(!(randomCharView4 == nil), @"Error characterview with tag 4 not found");
    randomCharView4.randomCharacter = [self.bingoModel getCharacterObjectForRow:2 column:1];
    
    MCSCharacterView *randomCharView5 = (MCSCharacterView *)[self viewWithTag:5];
    NSAssert(!(randomCharView5 == nil), @"Error characterview with tag 5 not found");
    randomCharView5.randomCharacter = [self.bingoModel getCharacterObjectForRow:2 column:2];
    
    MCSCharacterView *randomCharView6 = (MCSCharacterView *)[self viewWithTag:6];
    NSAssert(!(randomCharView6 == nil), @"Error characterview with tag 6 not found");
    randomCharView6.randomCharacter = [self.bingoModel getCharacterObjectForRow:2 column:3];
    
    MCSCharacterView *randomCharView7 = (MCSCharacterView *)[self viewWithTag:7];
    NSAssert(!(randomCharView7 == nil), @"Error characterview with tag 7 not found");
    randomCharView7.randomCharacter = [self.bingoModel getCharacterObjectForRow:3 column:1];
    
    MCSCharacterView *randomCharView8 = (MCSCharacterView *)[self viewWithTag:8];
    NSAssert(!(randomCharView8 == nil), @"Error characterview with tag 8 not found");
    randomCharView8.randomCharacter = [self.bingoModel getCharacterObjectForRow:3 column:2];
    
    MCSCharacterView *randomCharView9 = (MCSCharacterView *)[self viewWithTag:9];
    NSAssert(!(randomCharView9 == nil), @"Error characterview with tag 9 not found");
    randomCharView9.randomCharacter = [self.bingoModel getCharacterObjectForRow:3 column:3];
    
    arrayOfCharacterView = [[NSArray alloc] initWithObjects:randomCharView1, randomCharView2, randomCharView3, randomCharView4, randomCharView5, randomCharView6, randomCharView7, randomCharView8, randomCharView9, nil];

}

- (void)updateUI {
    for (MCSCharacterView *charView in arrayOfCharacterView) {
        charView.randomCharLabel.text = [NSString stringWithUTF8String:charView.randomCharacter.randomChar];
    }
}

- (void)runTheGame:( void (^)(int))completionBlock{
    [self.bingoModel runTheGame];
    [self updateUI];
    [self.bingoModel calculateScore:^(int score) {
        completionBlock(score);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
