//
//  User.m
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//  Modified by ZHAO Fan.
//


#import "User.h"
#import "Status.h"

@implementation User

@synthesize uid;
@synthesize name;
@synthesize screen_name;
@synthesize usrDesc;
@synthesize profile_image_url;
@synthesize url;
//@synthesize isProtected;
@synthesize followers_count;
@synthesize friends_count;
@synthesize created_at;
@synthesize favourites_count;
//@synthesize utc_offset;
//@synthesize time_zone;
//@synthesize following;
//@synthesize notifications;
@synthesize statuses_count;
@synthesize verified;
//@synthesize profile_background_color;
//@synthesize profile_text_color;
//@synthesize profile_link_color;
//@synthesize profile_sidebar_fill_color;
//@synthesize profile_sidebar_border_color;
//@synthesize profile_background_image_url;
//@synthesize profile_background_tile;
@synthesize province;
@synthesize city;
@synthesize location;
@synthesize domain;
@synthesize gender;
//@synthesize allow_all_act_msg;
//@synthesize geo_enabled;
@synthesize status;

-(NSString *)description{
	NSMutableString * str = [[NSMutableString alloc] init];
	[str appendString:@"------------------User---------------------\n"];
	[str appendFormat:@"ScreenName : %@ \nUID: %@\nURL: %@\nfollowers_count: %d\nlocation: %@\nprofile_image_url:%@\n",
					  screen_name, uid, url, followers_count, location, profile_image_url];
	if (status != nil){
		[str appendFormat:@"status : \n%@",status];
	}
	[str appendString:@"------------------User Fin-----------------\n"];
	return str;
}

-(void) dealloc{
	[uid release];
	[name release];
	[screen_name release];
	[usrDesc release];
	[profile_image_url release];
	[url release];
	[created_at release];
	//[time_zone release];
//	[profile_background_tile release];
//	[profile_text_color release];
//	[profile_link_color release];
//	[profile_sidebar_fill_color release];
//	[profile_sidebar_border_color release];
//	[profile_background_image_url release];
//	[profile_background_tile release];
	[province release];
	//[city release];
	[location release];
	[domain release];
	[gender release];
	[status release];
	[super dealloc];	
}
@end
