//
//  DirectMessage.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "DirectMessage.h"


@implementation DirectMessage

@synthesize msg_id;
@synthesize text;
@synthesize sender_id;
@synthesize recipient_id;
@synthesize sender_screen_name;
@synthesize recipient_screen_name;
@synthesize sender;
@synthesize recipient;
@synthesize created_at;


-(NSString *) description{
	NSMutableString * str = [[NSMutableString alloc]init];
	[str appendString:@"----------------directeMessage-----------"];
	[str appendFormat:@"text : %@\n", text];
	[str appendFormat:@"created : %@\n",created_at];
	[str appendFormat:@"id : %@\n", msg_id];
	[str appendFormat:@"sender id : %@\n", sender_id];
	[str appendFormat:@"sender name : %@\n", sender_screen_name];
	[str appendFormat:@"recipient id : %@\n", recipient_id];
	[str appendFormat:@"recipient name : %@\n", recipient_screen_name];
	
	[str appendFormat:@"sender : \n %@", sender];
	[str appendFormat:@"recipient : \n %@", recipient];
	[str appendString:@"-----------------------------------------"];
	return str;
}

-(void) dealloc{
	[created_at release];
	[text release];
	[msg_id release];
	[recipient_id release];
	[sender_id release];
	[sender_screen_name release];
	[recipient_screen_name release];
	[sender release];
	[recipient release];
	[super dealloc];	
}
@end
