//
//  IosTestAppDelegate.h
//  IosTest
//
//  Created by Lorenzo Jose on 2/17/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IosTestAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
