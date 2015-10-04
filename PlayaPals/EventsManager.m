//
//  EventsManager.m
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import "EventsManager.h"
#import "EventBuilder.h"
#import "EventsCommunicator.h"

@implementation EventsManager
- (void)fetchEvents:(NSDate*) date
{
    [self.communicator searchEvents:date];
}

#pragma mark - EventsCommunicatorDelegate

- (void)receivedEventsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *events = [EventBuilder eventsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingEventsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveEvents:events];
    }
}

- (void)fetchingEventsFailedWithError:(NSError *)error
{
    [self.delegate fetchingEventsFailedWithError:error];
}

@end
