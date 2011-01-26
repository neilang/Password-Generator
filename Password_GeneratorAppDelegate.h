//
// Password_GeneratorAppDelegate.h
// Password Generator
//
// Created by Neil Ang on 26/01/11.
// Copyright 2011 neilang.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Password_GeneratorAppDelegate : NSObject <NSApplicationDelegate> {
	NSWindow    *window;
	NSButton    *_useLetters;
	NSButton    *_useCapitals;
	NSButton    *_useDigits;
	NSButton    *_useSymbols;
	NSSlider    *_sizeSlider;
	NSTextField *_passwordField;
}

@property (assign) IBOutlet NSWindow    *window;
@property (assign) IBOutlet NSButton    *useLetters;
@property (assign) IBOutlet NSButton    *useCapitals;
@property (assign) IBOutlet NSButton    *useDigits;
@property (assign) IBOutlet NSButton    *useSymbols;
@property (assign) IBOutlet NSSlider    *sizeSlider;
@property (assign) IBOutlet NSTextField *passwordField;

-(IBAction)generatePassword:(id)sender;

@end
