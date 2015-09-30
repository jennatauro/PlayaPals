//
//  EventsCommunicatorDelegate.h
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

@protocol EventsCommunicatorDelegate

-(void)receivedEventsJSON:(NSData *)objectNotation;
-(void)fetchingEventsFailedWithError: (NSError *)error;

@end
