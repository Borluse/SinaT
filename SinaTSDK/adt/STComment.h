//
//  STComment.h
//  weibo4objc
//
//  Created by fanng yuan on 12/8/10.
//  Copyright 2010 fanngyuan@sina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Status.h"

@interface STComment : NSObject {
	NSString * Cid;
	NSString * text;
	NSString * source;
	BOOL truncated;
	NSDate * created_at;
	User * user;
	Status * status;
	STComment * reply_comment;
	
}

@property (readwrite,retain) NSString * Cid;
@property (readwrite,retain) NSString * text;
@property (readwrite,retain) NSDate * created_at;
@property (readwrite,assign) BOOL truncated;
@property (readwrite,retain) NSString * source;
@property (readwrite,retain) User * user;
@property (readwrite,retain) Status * status;
@property (readwrite,retain) STComment * reply_comment;

@end
