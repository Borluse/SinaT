//
//  SinaTApiAppDelegate.h
//  SinaTApi
//
//  Created by Fan ZHAO on 11-2-7.
//  Copyright 2011年 Personne. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SinaApiRequest.h"


@interface SinaTApiAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    OAuthBase * auth;
	NSTextField *pin;
	SinaApiRequest * sinaAPI;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *pin;
@property (retain) SinaApiRequest * sinaAPI;
//@property (retain) testOauth * test;
-(IBAction) getReqToken: (id) sender;
-(IBAction) getAccToken: (id) sender;
-(IBAction) getUserInfo: (id) sender;
@end
