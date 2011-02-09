//
//  SinaApiRequest.h
//  Test
//
//  Created by Fan ZHAO on 29/12/10.
//  Copyright 2010 Personne. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAuthBase.h"
#import "SinaApiParser.h"
#import "Status.h"
#import "User.h"
#import "STComment.h"
//#import <OAuthConsumer/OAuthConsumer.h>

@interface SinaApiRequest : OAuthBase {
	SinaApiParser * parser;
}

@property (retain) SinaApiParser * parser;
-(id) initWithAccessTokenKey:(NSString *) akey secret:(NSString *) asecret;
//-(id) init;

#pragma mark -
#pragma mark API catagory Statuses 

-(NSMutableArray *) retrieveStatusesPublic_timelineWithCount:(NSNumber *)count;
-(NSMutableArray *) retrieveStatusesFriends_timelineWithSinceID:(NSString *)sid 
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page 
											feature:(NSNumber *)feature;
-(NSMutableArray *) retrieveStatusesUser_timelineWithUserID:(NSString *)UID 
									screen_name:(NSString *)sname
									   since_id:(NSString *)sid  
										  MaxID:(NSString *)max_ID
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page 
										feature:(NSNumber *)feature;
-(NSMutableArray *) retrieveStatusesMentionsWithSince_id:(NSString *)sid
									   MaxID:(NSString *)max_ID
									   Count:(NSNumber *)count 
										Page:(NSNumber *)page;

-(NSMutableArray *) retrieveStatusesComment_timelineWithSinceID:(NSString *)sid  
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page;
-(NSMutableArray *) retrieveStatusesCommentsbymeWithSinceID:(NSString *)sid  
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page;

-(NSMutableArray *) retrieveStatusesCommentstomeWithSinceID:(NSString *)sid  
										  MaxID:(NSString *)max_ID 
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page;
-(NSMutableArray *) retrieveStatusesCommentsWithID:(NSString *)weiboid
								 Count:(NSNumber *)count 
								  Page:(NSNumber *)page;
-(NSMutableArray *) retrieveStatusesCountsWithids:(NSString *)ids;
-(NSMutableArray *) retrieveStatusesRepost_timelineWithID:(NSString *)weiboid 
									 since_id:(NSString *)sid  
										MaxID:(NSString *)max_ID
										Count:(NSNumber *)count 
										 Page:(NSNumber *)page;
-(NSMutableArray *) retrieveStatusesRepostbymeWithID:(NSString *)weiboid
								since_id:(NSString *)sid  
								   MaxID:(NSString *)max_ID
								   Count:(NSNumber *)count 
									Page:(NSNumber *)page;
-(NSMutableArray *) retrieveStatusesUnreadWith_new_status:(NSNumber *)with_new_status since_id:(NSString *)sid;
-(NSMutableArray *) retrieveStatusesResetcountWithType:(NSNumber *)type;


#pragma mark -
#pragma mark API catagory : access
-(Status *) retrieveStatusesShowWithWeiboID:(NSString *)weiboid;
-(Status *) retrieveUseridStatusesidWithUserID:(NSString *)userId weiboID:(NSString *)weiboID;
-(Status *) retrieveStatusesUpdateWithStatuse:(NSString *)status 
				   in_replay_to_status_id:(NSString *)inreplayID 
								 latitude:(NSNumber *)lat 
							   longtitude:(NSNumber *)lon;
-(Status *) retrieveStatusesUploadWithStatuse:(NSString *)status
									  pic:(NSString *)pathPic 
								 latitude:(NSNumber *)lat 
							   longtitude:(NSNumber *)lon;
-(Status *) retrieveStatusesDestroyWithWeiboID:(NSString *)weiboID;
-(Status *) retrieveStatusesRepostWithWeiboID:(NSString *)weiboID status:(NSString *) status is_comment:(NSNumber *)is_comment;
-(STComment *) retrieveStatusesgiveCommentWithWeiboID:(NSString *)weiboID comment:(NSString *) comment cid:(NSString *) cid;
-(STComment *) retrieveStatusesComment_destroyWithCommentID:(NSString *)cid;
-(NSMutableArray *) retrieveStatusesComment_destroyWithCommentIDS:(NSArray *)cids;
-(STComment *) retrieveStatusesReplyWithWeiboID:(NSString *)weiboID comment:(NSString *)comment cid:(NSString *)cid; 


#pragma mark -
#pragma mark API catagory : user Interface
-(User *) retrieveUsersShowWithUserID:(NSString *)userID screen_name:(NSString *)screen_name;
-(NSMutableArray *) retrieveStatusesFriendsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name cursor:(NSNumber *)cursor count:(NSNumber *)count;
-(NSMutableArray *) retrieveStatusesFollowersWithUserID:(NSString *)userID screen_name:(NSString *)screen_name cursor:(NSNumber *)cursor count:(NSNumber *)count;
-(NSMutableArray *) retrieveUsersHotWithCategory:(NSString *)category;
-(User *) retrieveUserFriendsUpdate_remarkWithUserID:(NSString *)userID remark:(NSString *)remark;
-(NSMutableArray *) retrieveUsersSuggestionsWith_reason:(NSNumber *)with_reason;

