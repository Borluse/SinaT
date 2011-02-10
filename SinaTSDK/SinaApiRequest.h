//
//  SinaApiRequest.h
//  SinaTApi
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
-(id) initWithAccessToken:(OAToken *)accToken;
//-(id) init;

#pragma mark -
#pragma mark API catagory Statuses 

-(NSArray *) retrieveStatusesPublic_timelineWithCount:(NSNumber *)count;
-(NSArray *) retrieveStatusesFriends_timelineWithSinceID:(NSString *)sid 
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page 
											feature:(NSNumber *)feature;
-(NSArray *) retrieveStatusesUser_timelineWithUserID:(NSString *)UID 
									screen_name:(NSString *)sname
									   since_id:(NSString *)sid  
										  MaxID:(NSString *)max_ID
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page 
										feature:(NSNumber *)feature;
-(NSArray *) retrieveStatusesMentionsWithSince_id:(NSString *)sid
									   MaxID:(NSString *)max_ID
									   Count:(NSNumber *)count 
										Page:(NSNumber *)page;

-(NSArray *) retrieveStatusesComment_timelineWithSinceID:(NSString *)sid  
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page;
-(NSArray *) retrieveStatusesCommentsbymeWithSinceID:(NSString *)sid  
											  MaxID:(NSString *)max_ID 
											  Count:(NSNumber *)count 
											   Page:(NSNumber *)page;

-(NSArray *) retrieveStatusesCommentstomeWithSinceID:(NSString *)sid  
										  MaxID:(NSString *)max_ID 
										  Count:(NSNumber *)count 
										   Page:(NSNumber *)page;
-(NSArray *) retrieveStatusesCommentsWithID:(NSString *)weiboid
								 Count:(NSNumber *)count 
								  Page:(NSNumber *)page;
-(NSArray *) retrieveStatusesCountsWithids:(NSString *)ids;
-(NSArray *) retrieveStatusesRepost_timelineWithID:(NSString *)weiboid 
									 since_id:(NSString *)sid  
										MaxID:(NSString *)max_ID
										Count:(NSNumber *)count 
										 Page:(NSNumber *)page;
-(NSArray *) retrieveStatusesRepostbymeWithID:(NSString *)weiboid
								since_id:(NSString *)sid  
								   MaxID:(NSString *)max_ID
								   Count:(NSNumber *)count 
									Page:(NSNumber *)page;
-(NSArray *) retrieveStatusesUnreadWith_new_status:(NSNumber *)with_new_status since_id:(NSString *)sid;
-(NSArray *) retrieveStatusesResetcountWithType:(NSNumber *)type;


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
-(NSArray *) retrieveStatusesComment_destroyWithCommentIDS:(NSArray *)cids;
-(STComment *) retrieveStatusesReplyWithWeiboID:(NSString *)weiboID comment:(NSString *)comment cid:(NSString *)cid; 


#pragma mark -
#pragma mark API catagory : user Interface
-(User *) retrieveUsersShowWithUserID:(NSString *)userID screen_name:(NSString *)screen_name;
-(NSArray *) retrieveStatusesFriendsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name cursor:(NSNumber *)cursor count:(NSNumber *)count;
-(NSArray *) retrieveStatusesFollowersWithUserID:(NSString *)userID screen_name:(NSString *)screen_name cursor:(NSNumber *)cursor count:(NSNumber *)count;
-(NSArray *) retrieveUsersHotWithCategory:(NSString *)category;
-(User *) retrieveUserFriendsUpdate_remarkWithUserID:(NSString *)userID remark:(NSString *)remark;
-(NSArray *) retrieveUsersSuggestionsWith_reason:(NSNumber *)with_reason;

#pragma mark -
#pragma mark API catagory : direct message
-(NSArray *) retrieveDirect_messagesWithSinceID:(NSString *)sid  MaxID:(NSString *)max_ID Count:(NSNumber *)count Page:(NSNumber *)page;
-(NSArray *) retrieveDirect_messagesSentWithSinceID:(NSString *)sid  MaxID:(NSString *)max_ID Count:(NSNumber *)count Page:(NSNumber *)page;
-(DirectMessage *) retrieveDirect_messagesNewWithUserID:(NSString *)userID text:(NSString *)text;
-(DirectMessage *) retrieveDirect_messagesDestroyWithID:(NSString *)dmID;
-(NSArray *) retrieveDirect_messagesDestroy_batchWithIDS:(NSArray *)dmids;
//-(NSArray *) retrieveDirect_messagesUserlistWithCount:(NSNumber *)count cursor:(NSNumber *)cursor;

