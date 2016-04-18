//
//  MCSBingoModel.h
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MCSCharacter;
@interface MCSBingoModel : NSObject

- (MCSCharacter *)getCharacterObjectForRow:(int)row column:(int)column;
- (void)runTheGame;
- (void)calculateScore:( void (^)(int))completionBlock;
@end
