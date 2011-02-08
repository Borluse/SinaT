//
//  SinaApiParser.m
//  Test
//
//  Created by Fan ZHAO on 30/12/10.
//  Copyright 2010 Personne. All rights reserved.
//

#import "SinaApiParser.h"


@implementation SinaApiParser
@synthesize current,currentType, p, last, level;

//currentType : 1: statues;
//              
-(id) init{
    if ((self = [super init])){
    }
    return self;
}

-(void)sinaAPIStatusesPublic_timelineTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
	if (ticket.didSucceed){
		NSString *responseBody = [[NSString alloc] initWithData:data
													   encoding:NSUTF8StringEncoding];
		NSLog(@"%@", responseBody);
        //[self parserSinaAPIStatusesWithTicket:ticket didFinishWithData:data];
	}
}

-(Status *)parserAStatusWithTicket:(OAServiceTicket *)ticket didFinishWithData: 
(NSData *)data{
    if (ticket.didSucceed){
        NSArray * jsonData = [data yajl_JSON];
        return [self createStatusWithArray:jsonData];
    }else{
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",responseBody);
        NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserAStatusWithTicket" reason:responseBody userInfo:nil];
        @throw err;
        return nil;
    }
}

-(NSMutableArray *)parserStatusesWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
    if (ticket.didSucceed){
        NSArray * jsonData = [data yajl_JSON];
        NSMutableArray * statues = [[NSMutableArray alloc]init];
        for (int countStatus = 0; countStatus <[jsonData count]; countStatus++){
            Status * statu = [self createStatusWithArray:[jsonData objectAtIndex:countStatus]];
            [statues addObject:statu];
        }
        return statues;
    }
    else{
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",responseBody);
        NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserStatusesWithTicket" reason:responseBody userInfo:nil];
        @throw err;
        return nil;
    }
}

-(NSMutableArray *)parserCommentWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
    if (ticket.didSucceed){
        NSArray * jsonData = [data yajl_JSON];
        NSMutableArray * comment = [[NSMutableArray alloc]init];
        int size = [jsonData count];
        for (int countComment = 0; countComment <size; countComment++){
            STComment *cmt = [self createCommentWithArray:[jsonData objectAtIndex:countComment]];
            [comment addObject:cmt];
        }
        return comment;

    }
    else{
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",responseBody);
        NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserCommentWithTicket" reason:responseBody userInfo:nil];
        @throw err;
        return nil;

    }
}

-(STComment *)parserACommentWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
    if (ticket.didSucceed){
        NSArray * jsonData = [data yajl_JSON];
        return [self createCommentWithArray:jsonData];
    }
    else{
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",responseBody);
        NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserACommentWithTicket" reason:responseBody userInfo:nil];
        @throw err;
        return nil;

    }
}


-(NSMutableArray *)parserDirecteMessageWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
    if (ticket.didSucceed){
        NSArray * jsonData = [data yajl_JSON];
        NSMutableArray * msgs = [[NSMutableArray alloc] init];
        int size = [jsonData count];
        
        for (int i=0; i<size; i++){
            DirectMessage * msg = [self createDirectMessageWithArray:[jsonData objectAtIndex:i]];
            [msgs addObject:msg];
        }
        return msgs;

    }
    else{
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",responseBody);
        NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserDirecteMessageWithTicket" reason:responseBody userInfo:nil];
        @throw err;
        return nil;

    }
}
-(NSMutableArray *) parserUsersWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
    if (ticket.didSucceed){
        NSArray * jsonData = [data yajl_JSON];
        NSMutableArray * usrs = [[NSMutableArray alloc] init];
        int size = [jsonData count];
        
        for (int i=0; i<size; i++){
            User * usr = [self createUserWithArray: [jsonData objectAtIndex:i]];
            [usrs addObject:usr];
        }
        return usrs;

    }
    else{
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@",responseBody);
        NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserAUserWithTicket" reason:responseBody userInfo:nil];
        @throw err;
        return nil;
        
    }

}
-(User *) parserAUserWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data{
        if (ticket.didSucceed){
            NSArray * jsonData = [data yajl_JSON];
            return [self createUserWithArray:jsonData];
        }
        else{
            NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //        NSLog(@"%@",responseBody);
            NSException * err = [NSException exceptionWithName:@"请求API失败, 位置：parserAUserWithTicket" reason:responseBody userInfo:nil];
            @throw err;
            return nil;
            
        }

}


