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
@synthesize lettersSlider  = _lettersSlider;
@synthesize capitalsSlider = _capitalsSlider;
@synthesize digitsSlider   = _digitsSlider;
@synthesize symbolsSlider  = _symbolsSlider;
@synthesize passwordField  = _passwordField;

@synthesize lettersField  = _lettersField;
@synthesize capitalsField = _capitalsField;
@synthesize digitsField   = _digitsField;
@synthesize symbolsField  = _symbolsField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {}

- (void)awakeFromNib {
	[self generatePassword:nil];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

// Helper function for appending random chars from a supplied alphabet
// And then advances the pointer
char *appendRandom(char *str, char *alphabet, int amount) {
	for (int i = 0; i < amount; i++) {
		int r = arc4random() % strlen(alphabet);
		*str = alphabet[r];
		str++;
	}

	return str;
}

- (IBAction)generatePassword:(id)sender {

	// Get slider values
	int letters  = [self.lettersSlider intValue];
	int capitals = [self.capitalsSlider intValue];
	int digits   = [self.digitsSlider intValue];
	int symbols  = [self.symbolsSlider intValue];
	int length   = letters + capitals + digits + symbols;

	// Update labels
	[self.lettersField setStringValue:[NSString stringWithFormat:@"%d", letters]];
	[self.capitalsField setStringValue:[NSString stringWithFormat:@"%d", capitals]];
	[self.digitsField setStringValue:[NSString stringWithFormat:@"%d", digits]];
	[self.symbolsField setStringValue:[NSString stringWithFormat:@"%d", symbols]];

	// Build the password using C strings - for speed
	char *cPassword = calloc(length, sizeof(char) + 1);
	char *ptr       = cPassword;

	cPassword[length - 1] = '\0';

	char *lettersAlphabet = "abcdefghijklmnopqrstuvwxyz";
	ptr = appendRandom(ptr, lettersAlphabet, letters);

	char *capitalsAlphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	ptr = appendRandom(ptr, capitalsAlphabet, capitals);

	char *digitsAlphabet = "0123456789";
	ptr = appendRandom(ptr, digitsAlphabet, digits);

	char *symbolsAlphabet = "!@#$%*[];?()";
	ptr = appendRandom(ptr, symbolsAlphabet, symbols);

	// Shuffle the string!
	for (int i = 0; i < length; i++) {
		int  r    = arc4random() % length;
		char temp = cPassword[i];
		cPassword[i] = cPassword[r];
		cPassword[r] = temp;
	}

	// Show the password
	[self.passwordField setStringValue:[NSString stringWithCString:cPassword encoding:NSUTF8StringEncoding]];

	// Clean up
	free(cPassword);

}

- (void)dealloc {
	self.lettersSlider  = nil;
	self.capitalsSlider = nil;
	self.digitsSlider   = nil;
	self.symbolsSlider  = nil;
	self.passwordField  = nil;
	self.lettersField   = nil;
	self.capitalsField  = nil;
	self.digitsField    = nil;
	self.symbolsField   = nil;

	[super dealloc];
}

@end
