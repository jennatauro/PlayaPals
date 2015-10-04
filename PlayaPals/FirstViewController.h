//
//  FirstViewController.h
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-29.
//  Copyright (c) 2015 JennaTauro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventsManagerDelegate.h"
#import "ASDayPicker.h"

@interface FirstViewController : UITableViewController<EventsManagerDelegate>
@property (nonatomic, strong) ASDayPicker *dayPicker;
@property (nonatomic, strong) NSLayoutConstraint *tableViewHeaderHeight;
@property (nonatomic, strong) NSLayoutConstraint *dayPickerHeight;
@property (nonatomic, strong) NSDate *selectedDay;
@end

