//
//  EventDetailViewController.h
//  PlayaPals
//
//  Created by Jenna Tauro on 2015-09-30.
//  Copyright © 2015 JennaTauro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *DetailScrollView;

@property (strong, nonatomic) NSString *detailEventTitle;


@end
