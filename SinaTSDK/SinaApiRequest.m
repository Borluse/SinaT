//
//  SinaApiRequest.m
//  Test
//
//  Created by Fan ZHAO on 29/12/10.
//  Copyright 2010 Personne. All rights reserved.
//

#import "SinaApiRequest.h"


@implementation SinaApiRequest
@synthesize parser;


-(id) initWithAccessTokenKey:(NSString *) akey secret:(NSString *) asecret{
	if ((self = [super init])) {
		self.accessToken = [[OAToken alloc] initWithKey:akey secret:asecret];
		parser = [[SinaApiParser alloc]init];
	}
	return self;
}
-(NSArray *) retrieveStatusesPublic_timelineWithCount:(NSNumber *)count{
	NSMutableDictionary * parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"count" andValue:count]; 
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/public_timeline.json" 
												withParametreDict:parametre];
	[request setTimeoutInterval:60];
	
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	

}
-(NSArray *) retrieveStatusesFriends_timelineWithSinceID:(NSString *)sid 
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page 
											feature:(NSNumber *)feature{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	[self addParametreInDict:parametre withKey:@"feature" andValue:feature];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/friends_timeline.json" 
												withParametreDict:parametre];
	[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
                       didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

-(NSArray *) retrieveStatusesUser_timelineWithUserID:(NSString *)UID 
									screen_name:(NSString *)sname 
									   since_id:(NSString *)sid  
										  MaxID:(NSString *)max_ID
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page 
										feature:(NSNumber *)feature{
	
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:UID];
	[self addParametreInDict:parametre withKey:@"screen_name" andValue:sname];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	[self addParametreInDict:parametre withKey:@"feature" andValue:feature];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/user_timeline.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

-(NSArray *) retrieveStatusesMentionsWithSince_id:(NSString *)sid
									   MaxID:(NSString *)max_ID
									   Count:(NSNumber *)count 
										Page:(NSNumber *)page{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/mentions.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

-(NSArray *) retrieveStatusesComment_timelineWithSinceID:(NSString *)sid  
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/comments_timeline.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserCommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

-(NSArray *) retrieveStatusesCommentsbymeWithSinceID:(NSString *)sid  
										  MaxID:(NSString *)max_ID 
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/comments_by_me.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserCommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveStatusesCommentstomeWithSinceID:(NSString *)sid  
										  MaxID:(NSString *)max_ID 
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/comments_to_me.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserCommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveStatusesCommentsWithID:(NSString *)weiboid
								 Count:(NSNumber *)count 
								  Page:(NSNumber *)page{
	if (weiboid == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboid should not be nil" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"id" andValue:weiboid];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/comments.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserCommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveStatusesCountsWithids:(NSString *)ids{
	if (ids == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"ids should not be nil" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"ids" andValue:ids];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/counts.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveStatusesRepost_timelineWithID:(NSString *)weiboid 
									 since_id:(NSString *)sid  
										MaxID:(NSString *)max_ID
										Count:(NSNumber *)count 
										 Page:(NSNumber *)page{
	if (weiboid == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboid should not be nil" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	
	[self addParametreInDict:parametre withKey:@"id" andValue:weiboid];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];

	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/repost_timeline.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveStatusesRepostbymeWithID:(NSString *)weiboid
								since_id:(NSString *)sid  
								   MaxID:(NSString *)max_ID
								   Count:(NSNumber *)count 
									Page:(NSNumber *)page{
	if (weiboid == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboid should not be nil" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	
	[self addParametreInDict:parametre withKey:@"id" andValue:weiboid];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/repost_by_me.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveStatusesUnreadWith_new_status:(NSNumber *)with_new_status since_id:(NSString *)sid{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"with_new_status" andValue:with_new_status];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/unread.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveStatusesResetcountWithType:(NSNumber *)type{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"type" andValue:type];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/reset_count.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
#pragma mark -
#pragma mark ---------category access--------
-(Status *) retrieveStatusesShowWithWeiboID:(NSString *)weiboid{
	if (weiboid == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboid should not be nil" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/statuses/show/%@.json",weiboid]
												withParametreDict:nil];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

-(Status *) retrieveUseridStatusesidWithUserID:(NSString *)userId weiboID:(NSString *)weiboID{
	if (userId == nil || weiboID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userId or(and) weiboId is(are) null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/%@/statuses/%@",userId,weiboID]
												withParametreDict:nil];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

-(Status *) retrieveStatusesUpdateWithStatuse:(NSString *)status 
				   in_replay_to_status_id:(NSString *)inreplayID 
								 latitude:(NSNumber *)lat 
							   longtitude:(NSNumber *)lon{
	if (status == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"status shoudn't be null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"status" andValue:status];
	[self addParametreInDict:parametre withKey:@"in_reply_to_status_id" andValue:inreplayID];
	[self addParametreInDict:parametre withKey:@"lat" andValue:lat];
	[self addParametreInDict:parametre withKey:@"long" andValue:lon];

	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/statuses/update.json" withParametreDict:parametre];
    //	NSLog(@"%@",[request HTTPBody]);
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(Status *) retrieveStatusesUploadWithStatuse:(NSString *)status
									  pic:(NSString *)pathPic 
								 latitude:(NSNumber *)lat 
							   longtitude:(NSNumber *)lon{
	if (status == nil || pathPic == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"status or(and) pic is(are) null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
//	NSMutableData * data = [[NSMutableData alloc] initWithData:	[request HTTPBody]];
	[self addParametreInDict:parametre withKey:@"status" andValue:status];
	[self addParametreInDict:parametre withKey:@"lat" andValue:lat];
	[self addParametreInDict:parametre withKey:@"long" andValue:lon];
	
	NSMutableURLRequest *request = [self preparePostPicWithURL:@"http://api.t.sina.com.cn/statuses/upload.json"
													   pathPic:pathPic
                                                       PicName:@"pic" 
													 parametre:parametre];
    return [fetcher fetchDataWithURLRequest:request
                                delegate:parser
                       didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
                         didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(Status *) retrieveStatusesDestroyWithWeiboID:(NSString *)weiboID{
	if (weiboID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weibo Id is null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/statuses/destroy/%@.json",weiboID] useHttpMethod:@"DELETE" withParametreDict:nil];

	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];

}

-(Status *) retrieveStatusesRepostWithWeiboID:(NSString *)weiboID status:(NSString *) status is_comment:(NSNumber *)is_comment{
	if (weiboID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weibo Id is null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict: parametre withKey:@"id" andValue:weiboID];
	[self addParametreInDict: parametre withKey:@"status" andValue:status];
	[self addParametreInDict: parametre withKey:@"is_comment" andValue:is_comment];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/statuses/repost.json" withParametreDict:parametre];

	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];

}

-(STComment *) retrieveStatusesgiveCommentWithWeiboID:(NSString *)weiboID comment:(NSString *) comment cid:(NSString *) cid{
	
	if (weiboID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weibo Id is null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict: parametre withKey:@"id" andValue:weiboID];
	[self addParametreInDict:parametre withKey:@"comment" andValue:comment];
	[self addParametreInDict:parametre withKey:@"cid" andValue:cid];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/statuses/comment.json" withParametreDict:parametre];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserACommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(STComment *) retrieveStatusesComment_destroyWithCommentID:(NSString *)cid{
	if(cid == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"comment Id is null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/statuses/comment_destroy/%@.json",cid] useHttpMethod:@"DELETE" withParametreDict:nil];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserACommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveStatusesComment_destroyWithCommentIDS:(NSArray *)cids{
	if (cids == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"comment Id is null" userInfo:nil];
		@throw err;
	}
	NSMutableString *cidD = [[NSMutableString alloc] init];
	for (NSString * cid in cids){
		[cidD appendFormat:@"%@,",cid];
	}
	OAMutableURLRequest *request = [self prepareRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/statuses/comment/destroy_batch.json?ids=%@", [cidD substringToIndex:[cidD length]-1]]
												 useHttpMethod:@"DELETE" 
											 withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserCommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];

}
-(STComment *) retrieveStatusesReplyWithWeiboID:(NSString *)weiboID comment:(NSString *)comment cid:(NSString *)cid{
	if (weiboID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weibo Id is null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"id" andValue:weiboID];
	[self addParametreInDict:parametre withKey:@"comment" andValue:comment];
	[self addParametreInDict:parametre withKey:@"cid" andValue:cid];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/statuses/reply.json" withParametreDict:parametre];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserACommentWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

#pragma mark -
#pragma mark APICategory : user Interface
-(User *) retrieveUsersShowWithUserID:(NSString *)userID screen_name:(NSString *)screen_name{
	if (userID == nil && screen_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"UserID and screen_name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"screen_name" andValue:screen_name];

	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/users/show.json"
												withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveStatusesFriendsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name cursor:(NSNumber *)cursor count:(NSNumber *)count{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"screen_name" andValue:screen_name];
	[self addParametreInDict:parametre withKey:@"cursor" andValue:cursor];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/friends.json" withParametreDict:parametre];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserUsersWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
}
-(NSArray *) retrieveStatusesFollowersWithUserID:(NSString *)userID screen_name:(NSString *)screen_name cursor:(NSNumber *)cursor count:(NSNumber *)count{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"screen_name" andValue:screen_name];
	[self addParametreInDict:parametre withKey:@"cursor" andValue:cursor];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/statuses/followers.json" withParametreDict:parametre];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserUsersWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
	
}
-(NSArray *) retrieveUsersHotWithCategory:(NSString *)category{
	NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:param withKey:@"category" andValue:category];
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/users/hot.json" withParametreDict:param];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserUsersWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(User *) retrieveUserFriendsUpdate_remarkWithUserID:(NSString *)userID remark:(NSString *)remark{
	if (userID == nil || remark == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID or remark shoudn't be null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"remark" andValue:remark];
	
	OAMutableURLRequest * request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/user/friends/update_remark.json" withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
	
}
-(NSArray *) retrieveUsersSuggestionsWith_reason:(NSNumber *)with_reason{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"with_reason" andValue:with_reason];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/users/suggestions.json" withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserUsersWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
	
}

#pragma mark -
#pragma mark APICategory : Direct_messages
-(NSArray *) retrieveDirect_messagesWithSinceID:(NSString *)sid  MaxID:(NSString *)max_ID Count:(NSNumber *)count Page:(NSNumber *)page{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/direct_messages.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserDirecteMessageWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
	
}
-(NSArray *) retrieveDirect_messagesSentWithSinceID:(NSString *)sid  MaxID:(NSString *)max_ID Count:(NSNumber *)count Page:(NSNumber *)page{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"since_id" andValue:sid];
	[self addParametreInDict:parametre withKey:@"max_id" andValue:max_ID];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"page" andValue:page];
	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/direct_messages/sent.json"
												withParametreDict:parametre];
	//[request setTimeoutInterval:60];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserDirecteMessageWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(DirectMessage *) retrieveDirect_messagesNewWithUserID:(NSString *)userID text:(NSString *)text{
	if (userID == nil || text == nil) {
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID or text is null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];	
	[self addParametreInDict:parametre withKey:@"id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"text" andValue:text];

	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/direct_messages/new.json" withParametreDict:parametre];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserADirecteMessageWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(DirectMessage *) retrieveDirect_messagesDestroyWithID:(NSString *)dmID{
	if (dmID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"direct message ID is null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareRequestWithURL:[NSString stringWithFormat: @"http://api.t.sina.com.cn/direct_messages/destroy/%@.json", dmID]
												 useHttpMethod:@"DELETE" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserADirecteMessageWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveDirect_messagesDestroy_batchWithIDS:(NSArray *)dmids{
	if (dmids == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"direct message Ids are null" userInfo:nil];
		@throw err;
	}
	NSMutableString *dmidD = [[NSMutableString alloc] init];
	for (NSString * did in dmids){
		[dmidD appendFormat:@"%@,",did];
	}
	OAMutableURLRequest *request = [self prepareRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/direct_messages/destroy_batch.json?ids=%@", [dmidD substringToIndex:[dmidD length]-1]]
												 useHttpMethod:@"DELETE" 
											 withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserDirecteMessageWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
/*
-(NSArray *) retrieveDirect_messagesUserlistWithCount:(NSNumber *)count cursor:(NSNumber *)cursor{
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"count" andValue:count];
	[self addParametreInDict:parametre withKey:@"cursor" andValue:cursor];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/direct_messages/userlist.json" withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
}
*/
#pragma mark -
#pragma mark APICategory : friends_ship
-(User *) retrieveFriendsshipsCreateWithUserID:(NSString *)userID screen_name:(NSString *)screen_name{
	if (userID == nil && screen_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID and screen_name are both null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"screen_name" andValue:screen_name];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/friendships/create.json"
												 withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(User *) retrieveFriendsshipsDestroyWithUserID:(NSString *)userID screen_name:(NSString *)screen_name{
	if (userID == nil && screen_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID and screen_name are both null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parametre withKey:@"screen_name" andValue:screen_name];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/friendships/destroy.json"
												 withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData::didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
}
-(NSArray *) retrieveFriendsshipsExistsWithUserAID:(NSString *)userA userBID:(NSString *)userB{
	if (userA == nil || userB == nil){
		NSException * err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userA and userB are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"user_a" andValue:userA];
	[self addParametreInDict:parametre withKey:@"user_b" andValue:userB];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/friendships/exists.json" withParametreDict:parametre];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parse:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(NSArray *) retrieveFriendsshipsShowWithUserAID:(NSString *)userAID userAName:(NSString *)userAName userBID:(NSString *)userBID userBName:(NSString *)userBName{
	if (userBID == nil && userBName == nil){
		NSException * err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userB ID and name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parametre = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parametre withKey:@"source_id" andValue:userAID];
	[self addParametreInDict:parametre withKey:@"source_screen_name	" andValue:userAName];
	[self addParametreInDict:parametre withKey:@"target_id" andValue:userBID];
	[self addParametreInDict:parametre withKey:@"target_screen_name" andValue:userBName];	
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/friendships/show.json" withParametreDict:parametre];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}

#pragma mark -
#pragma mark APICategory : Trends
-(NSArray *) retrieveTrendsWithUserID:(NSString *)userID{
	if (userID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID shoudn't be null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/trends.json" withParametreDict:[NSDictionary dictionaryWithObject:userID forKey:@"user_id"]];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
	
}
-(NSArray *) retrieveTrendsStatusesWithTrend_name:(NSString *)trend_name{
	if(trend_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"trend name shoudn't be null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/trends/statuses.json" withParametreDict:[NSDictionary dictionaryWithObject:trend_name forKey:@"trend_name"]];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(NSArray *) retrieveTrendsFollowWithTrend_name:(NSString *)trend_name{
	if(trend_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"trend name shoudn't be null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/trends/follow.json" withParametreDict:[NSDictionary dictionaryWithObject:trend_name forKey:@"trend_name"]];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
}
-(NSArray *) retrieveTrendsDestroyWithTrend_id:(NSString *)trendID{
	if(trendID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"trend id shoudn't be null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self prepareRequestWithURL:[NSString stringWithFormat:@"http://api.t.sina.com.cn/trends/destroy.json?trend_id=%@",trendID]
												 
												 useHttpMethod:@"DELETE" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(NSArray *) retrieveTrendsHourly{
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/trends/hourly.json" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(NSArray *) retrieveTrendsDaily{
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/trends/daily.json" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
	
}
-(NSArray *) retrieveTrendsWeekly{
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/trends/weekly.json" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
	
}

#pragma mark -
#pragma mark API category : social graph
-(NSArray *) retrieveFriendsIdsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name count:(NSNumber *)count cursor:(NSNumber *)cursor{
	if (userID == nil && screen_name == nil ){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"user_id and screen_name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parameter withKey:@"screen_name" andValue:screen_name];
	[self addParametreInDict:parameter withKey:@"count" andValue:count];
	[self addParametreInDict:parameter withKey:@"cursor" andValue:cursor];
	
	OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/friends/ids.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(NSArray *) retrieveFollowersIdsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name count:(NSNumber *)count cursor:(NSNumber *)cursor{
	if (userID == nil && screen_name == nil ){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"user_id and screen_name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parameter withKey:@"screen_name" andValue:screen_name];
	[self addParametreInDict:parameter withKey:@"count" andValue:count];
	[self addParametreInDict:parameter withKey:@"cursor" andValue:cursor];
	
	OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/followers/ids.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
	
}

#pragma mark -
#pragma mark API catagory : privacy
-(User *) retrieveAccountUpdate_privacyWithComment:(NSNumber *)comment message:(NSNumber *)message realname:(NSNumber *)realname geo:(NSNumber *)geo badge:(NSNumber *)badge{
	NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"comment" andValue:comment];
	[self addParametreInDict:parameter withKey:@"message" andValue:message];
	[self addParametreInDict:parameter withKey:@"realname" andValue:realname];
	[self addParametreInDict:parameter withKey:@"geo" andValue:geo];
	[self addParametreInDict:parameter withKey:@"badge" andValue:badge];
	
	OAMutableURLRequest * request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/account/update_privacy.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
}
-(NSArray *) retrieveAccountGet_privacy{
	OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/account/get_privacy.json" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

#pragma mark -
#pragma mark API catagory : block
-(User *) retrieveBlocksCreateWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name{
	if (userID == nil && screen_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID and screen_name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parameter withKey:@"screen_name" andValue:screen_name];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/blocks/create.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(User *) retrieveBlocksDestroyWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name{
	if (userID == nil && screen_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID and screen_name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parameter withKey:@"screen_name" andValue:screen_name];
	
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/blocks/destroy.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveBlocksExistWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name{
	if (userID == nil && screen_name == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID and screen_name are null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parameter withKey:@"screen_name" andValue:screen_name];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/blocks/exists.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveBlocksBlockingWithPage:(NSNumber *) page count:(NSNumber *) count{
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"page" andValue:page];
	[self addParametreInDict:parameter withKey:@"count" andValue:count];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/blocks/blocking.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserUsersWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveBlocksBlockingIdsWithPage:(NSNumber *)page count:(NSNumber *)count{
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"page" andValue:page];
	[self addParametreInDict:parameter withKey:@"count" andValue:count];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/blocks/blocking.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

#pragma mark -
#pragma mark API category : tags
-(NSArray *) retrieveTagsWithUser_id:(NSString *) userID count : (NSNumber *)count page : (NSNumber *)page{
	if (userID == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"userID is null" userInfo:nil];
		@throw err;
	}
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"user_id" andValue:userID];
	[self addParametreInDict:parameter withKey:@"page" andValue:page];
	[self addParametreInDict:parameter withKey:@"count" andValue:count];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/tags.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveTagsCreateWithTags:(NSString *) tags{
	if (tags == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"tags is null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/tags/create.json" withParametreDict:[NSDictionary dictionaryWithObject:tags forKey:@"tags"]];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveTagsSuggestionsWithCount : (NSNumber *)count page : (NSNumber *)page{
	NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"page" andValue:page];
	[self addParametreInDict:parameter withKey:@"count" andValue:count];
	
	OAMutableURLRequest *request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/tags/suggestions.json" withParametreDict:parameter];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}
-(NSArray *) retrieveTagsDestroyWithTag_id :(NSString *) tag_id{
	if (tag_id == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"tags is null" userInfo:nil];
		@throw err;
	}
	OAMutableURLRequest * request = [self prepareRequestWithURL:[NSString stringWithFormat: @"http://api.t.sina.com.cn/tags/destroy.json?tag_id=%@",tag_id]
												  useHttpMethod:@"DELETE" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveTagsDestroy_BatchWithIds:(NSArray *)ids{
	if (ids == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"tags is null" userInfo:nil];
		@throw err;	
	}
	NSString *parameter = [ids componentsJoinedByString:@","];
	OAMutableURLRequest * request = [self prepareRequestWithURL:[NSString stringWithFormat: @"http://api.t.sina.com.cn/tags/destroy_batch.json?ids=%@",parameter]
												  useHttpMethod:@"DELETE" withParametreDict:nil];
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
#pragma mark -
#pragma mark API Category : account
-(User *) retrieveAccountVerify_credentials{
	OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/account/verify_credentials.json" withParametreDict:nil];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}
-(NSArray *) retrieveAccountRate_limit_status{
	OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/account/rate_limit_status.json" withParametreDict:nil];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserOtherTypesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
}
-(User *) retrieveAccountEnd_session{
	OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/account/end_session.json" withParametreDict:nil];
	
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket :didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];		
}
-(User *) retrieveAccountUpdate_profile_imageWithImage:(NSString *)path{
	if (path == nil){
		NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"path is null" userInfo:nil];
		@throw err;	
	}
	NSMutableURLRequest * request = [self preparePostPicWithURL:@"http://api.t.sina.com.cn/account/update_profile_image.json" pathPic:path PicName:@"image" parametre:nil];
	
    return [fetcher fetchDataWithURLRequest:request 
                                   delegate:parser 
                          didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)  
                            didFailSelector:@selector(fetchDataTicket:didFailWithError:)];	
	
}

-(User *) retrieveAccountUpload_profileWithName:(NSString *)name gender:(NSString *)gender province:(NSNumber *)province city:(NSNumber *)city description:(NSString *)description{
    NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
	[self addParametreInDict:parameter withKey:@"name" andValue:name];
    [self addParametreInDict:parameter withKey:@"gender" andValue:gender];
    [self addParametreInDict:parameter withKey:@"province" andValue:province];
    [self addParametreInDict:parameter withKey:@"city" andValue:city];
    [self addParametreInDict:parameter withKey:@"description" andValue:description];
    
    if ([parameter count] == 0){
        NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"There must be at least 1 parameter" userInfo:nil];
		@throw err;	
    }
    
    OAMutableURLRequest *request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/account/update_profile.json" withParametreDict:parameter];
    
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAUserWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
	
}

#pragma mark -
#pragma mark API Category : Favorite
-(NSArray *) retrieveFavoritesWithPage:(NSNumber *) page{
    NSMutableDictionary * parameter = [[NSMutableDictionary alloc] init];
    [self addParametreInDict:parameter withKey:@"page" andValue:page];

    OAMutableURLRequest * request = [self prepareGetRequestWithURL:@"http://api.t.sina.com.cn/favorites.json" withParametreDict:parameter];
    
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(Status *) retrieveFavoritesCreate:(NSString *)weiboID{
    if (weiboID == nil){
        NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboID shoudn't be null" userInfo:nil];
		@throw err;	
    }
    
    OAMutableURLRequest * request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/favorites/create.json" withParametreDict:[NSDictionary dictionaryWithObject:weiboID forKey:@"id"]];
    
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(Status *) retrieveFavoritesDestroyWithID:(NSString *)weiboID{
    if (weiboID == nil){
        NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboID shoudn't be null" userInfo:nil];
		@throw err;	
    }
    
    OAMutableURLRequest * request = [self prepareRequestWithURL:[NSString stringWithFormat: @"http://api.t.sina.com.cn/favorites/destroy/%@.json", weiboID]
                                                  useHttpMethod:@"DELETE" 
                                              withParametreDict:nil];
    return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserAStatusWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}

-(NSArray *) retrieveFavoritesDestroy_batchWithIds:(NSArray *)ids{
    if ([ids count] == 0){
        NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"weiboID shoudn't be null" userInfo:nil];
		@throw err;	
    }
    if ([ids count] >= 20){
        NSException *err = [NSException exceptionWithName:@"InvalideParameter" reason:@"Maximum 20 ids" userInfo:nil];
		@throw err;	
    }
    NSString * idss = [ids componentsJoinedByString:@","];
    
    OAMutableURLRequest * request = [self preparePostRequestWithURL:@"http://api.t.sina.com.cn/favorites/destroy_batch.json" 
                                                  withParametreDict:[NSDictionary dictionaryWithObject:idss forKey:@"ids"]];
    
	return [fetcher fetchDataWithRequest:request
						 delegate:parser
				didFinishSelector:@selector(parserStatusesWithTicket:didFinishWithData:)
				  didFailSelector:@selector(fetchDataTicket:didFailWithError:)];
}


//Methode prive
-(void) addParametreInDict:(NSMutableDictionary *)dict withKey:(NSString *)akey andValue:(id)avalue{
	if (avalue != nil){
		if ([avalue isKindOfClass:[NSString class]]){
			 [dict setObject:avalue forKey:akey];
		}
		else {
			if ([avalue isKindOfClass:[NSNumber class]]){
				[dict setObject:[avalue stringValue] forKey:akey];
			}
		}
	}
}

-(void) dealloc{
	[parser release];
	[super dealloc];
}
@end
