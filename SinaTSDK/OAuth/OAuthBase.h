//
//  OAuth.h
//  Test
//
//  Created by Fan ZHAO on 27/12/10.
//  Copyright 2010 Personne. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAuthConsumer.h"
#import "Constants.h"


extern NSString * const APPKEY;
extern NSString * const APPSECRET;

@interface OAuthBase : NSObject {
//	NSString * key;
//	NSString * secret;
	OAConsumer * consumer;
	OADataFetcher * fetcher;
	OAToken * requestToken;
	OAToken * accessToken;
	NSString * pin;
	NSString * uid;
}
@property (readwrite, retain) NSString * uid;
@property (readwrite, retain) OAToken * requestToken;
@property (readwrite, retain) NSString * pin;
@property (readwrite, retain) OAToken * accessToken;
//@property (readwrite, retain) NSString * key;
//@property (readwrite, retain) NSString * secret;
@property (retain)	OAConsumer * consumer;
@property (retain)  OADataFetcher * fetcher;
-(id) init;

-(OAMutableURLRequest *) prepareRequestWithURL:(NSString *) anUrl 
									  useToken:(OAToken *) aToken 
								 useHttpMethod:(NSString *) aMethod
							 withParametreDict:(NSDictionary *) dictParameter;

-(OAMutableURLRequest *) prepareRequestWithURL:(NSString *) anUrl 
								 useHttpMethod:(NSString *) aMethod 
							 withParametreDict:(NSDictionary *) dictParameter;


-(OAMutableURLRequest *) preparePutRequestWithURL:(NSString *) anUrl 
								withParametreDict:(NSDictionary *) dictParameter;

-(OAMutableURLRequest *) preparePostRequestWithURL:(NSString *) anUrl  
								 withParametreDict:(NSDictionary *) dictParameter;

-(OAMutableURLRequest *) prepareGetRequestWithURL:(NSString *) anUrl 
								withParametreDict:(NSDictionary *) dictParameter;

-(NSMutableURLRequest *) preparePostPicWithURL:(NSString *)anURL pathPic:(NSString *)path PicName:(NSString *)picname parametre:(NSDictionary *)dictParameter;

-(void) requestAToken;
-(void) requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data;
-(void) requestAccessToken;
-(BOOL) authorizeApp;
-(void) requestUserInfo;


- (NSString *)_generateTimestamp;
- (NSString *)_generateNonce;
//-(void) executeRequest;

@end
