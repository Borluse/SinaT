//
//  SinaTApiAppDelegate.m
//  SinaTApi
//
//  Created by Fan ZHAO on 11-2-7.
//  Copyright 2011年 Personne. All rights reserved.
//

#import "SinaTApiAppDelegate.h"

@implementation SinaTApiAppDelegate

@synthesize window,sinaAPI,pin;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    auth = [[OAuthBase alloc] init];
	sinaAPI = [[SinaApiRequest alloc] initWithAccessTokenKey:@"e432f889bf970d1541a4001ae8e035e7"
													  secret:@"a80e999dde2931d6de00b16b1634c779"];
	
}

-(IBAction) getReqToken: (id)sender{
	//NSLog(@"test");
	[auth requestToken];
	[auth authorizeApp];
}
-(IBAction) getAccToken: (id)sender{
	NSString * pint = [pin stringValue];
	NSLog(@"%@", pint);
	auth.pin = pint;
    [auth requestAccessToken];
	
}


-(IBAction) getUserInfo: (id) sender{
	@try {
    	//	OAToken * test = auth.accessToken;
	//	NSLog(@"%@", test);
	NSLog(@"%@",[sinaAPI retrieveStatusesPublic_timelineWithCount:[NSNumber numberWithInt:2]]);
//	NSLog(@"%@",[sinaAPI retrieveStatusesFriends_timelineWithSinceID:nil MaxID:nil Count:[NSNumber numberWithInt:5] Page:nil feature:nil]);
//	NSLog(@"%@",[sinaAPI retrieveStatusesUser_timelineWithUserID:nil screen_name:nil since_id:nil MaxID:nil Count:nil Page:nil feature:nil]);
//  NSLog(@"%@",[sinaAPI retrieveStatusesMentionsWithSince_id:nil MaxID:nil Count:nil Page:nil]);
//	NSLog(@"%@", [sinaAPI retrieveStatusesComment_timelineWithSinceID:nil MaxID:nil Count:[NSNumber numberWithInt:2] Page:nil]);
//	NSLog(@"%@", [sinaAPI retrieveStatusesCommentsbymeWithSinceID:nil MaxID:nil Count:nil Page:nil]);
//	NSLog(@"%@", [sinaAPI retrieveStatusesCommentstomeWithSinceID:nil MaxID:nil Count:nil Page:nil]);
//	NSLog(@"%@", [sinaAPI retrieveStatusesCommentsWithID:@"4160470037" Count:nil Page:nil]);
	//	[sinaAPI retrieveStatusesCountsWithids:@"4846143561"];
    //    NSLog(@"%@", [sinaAPI retrieveStatusesRepost_timelineWithID:@"3881498981" since_id:nil MaxID:nil Count:nil Page:nil]);
    //    NSLog(@"%@", [sinaAPI retrieveStatusesRepostbymeWithID:<#(NSString *)weiboid#> since_id:<#(NSString *)sid#> MaxID:<#(NSString *)max_ID#> Count:<#(NSNumber *)count#> Page:<#(NSNumber *)page#>
	//	[sinaAPI retrieveStatusesUnreadWith_new_status:nil since_id:nil];

	//NSLog(@"%@", [sinaAPI retrieveStatusesShowWithWeiboID:@"456"]);
    //	NSLog(@"%@", [sinaAPI retrieveUseridStatusesidWithUserID:@"1773020834" weiboID:@"456"]);
	//	NSString * msg = [pin stringValue];
	//	NSLog(@"%@",[[@"通过OAuth发送微博信息" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    //	NSLog(@"%@", [sinaAPI retrieveStatusesUpdateWithStatuse:@"通过OAuth发送微博信息" in_replay_to_status_id:nil latitude:nil longtitude:nil]);
	//	NSLog(@"%@", [sinaAPI retrieveStatusesUploadWithStatuse:@"pics图片1" pic:@"/pic/pic.jpg" latitude:nil longtitude:nil]);
	//	[sinaAPI retrieveStatusesdestroyWithWeiboID:@"4897229449"];
    //NSLog(@"%@", [sinaAPI retrieveStatusesRepostWithWeiboID:@"4022982531" status:@"测试发借口" is_comment:[NSNumber numberWithInt:1]]);
	//	[sinaAPI retrieveStatusescomment_destroyWithCommentID:@"5941949075"];
	//[sinaAPI retrieveStatusesgiveCommentWithWeiboID:@"4920396587" comment:@"ceshi1" cid:@""];
	//	[sinaAPI retrieveStatusesreplyWithWeiboID:@"4920396587" comment:@"测试1" cid:@"5943145327"];
	//	[self testA];
	//NSLog(@"%@",[sinaAPI retrieveUsersShowWithUserID:nil screen_name:@"borluse"]);//  1390984450
	
    //	NSLog(@"%@", [sinaAPI retrieveStatusesFriendsWithUserID:nil screen_name:nil cursor:nil count:nil]);
    //NSLog(@"%@",[sinaAPI retrieveStatusesFollowersWithUserID:nil screen_name:nil cursor:nil count:nil]);
	//NSLog(@"%@", [sinaAPI retrieveUsersHotWithCategory:
    //              @"default"]);
	//NSLog(@"%@", [sinaAPI retrieveUserFriendsUpdate_remarkWithUserID:@"1611598955" remark:@"这惨的肉腿"]);
//	NSLog(@"%@", [sinaAPI retrieveUsersSuggestionsWith_reason:[NSNumber numberWithInt:1]]);
//	NSLog(@"%@", [sinaAPI retrieveDirect_messagesWithSinceID:nil MaxID:nil Count:[NSNumber numberWithInt:5] Page:nil]);
//	NSLog(@"%@", [sinaAPI retrieveDirect_messagesSentWithSinceID:nil MaxID:nil Count:nil Page:nil]);
//	NSLog(@"%@",[sinaAPI retrieveDirect_messagesNewWithUserID:@"1611598955" text:@"这臭的头头"]);
//    NSLog(@"%@",[sinaAPI retrieveDirect_messagesDestroyWithID:@"877133527"]);
//	NSLog(@"%@",[sinaAPI retrieveDirect_messagesUserlistWithCount:nil cursor:nil]);
//        NSLog(@"%@",[sinaAPI retrieveFriendsshipsShowWithUserAID:nil userAName:nil userBID:nil userBName:@"碰碰狸"]);
	//	NSLog(@"%@",[sinaAPI retrieveFriendsshipsDestroyWithUserID:nil screen_name:@"碰碰狸"];
	//		NSLog(@"%@",[sinaAPI retrieveFriendsshipsCreateWithUserID:nil screen_name:@"碰碰狸"];
	//	NSLog(@"%@",[sinaAPI retrieveTrendsWithUserID:@"1390984450"];
	//	NSLog(@"%@",[sinaAPI retrieveTrendsStatusesWithTrend_name:@"凉宫春日的消失"];
	//	NSLog(@"%@",[sinaAPI retrieveTrendsFollowWithTrend_name:@"凉宫春日的消失"];
	//NSLog(@"%@",[sinaAPI retrieveTrendsDestroyWithTrend_id:@"1832060"];
	//	NSLog(@"%@",[sinaAPI retrieveTrendsHourly];
	//	NSLog(@"%@",[sinaAPI retrieveTrendsWeekly];
	//	NSLog(@"%@",[sinaAPI retrieveTrendsDaily];
	//	NSLog(@"%@",[sinaAPI retrieveFollowersIdsWithUserID:nil screen_name:@"碰碰狸" count:nil cursor:nil];
	//	NSLog(@"%@",[sinaAPI retrieveFriendsIdsWithUserID:nil screen_name:@"碰碰狸" count:nil cursor:nil];
        
	//	NSLog(@"%@",[sinaAPI retrieveAccountGet_privacy];
	//	NSLog(@"%@",[sinaAPI retrieveBlocksCreateWithUser_id:nil screen_name:@"碰碰狸"];
	//	NSLog(@"%@",[sinaAPI retrieveBlocksDestroyWithUser_id:nil screen_name:@"碰碰狸"];
	//	NSLog(@"%@",[sinaAPI retrieveBlocksExistWithUser_id:nil screen_name:@"碰碰狸"];
	//	NSLog(@"%@",[sinaAPI retrieveBlocksBlockingWithPage:nil count:nil];
	//	NSLog(@"%@",[sinaAPI retrieveTagsWithUser_id:@"1390984450" count:nil page:nil];
	//	NSLog(@"%@",[sinaAPI retrieveTagsCreateWithTags:@"测试TAGS,长门有希,凉宫春日"];
	//	NSLog(@"%@",[sinaAPI retrieveTagsDestroyWithTag_id:@"221101070002554878"];
	//	NSLog(@"%@",[sinaAPI retrieveTagsDestroy_BatchWithIds:[NSArray arrayWithObjects:@"45643",@"142705",nil]];
	//  NSLog(@"%@",  [sinaAPI retrieveAccountUpdate_profile_imageWithImage:@"/pic/pic.jpg"];
	//  NSLog(@"%@", [sinaAPI retrieveAccountUpload_profileWithName:nil gender:nil province:nil city:nil description:@"学习，生活"];
	//   NSLog(@"%@", [sinaAPI retrieveFavoritesWithPage:nil];
	//   NSLog(@"%@", [sinaAPI retrieveFavoritesDestroyWithID:@"5280005525"];
	//  NSLog(@"%@",[sinaAPI retrieveFavoritesWithPage:nil];
	//   NSLog(@"%@", [sinaAPI retrieveFavoritesCreate:@"5280005525"];d

    }
    @catch (NSException *exception) {
        NSLog(@"error, %@", exception);
    }
    @catch (NSError * err) {
        NSLog(@"error, %@", err);
    }

}

