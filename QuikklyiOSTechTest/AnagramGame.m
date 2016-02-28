//
//  AnagramGame.m
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 21/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import "AnagramGame.h"
#import "WordDictionary.h"


@interface AnagramGame ()

@property WordDictionary *wordDictionary;

@end

@implementation AnagramGame

-(id) initWithDictionary:(WordDictionary *)dictionary
               andString:(NSString*)string
{
    self = [super init];
    _wordDictionary = dictionary;
    _anagram = string;
    return self;
}

/*
 * First check the word exists in the dictionary,
 * then check the word is contained in the anagram.
 */
-(BOOL) submitWord : (NSString*) word {
    BOOL response = FALSE;
    
    if ([self.wordDictionary contains:word] &&
        [self anagramContainsWord:word]) {
        response = TRUE;
    }
    
    return response;
}

/*
 * Check the word is contained in the anagram
 * from http://stackoverflow.com/questions/13115264/check-if-nsstring-contains-all-or-some-characters
 */
- (BOOL)anagramContainsWord:(NSString*)word {
    BOOL response = TRUE;
    
    NSCountedSet *queryLetters = [self wordLetters:[self.anagram lowercaseString]];
    NSCountedSet *wordLetters = [self wordLetters:[word lowercaseString]];
    for (NSString *wordLetter in wordLetters) {
        int wordCount = (int)[wordLetters countForObject:wordLetter];
        int queryCount = (int)[queryLetters countForObject:wordLetter];
        if (wordCount > queryCount) {
            response = FALSE;
            break;
        }
    }
    
    return response;
}

- (NSCountedSet *)wordLetters:(NSString *)text {
    NSCountedSet *res = [NSCountedSet set];
    
    for (NSUInteger i = 0; i < text.length; i++) {
        [res addObject:[text substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return res;
}

@end
