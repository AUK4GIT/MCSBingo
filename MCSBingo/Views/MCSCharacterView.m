//
//  MCSCharacterView.m
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "MCSCharacterView.h"
//#import "MCSCharacter.h"

@implementation MCSCharacterView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)setRandomCharacter:(MCSCharacter *)randomCharacter{
    _randomCharacter = randomCharacter;
    
    [_randomCharacter addObserver:self forKeyPath:@"randomChar" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"randomChar"]) {
        self.randomCharLabel.text = [change objectForKey:NSKeyValueChangeNewKey];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
