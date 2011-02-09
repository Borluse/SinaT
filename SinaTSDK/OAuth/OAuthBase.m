//
//  OAuth.m
//  Test
//
//  Created by Fan ZHAO on 27/12/10.
//  Copyright 2010 Personne. All rights reserved.
//

#import "OAuthBase.h"


@implementation OAuthBase
@synthesize requestToken, pin, accessToken, uid, consumer, fetcher;
-(id) init{
	if ((self = [super init])){
		consumer = [[OAConsumer alloc] initWithKey:APPKEY
											secret:APPSECRET];
		fetcher = [[OADataFetcher alloc] init];
	}
	return self;
	
}

-(OAMutableURLRequest *) prepareRequestWithURL:(NSString *) anUrl 
					 useToken:(OAToken *) aToken 
				useHttpMethod:(NSString *) aMethod 
			withParametreDict:(NSDictionary *) dictParameter{
	OAMutableURLRequest * request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:anUrl]
																	consumer:consumer
																	   token:aToken
																	   realm:nil
														   signatureProvider:nil];
	if (aMethod != nil){
		[request setHTTPMethod:aMethod];
	}
	else {
		[request setHTTPMethod:@"POST"];
	}
	[request setOAuthParameterName:@"oauth_callback"
						 withValue:@"oob"];
/*
	if (dictParameter != nil){
		for (NSString * parameterName in dictParameter) {
//			NSLog(@"key: %@, value: %@", key, [dictionary objectForKey:key]);
			OARequestParameter
			[request setParameters:[dictParameter ]

		}	
	}
 */
	//[request prepare];
    //	NSLog(@"%@",[request _signatureBaseString]);
	return request;
}
-(OAMutableURLRequest *) prepareRequestWithURL:(NSString *) anUrl 
								 useHttpMethod:(NSString *) aMethod 
							 withParametreDict:(NSDictionary *) dictParameter{
	return [self prepareRequestWithURL:anUrl
							  useToken:accessToken
						 useHttpMethod:aMethod
					 withParametreDict:dictParameter];
	
}

-(OAMutableURLRequest *) prepareGetRequestWithURL:(NSString *) anUrl 
							 withParametreDict:(NSDictionary *) dictParameter{
	NSMutableString * url = [[NSMutableString alloc]initWithString:anUrl];
	[url appendString:@"?"];
	if (dictParameter != nil){

		for (NSString * parameterName in dictParameter){
			[url appendFormat:@"%@=%@&",parameterName, [[dictParameter objectForKey:parameterName] URLEncodedString]];
		}
	}
	
	OAMutableURLRequest *requst = [self prepareRequestWithURL:[url substringToIndex:[url length]-1]
													 useToken:accessToken
												useHttpMethod:@"GET"
											withParametreDict:nil];
	return requst;
}

-(OAMutableURLRequest *) preparePostRequestWithURL:(NSString *) anUrl 
								withParametreDict:(NSDictionary *) dictParameter{
//	OAMutableURLRequest *request = [self prepareRequestWithURL:anUrl
//												 useHttpMethod:@"POST"
//											 withParametreDict:nil];
//	NSData *body = [[NSData alloc] initWithBytes:[temp substringToIndex:[temp length] -1] length:[temp length]-1];
	OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:anUrl]
																   consumer:consumer
																	  token:accessToken
																	  realm:nil
														  signatureProvider:nil];
	NSMutableString * temp = [[NSMutableString alloc] init];
	if (dictParameter != nil){
		for (NSString * parameterName in dictParameter){
			[temp appendFormat:@"%@=%@&",parameterName, [dictParameter objectForKey:parameterName]];
//			[request setOAuthParameterName:parameterName withValue:[dictParameter objectForKey:parameterName]];
		}
	}
	NSData *body = [[temp substringToIndex:[temp length]-1] dataUsingEncoding:NSUTF8StringEncoding];
	[request setHTTPBody:body];
