//
//  Status.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BaseStatus.h"

@class User;
 
@interface Status : NSObject {

	NSDate * created_at; //Time when created 
	NSString * WBid;     //WEIBO Id;
	NSString * source;   //source 
	BOOL favorited;
	BOOL truncated;
	NSString * in_reply_to_status_id;
	NSString * in_reply_to_user_id;
	NSString * in_reply_to_screen_name;
	//double latitude;
	//double longitude;
	NSString * thumbnail_pic;  //URL
	NSString * bmiddle_pic;    //URL
	NSString * original_pic;   //URL
	Status * retweeted_status; //REtweeted 
	User * user;            
	NSString * text;
}


@property (readwrite,retain) NSDate * created_at;
@property (readwrite,retain) NSString * WBid;
@property (readwrite,retain) NSString * source;
@property (readwrite,assign) BOOL truncated;
@property (readwrite,retain) NSString * in_reply_to_status_id;
@property (readwrite,retain) NSString * in_reply_to_user_id;
@property (readwrite,assign) BOOL favorited;
@property (readwrite,retain) NSString * in_reply_to_screen_name;
//@property (readwrite,assign) double latitude;
//@property (readwrite,assign) double longitude;
@property (readwrite,retain) NSString * thumbnail_pic;
@property (readwrite,retain) NSString * bmiddle_pic;
@property (readwrite,retain) NSString * original_pic;
@property (readwrite,retain) Status * retweeted_status;
@property (readwrite,retain) User * user;
@property (retain) 	NSString * text;


@end
