//
//  IosTestVC.h
//  IosTest
//
//  Created by Lorenzo Jose on 2/18/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IosTestVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *objectArray;
@property (nonatomic, strong) NSArray        *revID;
@property (nonatomic, strong) NSDictionary   *key;
@property (nonatomic, strong) NSDictionary   *attribute;
@property (nonatomic, strong) NSArray        *myFiles;
@property (nonatomic, strong) NSArray        *sharedFiles;

-(void)persistNewFileWithStatus:(NSString*)status isShared:(NSString*)isShared shareId:(NSString*)shareId userId:(NSNumber*)userId name:(NSString*)name sharedBy:(NSNumber*)sharedBy shareDate:(NSString*)sharedDate shareLevel:(NSString*)sharedLevel parentId:(NSNumber*)parentId lastUpdateDate:(NSString*)lastUpdateDate lastUpdateBy:(NSString*)lastUpdateBy link:(NSString*)link createDate:(NSString*)createDate itemId:(NSNumber*)itemId path:(NSString*)path type:(NSString*)type mimeType:(NSString*)mimeType size:(NSNumber*)size;


@end
