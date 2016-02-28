//
//  WordDictionary.m
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 21/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import "WordDictionary.h"

@interface WordDictionary ()

@property NSArray* wordArray;

@end

@implementation WordDictionary

/*
 * I'm loading the whole file in one go because I know it's only 2.5mb
 * Otherwise I'd find a way to load it in manageable chunks
 * Such as those discussed on http://stackoverflow.com/questions/1044334/objective-c-reading-a-file-line-by-line
 */
-(id) init {
    self = [super init];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"];
    
    NSError* error;
    NSString* wholeFileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"%s Error loading file: %@", __PRETTY_FUNCTION__, error.debugDescription);
    } else {
        _wordArray = [wholeFileContents componentsSeparatedByString:@"\n"];
        if (self.wordArray.count == 0) {
            NSLog(@"%s Error: Dictionary is empty", __PRETTY_FUNCTION__);
        }
    }
    
    return self;
}

/*
 * If the object being searched was any more complex I'd use NSPredicate at least,
 * but this is a simple array of single words, so I can use containsObject
 */
-(BOOL) contains : (NSString*) word {
    BOOL response = FALSE;
    
    if ([self.wordArray containsObject:word]) {
        response = TRUE;
    }
    
    return response;
}

@end
