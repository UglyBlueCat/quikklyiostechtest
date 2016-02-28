//
//  ViewController.m
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 21/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "AnagramGame.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel* titleLabel;
@property (strong, nonatomic) UILabel* sourceLabel;
@property (strong, nonatomic) UILabel* inputLabel;
@property (strong, nonatomic) UIButton* inputButton;
@property (strong, nonatomic) UITextField* inputField;
@property AnagramGame* anagramGame;

@end

@implementation ViewController

#pragma mark ViewController methods

- (void)viewDidLoad {
    AppDelegate* appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.anagramGame = appDelegate.anagramGame;
    [super viewDidLoad];
    [self setupViewLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark custom methods

/*
 * Set up the initial view layout
 */
- (void)setupViewLayout {
    CGFloat topMargin = 50;
    CGFloat margin = 10;
    CGFloat standardHeight = 30;
    CGFloat standardWidth = 150;
    CGFloat screenWidth = CGRectGetWidth(self.view.bounds);
    UIColor* bgColor = [UIColor colorWithRed:0.5 green:0 blue:1 alpha:1];
    UIColor* inputColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    
    [self.view setBackgroundColor:bgColor];
    
    self.titleLabel = [self createLabelWithTitle:@"Anagram Game"
                                            Left:margin
                                             Top:topMargin
                                           Width:screenWidth - 2*margin
                                          Height:standardHeight];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    
    self.sourceLabel = [self createLabelWithTitle:[NSString stringWithFormat:@"Source String: %@", self.anagramGame.anagram]
                                            Left:margin
                                             Top:CGRectGetMaxY(self.titleLabel.frame) + 2*margin
                                           Width:screenWidth - 2*margin
                                          Height:standardHeight];
    
    self.inputLabel = [self createLabelWithTitle:@"Enter word:"
                                            Left:margin
                                             Top:CGRectGetMaxY(self.sourceLabel.frame) + 2*margin
                                           Width:standardWidth
                                          Height:standardHeight];
    
    CGRect inputFieldFrame = CGRectMake(margin,
                                        CGRectGetMaxY(self.inputLabel.frame) + margin,
                                        standardWidth,
                                        standardHeight);
    
    self.inputField = [[UITextField alloc] initWithFrame:inputFieldFrame];
    [self.inputField setBackgroundColor:inputColor];
    [self.inputField setKeyboardType:UIKeyboardTypeAlphabet];
    [self.inputField setSpellCheckingType:UITextSpellCheckingTypeNo];
    [self.inputField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [self.inputField setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    CGRect inputButtonFrame = CGRectMake((screenWidth - standardWidth)/2,
                                         CGRectGetMaxY(self.inputField.frame) + 2*margin,
                                         standardWidth,
                                         standardHeight);
    
    self.inputButton = [[UIButton alloc] initWithFrame:inputButtonFrame];
    [self.inputButton setTitle:@"Submit Word" forState:UIControlStateNormal];
    [self.inputButton setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [[self.inputButton layer] setCornerRadius:5];
    [[self.inputButton layer] setBorderWidth:2];
    [[self.inputButton layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [self.inputButton addTarget:self action:@selector(submitWord) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.sourceLabel];
    [self.view addSubview:self.inputLabel];
    [self.view addSubview:self.inputField];
    [self.view addSubview:self.inputButton];
}

/*
 * This could be done with a seperate subclass of UILabel to increase code reusability and skinnability
 */
- (UILabel*)createLabelWithTitle:(NSString*)title
                            Left:(CGFloat)left
                             Top:(CGFloat)top
                           Width:(CGFloat)width
                          Height:(CGFloat)height
{
    CGRect frame = CGRectMake(left, top, width, height);
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    [label setText:title];
    return label;
}

/*
 * Before submitting the word entered I am only checking there is something there.
 * In an ideal world I would also check characters are only lower case alphabetic.
 */
- (void)submitWord {
    BOOL goodWord = FALSE;
    if (self.inputField.text.length > 0) {
        goodWord = [self.anagramGame submitWord:self.inputField.text];
        if (goodWord) {
            [self alertWithMessage:@"Good Word! :)"];
        } else {
            [self alertWithMessage:@"Bad Word! :("];
        }
    } else {
        [self alertWithMessage:@"Please enter a word"];
    }
}

/*
 * Show the user a message with an OK button
 */
- (void)alertWithMessage:(NSString*)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Quikkly Test Anagram Game"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self showViewController:alert sender:self];
}

@end