#pragma mark -
#pragma mark API catagory : direct message
-(NSMutableArray *) retrieveDirect_messagesWithSinceID:(NSString *)sid  MaxID:(NSString *)max_ID Count:(NSNumber *)count Page:(NSNumber *)page;
-(NSMutableArray *) retrieveDirect_messagesSentWithSinceID:(NSString *)sid  MaxID:(NSString *)max_ID Count:(NSNumber *)count Page:(NSNumber *)page;
-(DirectMessage *) retrieveDirect_messagesNewWithUserID:(NSString *)userID text:(NSString *)text;
-(DirectMessage *) retrieveDirect_messagesDestroyWithID:(NSString *)dmID;
-(NSMutableArray *) retrieveDirect_messagesDestroy_batchWithIDS:(NSArray *)dmids;
//-(NSMutableArray *) retrieveDirect_messagesUserlistWithCount:(NSNumber *)count cursor:(NSNumber *)cursor;

#pragma mark -
#pragma mark API catagory : friendsships
-(User *) retrieveFriendsshipsCreateWithUserID:(NSString *)userID screen_name:(NSString *)screen_name;
-(User *) retrieveFriendsshipsDestroyWithUserID:(NSString *)userID screen_name:(NSString *)screen_name;
-(NSMutableArray *) retrieveFriendsshipsExistsWithUserAID:(NSString *)userA userBID:(NSString *)userB;
-(NSMutableArray *) retrieveFriendsshipsShowWithUserAID:(NSString *)userAID userAName:(NSString *)userAName userBID:(NSString *)userBID userBName:(NSString *)userBName;

#pragma mark -
#pragma mark API catagory : trends
-(NSMutableArray *) retrieveTrendsWithUserID:(NSString *)userID;
-(NSMutableArray *) retrieveTrendsStatusesWithTrend_name:(NSString *)trend_name;
-(NSMutableArray *) retrieveTrendsFollowWithTrend_name:(NSString *)trend_name;
-(NSMutableArray *) retrieveTrendsDestroyWithTrend_id:(NSString *)trendID;
-(NSMutableArray *) retrieveTrendsHourly;
-(NSMutableArray *) retrieveTrendsDaily;
-(NSMutableArray *) retrieveTrendsWeekly;

#pragma mark -
#pragma mark API catagory : Social Graph
-(NSMutableArray *) retrieveFriendsIdsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name count:(NSNumber *)count cursor:(NSNumber *)cursor;
-(NSMutableArray *) retrieveFollowersIdsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name count:(NSNumber *)count cursor:(NSNumber *)cursor;

#pragma mark -
#pragma mark API catagory : privacy
-(User *) retrieveAccountUpdate_privacyWithComment:(NSNumber *)comment message:(NSNumber *)message realname:(NSNumber *)realname geo:(NSNumber *)geo badge:(NSNumber *)badge;
-(NSMutableArray *) retrieveAccountGet_privacy;

#pragma mark -
#pragma mark API catagory : block
-(User *) retrieveBlocksCreateWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name;
-(User *) retrieveBlocksDestroyWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name;
-(NSMutableArray *) retrieveBlocksExistWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name;
-(NSMutableArray *) retrieveBlocksBlockingWithPage:(NSNumber *) page count:(NSNumber *) count;
-(NSMutableArray *) retrieveBlocksBlockingIdsWithPage:(NSNumber *)page count:(NSNumber *)count;

#pragma mark -
#pragma mark API category : tags
-(NSMutableArray *) retrieveTagsWithUser_id:(NSString *) userID count : (NSNumber *)count page : (NSNumber *)page;
-(NSMutableArray *) retrieveTagsCreateWithTags:(NSString *) tags;
-(NSMutableArray *) retrieveTagsSuggestionsWithCount : (NSNumber *)count page : (NSNumber *)page;
-(NSMutableArray *) retrieveTagsDestroyWithTag_id :(NSString *) tag_id;															
-(NSMutableArray *) retrieveTagsDestroy_BatchWithIds:(NSArray *)ids;

#pragma mark -
#pragma mark API Category : account
-(User *) retrieveAccountVerify_credentials;
-(NSMutableArray *) retrieveAccountRate_limit_status;
-(User *) retrieveAccountEnd_session;
-(User *) retrieveAccountUpdate_profile_imageWithImage:(NSString *)path;
-(User *) retrieveAccountUpload_profileWithName:(NSString *)name gender:(NSString *)gender province:(NSNumber *)province city:(NSNumber *)city description:(NSString *)description;

#pragma mark -
#pragma mark API Category : Favorite
-(NSMutableArray *) retrieveFavoritesWithPage:(NSNumber *) page;
-(Status *) retrieveFavoritesCreate:(NSString *)weiboID;
-(Status *) retrieveFavoritesDestroyWithID:(NSString *)weiboID;
-(NSMutableArray *) retrieveFavoritesDestroy_batchWithIds:(NSArray *)ids;


-(void) addParametreInDict:(NSMutableDictionary *)dict withKey:(NSString *)akey andValue:(id)avalue;

@end
