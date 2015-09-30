//
//  EventsCommunicator.h
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventsCommunicatorDelegate;

@interface EventsCommunicator : NSObject
@property (weak, nonatomic) id<EventsCommunicatorDelegate> delegate;

-(void) searchEvents;

@end
