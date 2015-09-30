//
//  FirstViewController.m
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-29.
//  Copyright (c) 2015 JennaTauro. All rights reserved.
//

#import "FirstViewController.h"
#import "EventDetailViewController.h"

#import "EventDetailCell.h"
#import "Event.h"
#import "EventsManager.h"
#import "EventsCommunicator.h"

@interface FirstViewController () <EventsManagerDelegate>{
    NSArray *_events;
    EventsManager *_manager;
}
@end

@implementation FirstViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _manager = [[EventsManager alloc] init];
    _manager.communicator = [[EventsCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [self startFetchingEvents];
}

- (void)startFetchingEvents
{
    [_manager fetchEvents];
}

- (void)didReceiveEvents:(NSArray *)events
{
    _events = events;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)fetchingEventsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}



#pragma mark - Accessors

#pragma mark - Notification Observer

#pragma mark - EventsManagerDelegate

#pragma mark - Table View

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _events.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Event *event = _events[indexPath.row];
    [cell.textLabel setText:event.eventtitle];
    
    return cell;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"showDetail"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Event *event = _events[indexPath.row];
        
    }
}



@end