-(void)insertDatasIntoStatus:(Status *)aStatus withArray:(NSArray *)datas{
	//NSLog(@"status");
	NSString * temp;
//	NSLog(@"%@",datas);
	/* 
	 *	Add the created time
	 */
	NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
	[formatter setDateFormat:@"EEE MMM d HH:mm:ss ZZZ yyyy"];
	[aStatus setCreated_at:[formatter dateFromString:[datas valueForKey:@"created_at"]]];
	
	/*
	 *	Add favorite;
	 */
	[aStatus setFavorited:[[datas valueForKey:@"favorited"] integerValue]];	
	
	/*
	 *	Add WeiBoID;
	 */
    temp = [NSString stringWithFormat:@"%d",[datas valueForKey:@"id"]];
	[aStatus setWBid:[temp URLDecodedString]];
	/*
	 *	Add in_reply_to_screen_name
	 */
	temp = [datas valueForKey:@"in_reply_to_screen_name"];
	if (![temp isEqualToString:@""]){
		[aStatus setIn_reply_to_screen_name:[temp URLDecodedString]];
	}
	
	/*
	 *	Add in_reply_to_status_id
	 */
	temp = [datas valueForKey:@"in_reply_to_status_id"];
	if (![temp isEqualToString:@""]){
		[aStatus setIn_reply_to_status_id:[temp URLDecodedString]];
	}

	/*
	 *	Add in_reply_to_user_id
	 */
	temp = [datas valueForKey:@"in_reply_to_user_id"];
	if (![temp isEqualToString:@""]){
		[aStatus setIn_reply_to_user_id:[temp URLDecodedString]];
	}
	
	/*
	 *	Add source
	 */
	temp = [datas valueForKey:@"source"];
	if (![temp isEqualToString:@""]){
		[aStatus setSource:[temp URLDecodedString]];
	}
	
	/*
	 *	Add text
	 */
	temp = [datas valueForKey:@"text"];
	if (![temp isEqualToString:@""]){
		[aStatus setText:[temp URLDecodedString]];
	}
	
	/*
	 *	Add truncated
	 */
	[aStatus setTruncated:[[datas valueForKey:@"truncated"] integerValue]];
}
-(void)insertDatasIntoUser:(User *)anUser withArray:(NSArray *)datas{
//	NSLog(@"%@", datas);
	//NSLog(@"user");
	id temp;
	/* 
	 *	Add the created time
	 */
	NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
	[formatter setDateFormat:@"EEE MMM d HH:mm:ss ZZZ yyyy"];
	[anUser setCreated_at:[formatter dateFromString:[datas valueForKey:@"created_at"]]];
	
	/*
	 *	Add city
	 */
	[anUser setCity: [[datas valueForKey:@"city"] integerValue]];
	
	/*
	 *	Add description
	 */
	temp = [datas valueForKey:@"description"];
	if (![temp isEqualToString:@""]){
		[anUser setDescription:[temp URLDecodedString]];
	}
	
	/*
	 *	Add domain
	 */
	temp = [datas valueForKey:@"domain"];
	if (![temp isEqualToString:@""]){
		[anUser setDomain:[temp URLDecodedString]];
	}
	
	/*
	 *	Add favourites_count
	 */
	temp = [datas valueForKey:@"favourites_count"];

	[anUser setFavourites_count:[temp integerValue]];
	
	/*
	 *	Add followers_count
	 */
	temp = [datas valueForKey:@"followers_count"];
	[anUser setFollowers_count:[temp integerValue]];

	
	/*
	 *	Add friends_count
	 */
	temp = [datas valueForKey:@"friends_count"];
	[anUser setFriends_count:temp];
	
	/*
	 *	Add gender
	 */
	temp = [datas valueForKey:@"gender"];
	[anUser setGender:temp];

	/*
	 *	Add id
	 */
	temp = [datas valueForKey:@"id"];
	[anUser setUid:[[NSString stringWithFormat:@"%d",temp] URLDecodedString]];
	
	/*
	 *	Add location
	 */
	temp = [datas valueForKey:@"location"];
	[anUser setLocation:temp];
	
	/*
	 *	Add name
	 */
	temp = [datas valueForKey:@"name"];
	[anUser setName:[temp URLDecodedString]];
	
	/*
	 *	Add screen_name
	 */
	temp = [datas valueForKey:@"screen_name"];
	[anUser setScreen_name:[temp URLDecodedString]];
	
	/*
	 *	Add profile_image_url
	 */
	temp = [datas valueForKey:@"profile_image_url"];
	[anUser setProfile_image_url:[temp URLDecodedString]];
	
	/*
	 *	Add province
	 */
	temp = [datas valueForKey:@"province"];
	[anUser setProvince:temp];
	
	/*
	 *	Add url
	 */
	temp = [datas valueForKey:@"url"];
	[anUser setUrl:[temp URLDecodedString]];

	/*
	 *	Add verified
	 */
	temp = [datas valueForKey:@"verified"];
	[anUser setVerified:[temp integerValue]];
	
	/*
	 *	Add statuses_count
	 */
	temp = [datas valueForKey:@"statuses_count"];
	[anUser setStatuses_count:[temp integerValue]];
	
	//NSLog(@"%@",anUser);
}
-(void)insertDatasIntoSTComment:(STComment *)aComment withArray:(NSArray *)datas{
//	NSLog(@"%@", datas);
	//NSLog(@"comment");
	id temp;
	/* 
	 *	Add the created time
	 */
	NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
	[formatter setDateFormat:@"EEE MMM d HH:mm:ss ZZZ yyyy"];
	[aComment setCreated_at:[formatter dateFromString:[datas valueForKey:@"created_at"]]];

	/*
	 *	Add id
	 */
	temp = [datas valueForKey:@"id"];
	[aComment setCid:temp];
	
	/*
	 *	Add text
	 */
	temp = [datas valueForKey:@"text"];
	[aComment setText:[temp URLDecodedString]];
	
	//NSLog(@"%@",aComment);
}
-(void)insertDatasIntoDirecteMsg:(DirectMessage *)aDirecteMsg withArray:(NSArray *)datas{
	id temp;
	
	/* 
	 *	Add the created time
	 */
	NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	formatter.locale = [[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] autorelease];
	[formatter setDateFormat:@"EEE MMM d HH:mm:ss ZZZ yyyy"];
	[aDirecteMsg setCreated_at:[formatter dateFromString:[datas valueForKey:@"created_at"]]];

	/*
	 *	Add id
	 */
	temp = [datas valueForKey:@"id"];
	[aDirecteMsg setMsg_id:temp];
	
	/*
	 *	Add recipient id
	 */
	temp = [datas valueForKey:@"recipient_id"];
	[aDirecteMsg setRecipient_id:temp];
	
	/*
	 *	Add sender id
	 */
	temp = [datas valueForKey:@"sender_id"];
	[aDirecteMsg setSender_id:temp];
	
	/*
	 *	Add recipient name
	 */
	temp = [datas valueForKey:@"recipient_screen_name"];
	[aDirecteMsg setRecipient_screen_name:temp];
	

	/*
	 *	Add sender name
	 */
	temp = [datas valueForKey:@"sender_screen_name"];
	[aDirecteMsg setSender_screen_name:temp];
	
	/*
	 *	Add text
	 */
	temp = [datas valueForKey:@"text"];
	[aDirecteMsg setText:[temp URLDecodedString]];

	
}
		 

