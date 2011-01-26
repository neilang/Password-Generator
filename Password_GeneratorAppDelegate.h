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
	
	NSSlider    *_lettersSlider;
	NSSlider    *_capitalsSlider;
	NSSlider    *_digitsSlider;
	NSSlider    *_symbolsSlider;
  NSTextField *_passwordField;
  NSTextField *_lettersField;
  NSTextField *_capitalsField;
  NSTextField *_digitsField;
  NSTextField *_symbolsField;
  
}

@property (assign) IBOutlet NSWindow    *window;
@property (assign) IBOutlet NSSlider    *lettersSlider;
@property (assign) IBOutlet NSSlider    *capitalsSlider;
@property (assign) IBOutlet NSSlider    *digitsSlider;
@property (assign) IBOutlet NSSlider    *symbolsSlider;
@property (assign) IBOutlet NSTextField *passwordField;
@property (assign) IBOutlet NSTextField *lettersField;
@property (assign) IBOutlet NSTextField *capitalsField;
@property (assign) IBOutlet NSTextField *digitsField;
@property (assign) IBOutlet NSTextField *symbolsField;

- (IBAction)generatePassword:(id)sender;

@end