//	[request setOAuthParameterName:parameterName withValue:@"test"];
//	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPMethod:@"POST"];
	//[request prepare];
    //	NSLog(@"%@",[request _signatureBaseString]);
	return request;
}
-(OAMutableURLRequest *) preparePutRequestWithURL:(NSString *) anUrl 
								withParametreDict:(NSDictionary *) dictParameter{
	return [self prepareRequestWithURL:anUrl
							  useToken:accessToken
						 useHttpMethod:@"PUT"
					 withParametreDict:dictParameter];
}
-(NSMutableURLRequest *) preparePostPicWithURL:(NSString *)anURL pathPic:(NSString *)path PicName:(NSString *)picname parametre:(NSDictionary *)dictParameter{
	NSMutableData * body;
	NSMutableString * temp = [[NSMutableString alloc] init];
	int position = 1;
	if (dictParameter != nil){
		for (NSString * parameterName in dictParameter){
			[temp appendFormat:@"%@=%@",parameterName, [dictParameter objectForKey:parameterName]];
		}
		if (position < [dictParameter count]){
			[temp appendString:@"&"];
			position++;
		}
		 body = [NSMutableData dataWithData:[temp dataUsingEncoding:NSUTF8StringEncoding]];
	}
	else{
		body = [[NSMutableData alloc] init];
	}
	
	NSData * datapic = [[NSData alloc] initWithContentsOfFile:path];
	
/*	OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:[NSURL URLWithString:anURL]
																   consumer:consumer
																	  token:accessToken
																	  realm:nil
														  signatureProvider:nil];
 */
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:anURL]
																 cachePolicy:NSURLRequestReloadIgnoringCacheData
															 timeoutInterval:60.0];
	
	NSString * timestamp = [self _generateTimestamp];
	NSString * nonce = [self _generateNonce];
	NSMutableArray *parameterPairs = [[NSMutableArray alloc]init];
	
	[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_consumer_key" value:consumer.key] URLEncodedNameValuePair]];
	[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_signature_method" value:@"HMAC-SHA1"] URLEncodedNameValuePair]];
	[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_timestamp" value:timestamp] URLEncodedNameValuePair]];
	[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_nonce" value:nonce] URLEncodedNameValuePair]];
	[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_version" value:@"1.0"] URLEncodedNameValuePair]];
	[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"oauth_token" value:accessToken.key] URLEncodedNameValuePair]];
	//[parameterPairs addObject:[[OARequestParameter requestParameterWithName:@"status" value:status] URLEncodedNameValuePair]];
	
	if (dictParameter != nil){
		for (NSString * paramName in dictParameter){
			[parameterPairs addObject:[[OARequestParameter requestParameterWithName:paramName value:[dictParameter objectForKey:paramName]] URLEncodedNameValuePair]];
		}
	}	

	NSArray *sortedPairs = [parameterPairs sortedArrayUsingSelector:@selector(compare:)];
    NSString *normalizedRequestParameters = [sortedPairs componentsJoinedByString:@"&"];
    
    // OAuth Spec, Section 9.1.2 "Concatenate Request Elements"
    NSString *baseString = [NSString stringWithFormat:@"%@&%@&%@",
					 @"POST",
					 [anURL URLEncodedString],
					 [normalizedRequestParameters URLEncodedString]];
	
	NSString *signature = [[[OAHMAC_SHA1SignatureProvider alloc] init] signClearText:baseString
												withSecret:[NSString stringWithFormat:@"%@&%@", [consumer.secret URLEncodedString], [accessToken.secret URLEncodedString]]];
	NSString *oauthToken = [NSString stringWithFormat:@"oauth_token=\"%@\", ", [accessToken.key URLEncodedString]];

	NSString *oauthHeader = [NSString stringWithFormat:@"OAuth realm=\"%@\", oauth_consumer_key=\"%@\", %@oauth_signature_method=\"%@\", oauth_signature=\"%@\", oauth_timestamp=\"%@\", oauth_nonce=\"%@\", oauth_version=\"1.0\"%@",
							 @"",
                             [APPKEY URLEncodedString],
                             oauthToken,
                             [@"HMAC-SHA1" URLEncodedString],
                             [signature URLEncodedString],
                             timestamp,
                             nonce,
							 @""];
	NSString * boundary = [NSString stringWithString:@"A0B8X2"];
	NSString * contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
		
	[request setHTTPMethod:@"POST"];
	[request setValue:oauthHeader forHTTPHeaderField:@"Authorization"];
	[request addValue:contentType forHTTPHeaderField:@"Content-Type"];
	
	if (dictParameter != nil){
		for (NSString * paramName in dictParameter){
			[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
			[body appendData:[[NSString stringWithFormat:@"content-disposition: form-data; name=\"%@\"\r\n\r\n",paramName] dataUsingEncoding:NSUTF8StringEncoding]];
			[body appendData:[[[dictParameter objectForKey:paramName] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding] dataUsingEncoding:NSUTF8StringEncoding]];
		}
        
    }	
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	
	
	[body appendData:[[NSString stringWithFormat:@"content-disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",picname,[path lastPathComponent]] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithString:@"Content-type: image\r\nContent-Transfer-Encoding: binary\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[NSData dataWithData:datapic]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:body];

	return request;
}
-(void) requestAToken{
	OAMutableURLRequest * request = [self prepareRequestWithURL:@"http://api.t.sina.com.cn/oauth/request_token"
													   useToken:nil
												  useHttpMethod:nil
											  withParametreDict:nil];
	[fetcher fetchDataWithRequest:request
						 delegate:self
				didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
				  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
}

-(void) requestAccessToken{
	OAMutableURLRequest * request = [self prepareRequestWithURL:@"http://api.t.sina.com.cn/oauth/access_token"
													   useToken:requestToken
												  useHttpMethod:nil
											  withParametreDict:nil];
	[request setOAuthParameterName:@"oauth_verifier" withValue:pin];
	[fetcher fetchDataWithRequest:request
						 delegate:self
				didFinishSelector:@selector(accessTokenTicket:didFinishWithData:)
				  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
}

- (void)requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
	if (ticket.didSucceed) {
		NSString *responseBody = [[NSString alloc] initWithData:data
													   encoding:NSUTF8StringEncoding];
		NSLog(@"%@", responseBody );
		requestToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
		NSLog(@"%@      %@", [requestToken secret], requestToken.key );
	//	[self authorizeApp];
	}
}
-(void) accessTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
	
	if (ticket.didSucceed){
		NSString *responseBody = [[NSString alloc] initWithData:data
													   encoding:NSUTF8StringEncoding];
		NSLog(@"%@", responseBody);
		accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
		NSLog(@"%@      %@", [accessToken secret], accessToken.key );
		NSArray *pairs = [responseBody componentsSeparatedByString:@"&"];
		pairs = [[pairs objectAtIndex:2] componentsSeparatedByString:@"="];
		self.uid = [pairs objectAtIndex:1];
		NSLog(@"uid:::  %@", uid);
	}
}
-(BOOL) authorizeApp{
	NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.t.sina.com.cn/oauth/authorize?oauth_token=%@", requestToken.key]];
	[[NSWorkspace sharedWorkspace] openURL:url];
	return YES;
}
-(void) requestUserInfo{
	//OAConsumer *consumer = [[OAConsumer alloc] initWithKey:key
	//                                               secret:secret];
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://api.t.sina.com.cn/account/verify_credentials.json"]];
	//NSLog(@"%@", pin);
	//OAToken * temp = [[OAToken alloc] initWithKey:@"e432f889bf970d1541a4001ae8e035e7" secret:@"a80e999dde2931d6de00b16b1634c779"];
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
                                                                   consumer:consumer
                                                                      token:accessToken   // requestToken 
                                                                      realm:NULL   // our service provider doesn't specify a realm
                                                          signatureProvider:nil]; 
	
    [request setHTTPMethod:@"GET"];
	[request setOAuthParameterName:@"oauth_callback" withValue:@"oob"];
	//	[request setOAuthParameterName:@"oauth_verifier" withValue:@"411672"];
	//[request setOAuthParameterName:@"user_id" withValue:@"1390984450"];
	[request prepare];
	
    //	NSLog(@"%@", [request _signatureBaseString]);
    
	
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(getInfoTicket:didFinishWithData:)
                  didFailSelector:@selector(tetInfoTicket:didFailWithError:)];
}
-(void) getInfoTicket: (OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
	//if (ticket.didSucceed){
	NSString *responseBody = [[NSString alloc] initWithData:data
												   encoding:NSUTF8StringEncoding];
	NSLog(@"%@", responseBody);
	/*		accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
	 NSLog(@"%@      %@", [accessToken secret], accessToken.key );
	 NSArray *pairs = [responseBody componentsSeparatedByString:@"&"];
	 pairs = [[pairs objectAtIndex:2] componentsSeparatedByString:@"="];
	 self.uid = [pairs objectAtIndex:1];
	 NSLog(@"uid:::  %@", uid);*/
	//}
	
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


-(void) dealloc{
	[consumer release];
	[fetcher release];
	[requestToken release];
	[accessToken release];
	[pin release];
	[uid release];
	[super dealloc];
}
@end
