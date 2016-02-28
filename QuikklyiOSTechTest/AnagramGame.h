//
//  AnagramGame.h
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 19/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WordDictionary.h"

/**
 * Class managing an anagram game, similar to the TV show Countdown.
 * <p/>
 * The game is constructed with a base set of letters, e.g. the string "areallylongword",
 * which may be assumed to be all in lowercase, and with no whitespace or special characters. Users then attempt to create
 * words out of the letters, and score one point for each letter used. The submissions must be "real words": use
 * the WordDictionary to check each submission.
 * <p/>
 * For example:
 * "no" is an acceptable submission, with score 2
 * "grow" is an acceptable submission, with score 4
 * "bold" is not an acceptable submission
 * "glly" is not an acceptable submission
 * "woolly" is an acceptable submission with score 6
 * "adder" is not an acceptable submission
 * <p/>
 * Throughout this test, you need not worry about whitespace, special characters, or uppercase. You may assume
 * that both the original string of letters and all submissions contain none of these.
 */

@interface AnagramGame : NSObject

@property NSString *anagram;

-(id) initWithDictionary :(WordDictionary*) dictionary
                andString:(NSString*)string;

/**
 * Submits a word to check within an Anagram, and provides a tru/false response to
 * @param word     User's submission. All submissions may be assumed to be lowercase and containing no whitespace
 *                 or special characters.
 * @return the user's score, 0 if the word is not accepted
 */
-(BOOL) submitWord : (NSString*) word;

@end
