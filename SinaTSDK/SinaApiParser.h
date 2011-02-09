//
//  SinaApiParser.h
//  Test
//
//  Created by Fan ZHAO on 30/12/10.
//  Copyright 2010 Personne. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OAuthConsumer.h"
#import "Status.h"
#import "DirectMessage.h"
#import "User.h"
#import "STComment.h"
#import <YAJL/YAJL.h>

@interface SinaApiParser : NSObject {
//    NSMutableArray * result;
    int currentType;
    id current;
    id p;
    NSString *last;
	int level;
}
@property (retain) id current;
@property (assign) int currentType;
//@property (retain) NSMutableArray * result;
@property (retain) id p;
@property (assign)	int level;
@property (retain) NSString *last;


-(void)sinaAPIStatusesPublic_timelineTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;
-(NSArray *)parserStatusesWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;
-(Status *)parserAStatusWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;

-(NSArray *)parserCommentWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;
-(STComment *)parserACommentWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;

-(NSArray *)parserDirecteMessageWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;
-(DirectMessage *)parserADirecteMessageWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;

-(NSArray *) parserUsersWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;
-(User *) parserAUserWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;

-(NSArray *) parserOtherTypesWithTicket:(OAServiceTicket *)ticket didFinishWithData: (NSData *)data;

-(void)insertDatasIntoStatus:(Status *)aStatus withArray:(NSArray *)datas;
-(void)insertDatasIntoUser:(User *)anUser withArray:(NSArray *)datas;
-(void)insertDatasIntoSTComment:(STComment *)aComment withArray:(NSArray *)datas;
-(void)insertDatasIntoDirecteMsg:(DirectMessage *)aDirecteMsg withArray:(NSArray *)datas;

-(Status *) createStatusWithArray:(NSArray *)datas;
-(User *) createUserWithArray: (NSArray *)datas;
-(STComment *) createCommentWithArray: (NSArray *)datas;
-(DirectMessage *)createDirectMessageWithArray: (NSArray *)datas;

-(NSString *) fetchDataTicket:(OAServiceTicket *)ticket didFailWithError: (NSError *) error;
@end
