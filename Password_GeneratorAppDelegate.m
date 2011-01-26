//
// Password_GeneratorAppDelegate.m
// Password Generator
//
// Created by Neil Ang on 26/01/11.
// Copyright 2011 neilang.com. All rights reserved.
//

#import "Password_GeneratorAppDelegate.h"

@implementation Password_GeneratorAppDelegate

@synthesize window;
@synthesize useLetters    = _useLetters;
@synthesize useCapitals   = _useCapitals;
@synthesize useDigits     = _useDigits;
@synthesize useSymbols    = _useSymbols;
@synthesize sizeSlider    = _sizeSlider;
@synthesize passwordField = _passwordField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	srand(time(NULL));
}

- (void)awakeFromNib {
	[self.sizeSlider setIntegerValue:8];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

- (NSArray *)desiredCharacters {
	NSMutableArray *alphabet = [[NSMutableArray alloc] init];

	NSCharacterSet *letters  = [NSCharacterSet lowercaseLetterCharacterSet];
	NSCharacterSet *capitals = [NSCharacterSet uppercaseLetterCharacterSet];
	NSCharacterSet *digits   = [NSCharacterSet decimalDigitCharacterSet];
	NSCharacterSet *symbols  = [NSCharacterSet characterSetWithCharactersInString:@"!~#$%&*()[]{}?<>;+="];

	for (int i = 0; i < 128; i++) {
		if (
		  ([self.useLetters state] && [letters characterIsMember:i]) ||
		  ([self.useCapitals state] && [capitals characterIsMember:i]) ||
		  ([self.useDigits state] && [digits characterIsMember:i]) ||
		  ([self.useSymbols state] && [symbols characterIsMember:i])
		  ) {
			[alphabet addObject:[NSString stringWithFormat:@"%c", i]];
		}
	}

	// Incase nothing is checked
	if ([alphabet count] < 1) {
		[alphabet addObject:@""];
	}

	return [alphabet autorelease];
}

- (IBAction)generatePassword:(id)sender {
	NSArray *alphabet = [self desiredCharacters];

	int size = [self.sizeSlider intValue];

	NSMutableString *password = [[NSMutableString alloc] init];

	for (int i = 0; i < size; i++) {
		int j = rand() % [alphabet count];
		[password appendString:[alphabet objectAtIndex:j]];
	}

	[self.passwordField setStringValue:[password autorelease]];

	// Remove cursor from text field
	[[self window] makeFirstResponder:nil];
}

- (void)dealloc {
	self.useLetters    = nil;
	self.useCapitals   = nil;
	self.useDigits     = nil;
	self.useSymbols    = nil;
	self.sizeSlider    = nil;
	self.passwordField = nil;
	[super dealloc];
}

@end
