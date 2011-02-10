//
//  DirectMessage.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//  Modified by ZHAO Fan.
//

#import <Foundation/Foundation.h>
//#import "BaseStatus.h"
#import "User.h"

@interface DirectMessage : NSObject {
	NSString * msg_id;
	NSString * text;
	NSString * sender_id;
	NSString * recipient_id;
	NSString * sender_screen_name;
	NSString * recipient_screen_name;
	NSDate * created_at;
	User * sender;
	User * recipient;	
}

@property (retain) 	NSDate * created_at;
@property (readwrite,retain) NSString * msg_id;
@property (readwrite,retain) NSString * text;
@property (readwrite,retain) NSString * sender_id;
@property (readwrite,retain) NSString * recipient_id;
@property (readwrite,retain) NSString * sender_screen_name;
@property (readwrite,retain) NSString * recipient_screen_name;
@property (readwrite,retain) User * sender;
@property (readwrite,retain) User * recipient;

@end
