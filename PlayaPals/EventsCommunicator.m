//
//  EventsCommunicator.m
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import "EventsCommunicator.h"
#import "EventsCommunicatorDelegate.h"

@implementation EventsCommunicator

- (void) searchEvents:(NSDate*) date
{
    NSMutableString *urlAsString = [[NSMutableString alloc]
                                    initWithFormat:@"http://playaevents.burningman.org/api/0.2/2015/event/"];
    
    if (date != nil) {
        [urlAsString appendString:@"?/end_time="];
        NSString *dateString = [self formatDateAsString:date];
        [urlAsString appendString:dateString];
        [urlAsString appendString:@"&start_time="];
        [urlAsString appendString:dateString];
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithString:urlAsString]];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(error){
            [self.delegate fetchingEventsFailedWithError:error];
        }
        else{
            [self.delegate receivedEventsJSON:data];
        }
    }];
}

- (NSString*) formatDateAsString:(NSDate*) date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *stringFromDate = [formatter stringFromDate:date];
    return stringFromDate;
}

@end
