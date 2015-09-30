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

- (void) searchEvents
{
    NSString *urlAsString = @"http://playaevents.burningman.org/api/0.2/2015/event/";
    NSURL *url = [NSURL URLWithString:urlAsString];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if(error){
            [self.delegate fetchingEventsFailedWithError:error];
        }
        else{
            [self.delegate receivedEventsJSON:data];
        }
    }];
}

@end
