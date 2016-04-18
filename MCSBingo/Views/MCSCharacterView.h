//
//  MCSCharacterView.h
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCSCharacter.h"

//@class MCSCharacter;
@interface MCSCharacterView : UIView
@property(nonatomic, strong) MCSCharacter *randomCharacter;
@property(nonatomic, weak) IBOutlet UILabel *randomCharLabel;
@end