-(void)testA{
    /*
	 //	NSString *anURL = @"http://localhost:8888/index.php";
	 NSString *anURL = @"http://api.t.sina.com.cn/statuses/upload.json";
	 NSString *status = @"发送带照片的微博信息";
	 NSString *path = @"/pic/pic.png";
	 
	 OAHMAC_SHA1SignatureProvider * signatureProvider = [[OAHMAC_SHA1SignatureProvider alloc] init];
	 NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:anURL]
	 cachePolicy:NSURLRequestReloadIgnoringCacheData
	 timeoutInterval:10.0];
	 
	 NSData *datapic = [NSData dataWithContentsOfFile:path];
	 OAConsumer * consumer =[[OAConsumer alloc] initWithKey:APPKEY secret:APPSECRET];
	 OAToken * accessToken = [[OAToken alloc] initWithKey:@"e432f889bf970d1541a4001ae8e035e7" secret:@"a80e999dde2931d6de00b16b1634c779"];
	 NSString * timestamp = [self _generateTimestamp];
	 NSString * nonce = [self _generateNonce];
	 NSMutableData * body = [[NSMutableData alloc] init];
	 
	 NSMutableArray *parameterPairs = [[NSMutableArray alloc]init];
	 
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_consumer_key" value:consumer.key] URLEncodedNameValuePair]];
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_signature_method" value:[signatureProvider name]] URLEncodedNameValuePair]];
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_timestamp" value:timestamp] URLEncodedNameValuePair]];
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_nonce" value:nonce] URLEncodedNameValuePair]];
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_version" value:@"1.0"] URLEncodedNameValuePair]];
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_token" value:accessToken.key] URLEncodedNameValuePair]];
	 [parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"status" value:status] URLEncodedNameValuePair]];
	 //[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_callback" value:@"oob"] URLEncodedNameValuePair]];
	 
	 NSArray *sortedPairs = [parameterPairs sortedArrayUsingSelector:@selector(compare:)];
	 NSString *normalizedRequestParameters = [sortedPairs componentsJoinedByString:@"&"];
	 
	 // OAuth Spec, Section 9.1.2 "Concatenate Request Elements"
	 NSString *baseString = [NSString stringWithFormat:@"%@&%@&%@",
	 @"POST",
	 [anURL URLEncodedString],
	 [normalizedRequestParameters URLEncodedString]];
	 
	 NSString *signature = [signatureProvider signClearText:baseString  withSecret:[NSString stringWithFormat:@"%@&%@", [consumer.secret URLEncodedString], [accessToken.secret URLEncodedString]]];
	 NSString *oauthToken = [NSString stringWithFormat:@"oauth_token=\"%@\", ", [accessToken.key URLEncodedString]];
	 
	 NSString *oauthHeader = [NSString stringWithFormat:@"OAuth realm=\"%@\", oauth_consumer_key=\"%@\", %@oauth_signature_method=\"%@\", oauth_signature=\"%@\", oauth_timestamp=\"%@\", oauth_nonce=\"%@\", oauth_version=\"1.0\"%@",
	 @"",
	 [consumer.key URLEncodedString],
	 oauthToken,
	 [@"HMAC-SHA1" URLEncodedString],
	 [signature URLEncodedString],
	 timestamp,
	 nonce,
	 @""];
	 
	 [request setHTTPMethod:@"POST"];
	 NSString * boundary = [NSString stringWithString:@"A0B8X2"];
	 NSString * contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
	 
	 [request setValue:oauthHeader forHTTPHeaderField:@"Authorization"];
	 [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	 //	[request setHTTPBody:[[NSString stringWithFormat:@"status=%@", status] dataUsingEncoding:NSUTF8StringEncoding]];
	 
	 [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[[NSString stringWithFormat:@"content-disposition: form-data; name=\"%@\"\r\n\r\n",@"status"] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[[status stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[[NSString stringWithFormat:@"content-disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",@"pic",[path lastPathComponent]] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[[NSString stringWithString:@"Content-type: image\r\nContent-Transfer-Encoding: binary\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	 [body appendData:[NSData dataWithData:datapic]];
	 [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	 [request setHTTPBody:body];
	 
	 NSURLResponse *response;
	 NSError *error;
	 NSData * responseData = [NSURLConnection sendSynchronousRequest:request
	 returningResponse:&response
	 error:&error];
	 NSString *responseBody = [[NSString alloc] initWithData:responseData
	 
	 encoding:NSUTF8StringEncoding];
	 NSLog(@"%@", responseBody);
	 */
}
- (NSString *)_generateTimestamp 
{
    return [[NSString stringWithFormat:@"%d", time(NULL)] retain];
}

- (NSString *)_generateNonce 
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    NSMakeCollectable(theUUID);
	return (NSString *)string;
}

@end
