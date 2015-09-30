//
//  EventsBuilder.m
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import "EventBuilder.h"
#import "Event.h"

@implementation EventBuilder
+ (NSArray *)eventsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *events = [[NSMutableArray alloc] init];
    
    for (NSDictionary *eventDic in parsedObject) {
        Event *event = [[Event alloc] init];
        [event setEventtitle:[eventDic objectForKey:@"title"]];
        [events addObject:event];
        
        
//        [movie setMovietitle:[movieDic objectForKey:@"title"]];
//        [movie setImageUrl:[(NSDictionary*)[movieDic objectForKey:@"posters"] objectForKey:@"detailed"]];
//        [movie setSynopsis:[movieDic objectForKey:@"synopsis"]];
//        [movies addObject:movie];
    }
    
    return events;
    
}

@end
