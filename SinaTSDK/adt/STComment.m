//
//  STComment.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import "STComment.h"


@implementation STComment

@synthesize Cid;
@synthesize text;
@synthesize truncated;
@synthesize created_at;
@synthesize source;
@synthesize user;
@synthesize status;
@synthesize reply_comment;

-(void) dealloc{
	[Cid release];
	[text release];
	[source release];
	[created_at release];
	[user release];
	[status release];
	[reply_comment release];
	[super dealloc];
}

-(NSString *) description{

	NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
//	[formatter setDateFormat:@"EEE dd HH:mm:ss ZZZ YYYY"];

	NSMutableString * str = [[NSMutableString alloc] init];
	[str appendString:@"----------------STComment-------------------\n"];
	[str appendFormat:@"text: %@\n Cid : %@ \n created at : %@\n", text, Cid, created_at];
	if (user != nil){
		[str appendFormat:@"user : \n%@", user];
	}
	if (status != nil){
		[str appendFormat:@"status : \n%@", status];
	}
	[str appendString:@"---------------STComment Fin----------------\n"];
	return str;
}
@end