-(Status *) createStatusWithArray:(NSArray *)datas{
	Status * status = [[Status alloc] init];
	[self insertDatasIntoStatus:status withArray:datas];
	User * user = [self createUserWithArray:[datas valueForKey:@"user"]];
	[status setUser:user];
	NSArray * arr = [datas valueForKey:@"retweeted_status"];
	if (arr != nil){
        //		NSLog(@"Il y a retweeted");
		Status * retweet = [self createStatusWithArray:arr];
		[status setRetweeted_status:retweet];
	}
	return status;
}
		 
-(User *) createUserWithArray: (NSArray *)datas{
	User * usr = [[User alloc] init];
	[self insertDatasIntoUser:usr withArray:datas];
	NSArray * arr = [datas valueForKey:@"status"];
	if (arr != nil){
        //		NSLog(@"status in user");
		Status * status = [self createStatusWithArray:arr];
	}
	return usr;
}

-(STComment *) createCommentWithArray: (NSArray *)datas{
	STComment *cmt = [[STComment alloc] init];
	[self insertDatasIntoSTComment:cmt withArray:datas];
	NSArray * arr = [datas valueForKey:@"user"];
	if (arr != nil) {
//		NSLog(@"user in comment");
		User * usr = [self createUserWithArray:arr];
		[cmt setUser:usr];
	}
	arr = [datas valueForKey:@"status"];
	if (arr != nil) {
		NSLog(@"status in comment");
		Status * status = [self createStatusWithArray:arr];
		[cmt setStatus:status];
	}
	
	return cmt;
}

-(DirectMessage *)createDirectMessageWithArray: (NSArray *)datas{
	DirectMessage * dm = [[DirectMessage alloc] init];
	[self insertDatasIntoDirecteMsg:dm withArray:datas];
	User * recipient = [self createUserWithArray:[datas valueForKey:@"recipient"]];
	User * sender = [self createUserWithArray:[datas valueForKey:@"sender"]];

	[dm setRecipient:recipient];
	[dm setSender:sender];

    //	NSLog(@"\n %@",dm);
	return dm;
}

-(NSString *) fetchDataTicket:(OAServiceTicket *)ticket didFailWithError: (NSError *) error{
    //        NSLog(@"%@",responseBody);
    @throw error;
    return nil;
}
		 
@end
