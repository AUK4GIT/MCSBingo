//
//  MCSBingoModel.m
//  MCSBingo
//
//  Created by Uday Kiran Ailapaka on 16/04/16.
//  Copyright © 2016 Uday Kiran Ailapaka. All rights reserved.
//

#import "MCSBingoModel.h"
#import "MCSCharacter.h"

@interface MCSBingoModel ()
{
    id grid[3][3];
    char *charactersArray[4];
}
@end
@implementation MCSBingoModel

- (id)init{
    if (self = [super init]) {
        charactersArray[0] = "M";
        charactersArray[1] = "C";
        charactersArray[2] = "S";
        charactersArray[3] = "*";
    }
    return self;
}

- (MCSCharacter *)getCharacterObjectForRow:(int)row column:(int)column{
    MCSCharacter *randomChar = [[MCSCharacter alloc] init];
    randomChar.row = row-1;
    randomChar.column = column-1;
    randomChar.randomChar = "*";
    grid[row-1][column-1] = randomChar;
    return randomChar;
}

- (void)runTheGame{
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            MCSCharacter *ranCharObj = grid[i][j];
            int randomNum = arc4random_uniform(4);
            ranCharObj.randomChar = charactersArray[randomNum];
        }
    }
}

- (void)calculateScore:(void (^)(int))completionBlock {
    [self startCheckingForMatches:^(int score){
        completionBlock(score);
    }];
}

- (void)startCheckingForMatches:(void (^)(int))completionBlock {
    int numberOfMatches = 0;
    for (int j=0; j<3; j++) {
        NSLog(@"row: %d Mathcing: %@",j,([self checkMatchingForRow:j] ? @"YES" : @"NO"));
        NSLog(@"col: %d Mathcing: %@",j,([self checkMatchingForColumn:j] ? @"YES" : @"NO"));
        if ([self checkMatchingForRow:j]) {
            numberOfMatches++;
        }
        if ([self checkMatchingForColumn:j]) {
            numberOfMatches++;
        }
    }
    if ([self checkMatchingForDiagonalOne]) {
        numberOfMatches++;
    }
    if ([self checkMatchingForDiagonalTwo]) {
        numberOfMatches++;
    }
    NSLog(@"Diagonal1 Mathcing: %@",([self checkMatchingForDiagonalOne] ? @"YES" : @"NO"));
    NSLog(@"Diagonal2 Mathcing: %@",([self checkMatchingForDiagonalTwo] ? @"YES" : @"NO"));
    int totalScore = (int)(numberOfMatches == 0 ? 0 :pow(numberOfMatches, numberOfMatches-1));
    NSLog(@"TotalScore: %d",totalScore);
    completionBlock(totalScore);
}

- (BOOL)checkMatchingForRow:(int)row {
    for (int col=0; col<3; col++) {
        MCSCharacter *ranCharObj = grid[row][col];
        if (col==0 && !(strcmp(ranCharObj.randomChar, "S") == 0 || strcmp(ranCharObj.randomChar, "M") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
              return false;
        } else if (col==1 && !(strcmp(ranCharObj.randomChar, "C") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
            return false;
        } else if (col==2 && !(strcmp(ranCharObj.randomChar, "*") == 0)) {
            MCSCharacter *firstRanCharObj = grid[row][0];
            if ((strcmp(ranCharObj.randomChar, "S") == 0 && strcmp(firstRanCharObj.randomChar, "M") == 0)) {
                return true;
            } else if ((strcmp(ranCharObj.randomChar, "M") == 0 && strcmp(firstRanCharObj.randomChar, "S") == 0)) {
                return true;
            }
            return false;
        }
    }
    return true;
}

- (BOOL)checkMatchingForColumn:(int)column {
    for (int row=0; row<3; row++) {
        MCSCharacter *ranCharObj = grid[row][column];
        if (row==0 && !(strcmp(ranCharObj.randomChar, "S") == 0 || strcmp(ranCharObj.randomChar, "M") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
            return false;
        } else if (row==1 && !(strcmp(ranCharObj.randomChar, "C") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
            return false;
        } else if (row==2 && !(strcmp(ranCharObj.randomChar, "*") == 0)) {
            MCSCharacter *firstRanCharObj = grid[0][column];
            if ((strcmp(ranCharObj.randomChar, "S") == 0 && strcmp(firstRanCharObj.randomChar, "M") == 0)) {
                return true;
            } else if ((strcmp(ranCharObj.randomChar, "M") == 0 && strcmp(firstRanCharObj.randomChar, "S") == 0)) {
                return true;
            }
            return false;
        }
    }
    return true;
}

- (BOOL)checkMatchingForDiagonalOne {
    for (int row=0; row<3; row++) {
        for (int col=0; col<3; col++) {
            if (row == col) {
                MCSCharacter *ranCharObj = grid[row][col];
                if (col==0 && !(strcmp(ranCharObj.randomChar, "S") == 0 || strcmp(ranCharObj.randomChar, "M") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
                    return false;
                } else if (col==1 && !(strcmp(ranCharObj.randomChar, "C") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
                    return false;
                } else if (col==2 && !(strcmp(ranCharObj.randomChar, "*") == 0)) {
                    MCSCharacter *firstRanCharObj = grid[row][0];
                    if ((strcmp(ranCharObj.randomChar, "S") == 0 && strcmp(firstRanCharObj.randomChar, "M") == 0)) {
                        return true;
                    } else if ((strcmp(ranCharObj.randomChar, "M") == 0 && strcmp(firstRanCharObj.randomChar, "S") == 0)) {
                        return true;
                    }
                    return false;
                }
            }
        }
    }
    return true;
}

- (BOOL)checkMatchingForDiagonalTwo {
    for (int col=0; col<3; col++) {
        for (int row=0; row<3; row++) {
                MCSCharacter *ranCharObj = grid[row][col];
                if (row==2 && col==0 && !(strcmp(ranCharObj.randomChar, "S") == 0 || strcmp(ranCharObj.randomChar, "M") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
                    return false;
                } else if (row==1 && col==1 && !(strcmp(ranCharObj.randomChar, "C") == 0 || strcmp(ranCharObj.randomChar, "*") == 0)) {
                    return false;
                } else if (row==0 && col==2 && !(strcmp(ranCharObj.randomChar, "*") == 0)) {
                    MCSCharacter *firstRanCharObj = grid[2][0];
                    if ((strcmp(ranCharObj.randomChar, "S") == 0 && strcmp(firstRanCharObj.randomChar, "M") == 0)) {
                        return true;
                    } else if ((strcmp(ranCharObj.randomChar, "M") == 0 && strcmp(firstRanCharObj.randomChar, "S") == 0)) {
                        return true;
                    }
                    return false;
                }
        }
    }
    return true;
}

@end
