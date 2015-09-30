//
//  EventsBuilder.h
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventBuilder : NSObject

+(NSArray *) eventsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
