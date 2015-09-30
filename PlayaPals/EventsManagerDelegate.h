//
//  EventsManagerDelegate.h
//
//  Created by Jenna Tauro on 09/30/2015.
//

#import <Foundation/Foundation.h>

@protocol EventsManagerDelegate <NSObject>
-(void)didReceiveEvents:(NSArray *)events;
-(void)fetchingEventsFailedWithError:(NSError *)error;
@end
