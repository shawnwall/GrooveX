//
//  MediaKeyApplication.m
//  GrooveX
//
//  Created by Shawn Wall on 11/30/15.
//  Copyright © 2015 TwoTap Labs. All rights reserved.
//

#import "MediaKeyApplication.h"
#import <IOKit/hidsystem/ev_keymap.h>

NSString * const MediaKeyPlayPauseNotification = @"MediaKeyPlayPauseNotification";
NSString * const MediaKeyNextNotification = @"MediaKeyNextNotification";
NSString * const MediaKeyPreviousNotification = @"MediaKeyPreviousNotification";

@implementation MediaKeyApplication


- (void)sendEvent:(NSEvent *)event
{
    // Catch media key events
    if ([event type] == NSSystemDefined && [event subtype] == 8)
    {
        int keyCode = (([event data1] & 0xFFFF0000) >> 16);
        int keyFlags = ([event data1] & 0x0000FFFF);
        int keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA;
        
        // Process the media key event and return
        [self mediaKeyEvent:keyCode state:keyState];
        return;
    }
    
    // Continue on to super
    [super sendEvent:event];
}

- (void)mediaKeyEvent:(int)key state:(BOOL)state
{
    switch (key)
    {
            // Play pressed
        case NX_KEYTYPE_PLAY:
            [[NSNotificationCenter defaultCenter] postNotificationName:MediaKeyPlayPauseNotification object:nil];
            break;
            
            // Rewind
        case NX_KEYTYPE_FAST:
            [[NSNotificationCenter defaultCenter] postNotificationName:MediaKeyNextNotification object:nil];
            break;
            
            // Previous
        case NX_KEYTYPE_REWIND:
            [[NSNotificationCenter defaultCenter] postNotificationName:MediaKeyPreviousNotification object:nil];
            break;
    }
}

@end
