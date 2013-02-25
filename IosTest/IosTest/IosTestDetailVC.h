//
//  IosTestDetailVC.h
//  IosTest
//
//  Created by Lorenzo Jose on 2/25/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IosTestDetailVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *myFilesDetails;

@end
