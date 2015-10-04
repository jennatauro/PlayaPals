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
#import "MBProgressHUD.h"
#import <KVOController/FBKVOController.h>
#import "UIView+AutoLayout.h"

static const CGFloat kDayPickerHeight = 65.0f;

@interface FirstViewController () <EventsManagerDelegate>{
    NSArray *_events;
    EventsManager *_manager;
    NSDate *festivalStartDate;
    NSDate *festivalEndDate;
}
@end

@implementation FirstViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setFestivalDates];
    
    _manager = [[EventsManager alloc] init];
    _manager.communicator = [[EventsCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    self.selectedDay = festivalStartDate;
    
    [self layoutTableHeaderViewWithWidth:self.view.bounds.size.width];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        [self startFetchingEvents];
    });
    
}

- (void) setFestivalDates {
    NSString *startDateString = @"31-Aug-15";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"dd-MMM-yy";
    
    festivalStartDate = [dateFormatter dateFromString:startDateString];
    
    NSString *endDateString = @"07-Sep-15";
    festivalEndDate = [dateFormatter dateFromString:endDateString];
}

- (void) layoutTableHeaderViewWithWidth:(CGFloat)width {
    NSParameterAssert(self.tableView != nil);
    // Configure header view
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    tableHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *emptyContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
    
    [self setupDayPicker];
    [tableHeaderView addSubview:self.dayPicker];
    [tableHeaderView addSubview:emptyContainer];
    
    [emptyContainer autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:tableHeaderView];
    _dayPickerHeight = [self.dayPicker autoSetDimension:ALDimensionHeight toSize:kDayPickerHeight];
    [self.dayPicker autoSetDimension:ALDimensionWidth toSize:width];
    [self.dayPicker autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:tableHeaderView withOffset:8];
    [self.dayPicker autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:emptyContainer];
    
    NSLayoutConstraint *headerWidthConstraint = [NSLayoutConstraint
                                                 constraintWithItem:tableHeaderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual
                                                 toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:width
                                                 ];
    [tableHeaderView addConstraint:headerWidthConstraint];
    CGFloat height = [tableHeaderView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [tableHeaderView removeConstraint:headerWidthConstraint];
    
    tableHeaderView.frame = CGRectMake(0, 0, width, height);
    [tableHeaderView autoSetDimension:ALDimensionWidth toSize:width];
    self.tableViewHeaderHeight = [tableHeaderView autoSetDimension:ALDimensionHeight toSize:height];
    
    self.tableView.tableHeaderView = tableHeaderView;
}

- (void)setupDayPicker {
    self.dayPicker = [[ASDayPicker alloc] initForAutoLayout];
    [self.dayPicker setStartDate:festivalStartDate endDate:festivalEndDate];
    [self.dayPicker setWeekdayTitles:[ASDayPicker weekdayTitlesWithLocaleIdentifier:nil length:3 uppercase:YES]];
    self.dayPicker.selectedDate = self.selectedDay;
    [self.dayPicker setSelectedDateBackgroundImage:[UIImage imageNamed:@"selection"]];
    [self.KVOController observe:self.dayPicker keyPath:NSStringFromSelector(@selector(selectedDate)) options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew block:^(id observer, ASDayPicker *dayPicker, NSDictionary *change) {
        NSDate *newDate = dayPicker.selectedDate;
        self.selectedDay = newDate;
    }];
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
        [MBProgressHUD hideHUDForView:self.view animated:YES];
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

