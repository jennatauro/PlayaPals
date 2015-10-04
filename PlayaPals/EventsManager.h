//
//  EventsManager.h
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EventsManagerDelegate.h"
#import "EventsCommunicatorDelegate.h"

@class EventsCommunicator;

@interface EventsManager : NSObject<EventsCommunicatorDelegate>
@property (strong, nonatomic) EventsCommunicator *communicator;
@property (weak, nonatomic) id<EventsManagerDelegate> delegate;

-(void)fetchEvents:(NSDate*) date;

@end
