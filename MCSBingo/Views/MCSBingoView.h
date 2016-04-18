//
//  MCSBingoView.h
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MCSBingoModel;
@interface MCSBingoView : UIView
@property (nonatomic, strong)MCSBingoModel *bingoModel;

- (void)runTheGame:( void (^)(int))completionBlock;
@end