#pragma mark -
#pragma mark API catagory : friendsships
-(User *) retrieveFriendsshipsCreateWithUserID:(NSString *)userID screen_name:(NSString *)screen_name;
-(User *) retrieveFriendsshipsDestroyWithUserID:(NSString *)userID screen_name:(NSString *)screen_name;
-(NSArray *) retrieveFriendsshipsExistsWithUserAID:(NSString *)userA userBID:(NSString *)userB;
-(NSArray *) retrieveFriendsshipsShowWithUserAID:(NSString *)userAID userAName:(NSString *)userAName userBID:(NSString *)userBID userBName:(NSString *)userBName;

#pragma mark -
#pragma mark API catagory : trends
-(NSArray *) retrieveTrendsWithUserID:(NSString *)userID;
-(NSArray *) retrieveTrendsStatusesWithTrend_name:(NSString *)trend_name;
-(NSArray *) retrieveTrendsFollowWithTrend_name:(NSString *)trend_name;
-(NSArray *) retrieveTrendsDestroyWithTrend_id:(NSString *)trendID;
-(NSArray *) retrieveTrendsHourly;
-(NSArray *) retrieveTrendsDaily;
-(NSArray *) retrieveTrendsWeekly;

#pragma mark -
#pragma mark API catagory : Social Graph
-(NSArray *) retrieveFriendsIdsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name count:(NSNumber *)count cursor:(NSNumber *)cursor;
-(NSArray *) retrieveFollowersIdsWithUserID:(NSString *)userID screen_name:(NSString *)screen_name count:(NSNumber *)count cursor:(NSNumber *)cursor;

#pragma mark -
#pragma mark API catagory : privacy
-(User *) retrieveAccountUpdate_privacyWithComment:(NSNumber *)comment message:(NSNumber *)message realname:(NSNumber *)realname geo:(NSNumber *)geo badge:(NSNumber *)badge;
-(NSArray *) retrieveAccountGet_privacy;

#pragma mark -
#pragma mark API catagory : block
-(User *) retrieveBlocksCreateWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name;
-(User *) retrieveBlocksDestroyWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name;
-(NSArray *) retrieveBlocksExistWithUser_id:(NSString *) userID screen_name :(NSString *)screen_name;
-(NSArray *) retrieveBlocksBlockingWithPage:(NSNumber *) page count:(NSNumber *) count;
-(NSArray *) retrieveBlocksBlockingIdsWithPage:(NSNumber *)page count:(NSNumber *)count;

#pragma mark -
#pragma mark API category : tags
-(NSArray *) retrieveTagsWithUser_id:(NSString *) userID count : (NSNumber *)count page : (NSNumber *)page;
-(NSArray *) retrieveTagsCreateWithTags:(NSString *) tags;
-(NSArray *) retrieveTagsSuggestionsWithCount : (NSNumber *)count page : (NSNumber *)page;
-(NSArray *) retrieveTagsDestroyWithTag_id :(NSString *) tag_id;															
-(NSArray *) retrieveTagsDestroy_BatchWithIds:(NSArray *)ids;

#pragma mark -
#pragma mark API Category : account
-(User *) retrieveAccountVerify_credentials;
-(NSArray *) retrieveAccountRate_limit_status;
-(User *) retrieveAccountEnd_session;
-(User *) retrieveAccountUpdate_profile_imageWithImage:(NSString *)path;
-(User *) retrieveAccountUpload_profileWithName:(NSString *)name gender:(NSString *)gender province:(NSNumber *)province city:(NSNumber *)city description:(NSString *)description;

#pragma mark -
#pragma mark API Category : Favorite
-(NSArray *) retrieveFavoritesWithPage:(NSNumber *) page;
-(Status *) retrieveFavoritesCreate:(NSString *)weiboID;
-(Status *) retrieveFavoritesDestroyWithID:(NSString *)weiboID;
-(NSArray *) retrieveFavoritesDestroy_batchWithIds:(NSArray *)ids;


-(void) addParametreInDict:(NSMutableDictionary *)dict withKey:(NSString *)akey andValue:(id)avalue;

@end
