//
//  Files.h
//  IosTest
//
//  Created by Lorenzo Jose on 2/24/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Files : NSManagedObject

@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * is_shared;
@property (nonatomic, retain) NSString * share_id;
@property (nonatomic, retain) NSNumber * user_id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * shared_by;
@property (nonatomic, retain) NSString * shared_date;
@property (nonatomic, retain) NSString * share_level;
@property (nonatomic, retain) NSNumber * parent_id;
@property (nonatomic, retain) NSString * last_update_date;
@property (nonatomic, retain) NSString * last_update_by;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * created_date;
@property (nonatomic, retain) NSNumber * item_id;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * mime_type;
@property (nonatomic, retain) NSNumber * size;
@property (nonatomic, retain) NSString * rev_id;

@end
