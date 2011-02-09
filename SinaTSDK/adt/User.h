//
//  User.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Status;

@interface User : NSObject {

	NSString * uid;               //User ID
	NSString * screen_name;       //Surname
	NSString * name;              //user name
	NSString * province;          //Code of province *
	NSInteger  city;              //Code of City
	NSString * location;          //Adresse
	NSString * usrDesc;       //self descrpition
	NSString * url;	              //Url
	NSString * profile_image_url; //Url of image
	NSString * domain;            //self Url
	NSString * gender;            //m = male, f = female, n = unknown
	NSInteger  followers_count;  //Number of followers
	NSInteger  friends_count;    //Number of follows
	NSInteger  favourites_count; //Number of msgs
	NSDate * created_at;          //time when created
	BOOL verified;                //Is V?
	
	
	Status * status;
	NSInteger  statuses_count;
/*	BOOL  isProtected;           
	int  utc_offset;
	NSString * time_zone;
	BOOL following;
	BOOL notifications;
	int  
	
	
	NSString * profile_background_color;
	NSString * profile_text_color;
	NSString * profile_link_color;
	NSString * profile_sidebar_fill_color;
	NSString * profile_sidebar_border_color;
	NSString * profile_background_image_url;
	NSString * profile_background_tile;
	BOOL allow_all_act_msg;
	BOOL geo_enabled;*/
	
}

@property (readwrite,retain) NSString * uid;
@property (readwrite,retain) NSString * name;
@property (readwrite,retain) NSString * screen_name;
@property (readwrite,retain) NSString * usrDesc;
@property (readwrite,retain) NSString * profile_image_url;
@property (readwrite,retain) NSString * url;
//@property (readwrite,assign) BOOL isProtected;
@property (readwrite,assign) NSInteger  followers_count;
@property (readwrite,assign) NSInteger  friends_count;
@property (readwrite,retain) NSDate * created_at;
@property (readwrite,assign) NSInteger  favourites_count;
//@property (readwrite,assign) int  utc_offset;
//@property (readwrite,retain) NSString * time_zone;
//@property (readwrite,assign) BOOL  following;
//@property (readwrite,assign) BOOL  notifications;
@property (readwrite,assign) NSInteger  statuses_count;
@property (readwrite,assign) BOOL  verified;
//@property (readwrite,retain) NSString * profile_background_color;
//@property (readwrite,retain) NSString * profile_text_color;
//@property (readwrite,retain) NSString * profile_link_color;
//@property (readwrite,retain) NSString * profile_sidebar_fill_color;
//@property (readwrite,retain) NSString * profile_sidebar_border_color;
//@property (readwrite,retain) NSString * profile_background_image_url;
//@property (readwrite,retain) NSString * profile_background_tile;
@property (readwrite,retain) NSString * province;
@property (readwrite,assign) NSInteger city;
@property (readwrite,retain) NSString * location;
@property (readwrite,retain) NSString * domain;
@property (readwrite,retain) NSString * gender;
//@property (readwrite,assign) BOOL  allow_all_act_msg;
//@property (readwrite,assign) BOOL  geo_enabled;
@property (readwrite,retain) Status * status;

@end
