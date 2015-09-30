//
//  EventDetailViewController.m
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import "EventDetailViewController.h"

#import "Event.h"
#import "EventsManager.h"
#import "EventsCommunicator.h"

@interface EventDetailViewController ()
- (void)configureView;
- (void)putStuffInDetailScrollView:(NSString *)detailEventTitle;
@end

@implementation EventDetailViewController


#pragma mark - Managing the detail item

-(void)putStuffInDetailScrollView:(NSString *)detailEventTitle
{
    
    
    [self.view addSubview:self.DetailScrollView];
    
    //set title
    self.navigationItem.title = detailEventTitle;
    
}


- (void)configureView
{
    // Update the user interface for the detail item.
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self putStuffInDetailScrollView:self.detailEventTitle];
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

