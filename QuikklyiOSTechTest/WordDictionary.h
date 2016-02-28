//
//  WordDictionary.h
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 21/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordDictionary : NSObject

/**
 * @param word
 * @return true if the contents of word.txt contains the word
 */
-(BOOL) contains : (NSString*) word;

@end
