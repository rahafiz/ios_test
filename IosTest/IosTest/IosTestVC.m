//
//  IosTestVC.m
//  IosTest
//
//  Created by Lorenzo Jose on 2/18/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define KLatestYakimbiURL [NSURL URLWithString: @"https://gist.github.com/raw/4680060/aac6d818e7103edfe721e719b1512f707bcfb478/sample.json"]

#import "IosTestVC.h"
#import "jsonObject.h"
#import "Files.h"
#import "IosTestDetailVC.h"

@interface IosTestVC ()

@end

@implementation IosTestVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _revID = [[NSArray alloc]init];
    
    dispatch_async(kBgQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:KLatestYakimbiURL];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data
                            waitUntilDone:YES];
        
    
    });
    
    self.navigationItem.title = @"LIST OF FILE";
    
    
}

-(void)fetchedData:(NSData *)responseData
{
    //Parse out JSON Data
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    
    _objectArray = [[NSMutableArray alloc]init];
    
    _revID = [json objectForKey:@"last_rev_id"];
    
    
    _myFiles     = [[json objectForKey:@"my_files"] objectForKey:@"content"];
 
    for (NSDictionary *content in _myFiles)
    {
        NSString *status         = [content objectForKey:@"status"];
        NSString *isShared       = [content objectForKey:@"is_shared"];
        NSString *sharedId       = [content objectForKey:@"share_id"];
        NSNumber *userId         = [content objectForKey:@"user_id"];
        NSString *name           = [content objectForKey:@"name"];
        NSNumber *sharedBy       = [content objectForKey:@"shared_by"];
        NSString *sharedDate     = [content objectForKey:@"shared_date"];
        NSString *shareLevel     = [content objectForKey:@"share_level"];
        NSNumber *parentId       = [content objectForKey:@"parent_id"];
        NSString *lastUpdateDate = [content objectForKey:@"last_update_date"];
        NSString *lastUpdateBy   = [content objectForKey:@"last_update_by"];
        NSString *link           = [content objectForKey:@"link"];
        NSString *createdDate    = [content objectForKey:@"created_date"];
        NSNumber *itemId         = [content objectForKey:@"item_id"];
        NSString *path           = [content objectForKey:@"path"];
        NSString *type           = [content objectForKey:@"type"];
        NSString *mimeType       = [content objectForKey:@"mime_type"];
        NSNumber *size           = [content objectForKey:@"size"];
        
        //NSString *lastUpdatedBy = [content objectForKey:@"last_updated_by"];
        
        NSNumber *parentIdWithData;
        
        if (parentId == nil)
        {
            NSLog(@"parent id is nil");
        } else {
            
            [parentIdWithData setValue:[json objectForKey:@"parent_id"] forKey:@"parent_id"];
        }
        
        
       // NSLog(@"Parent ID :%@", parentIdWithData);
        
        
        [self persistNewFileWithStatus:status
                              isShared:isShared
                               shareId:sharedId
                                userId:userId
                                  name:name
                              sharedBy:sharedBy
                             shareDate:sharedDate
                            shareLevel:shareLevel
                              parentId:parentIdWithData
                        lastUpdateDate:lastUpdateDate
                          lastUpdateBy:lastUpdateBy
                                  link:link
                            createDate:createdDate
                                itemId:itemId
                                  path:path
                                  type:type
                              mimeType:mimeType
                                  size:size];
    
    }
 
}

-(void)persistNewFileWithStatus:(NSString*)status isShared:(NSString*)isShared shareId:(NSString*)shareId userId:(NSNumber*)userId name:(NSString*)name sharedBy:(NSNumber*)sharedBy shareDate:(NSString*)sharedDate shareLevel:(NSString*)sharedLevel parentId:(NSNumber*)parentId lastUpdateDate:(NSString*)lastUpdateDate lastUpdateBy:(NSString*)lastUpdateBy link:(NSString*)link createDate:(NSString*)createDate itemId:(NSNumber*)itemId path:(NSString*)path type:(NSString*)type mimeType:(NSString*)mimeType size:(NSNumber*)size
{
    //Save JSON Entity to core data
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    
    Files *files = [Files MR_createInContext:localContext];
    files.status = status;
    files.is_shared = isShared;
    files.share_id  = shareId;
    files.user_id   = userId;
    files.name      = name;
    files.shared_by = sharedBy;
    files.shared_date = sharedDate;
    files.share_level = sharedLevel;
    files.parent_id   = parentId;
    files.last_update_date = lastUpdateDate;
    files.last_update_by   = lastUpdateBy;
    files.link             = link;
    files.created_date     = createDate;
    files.item_id          = itemId;
    files.path             = path;
    files.type             = type;
    files.mime_type        = mimeType;
    files.size             = size;
    
    [localContext MR_saveNestedContexts];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
    return 1;
    } else {
        return 1;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *CellIdentifier = @"cell";
    
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
    
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        NSString *firstFiles  = @"MY FILES";
        
        
        NSMutableArray *filesArray = [NSMutableArray arrayWithObjects:firstFiles, nil];
        
        cell.textLabel.text = [filesArray objectAtIndex:indexPath.row];
        
        return cell;
  
   
    } else {
        
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        NSString *firstFiles  = @"MY FILES";
        
        
        NSMutableArray *filesArray = [NSMutableArray arrayWithObjects:firstFiles, nil];
        
        cell.textLabel.text = [filesArray objectAtIndex:indexPath.row];
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        IosTestDetailVC *viewController = [[IosTestDetailVC alloc]initWithNibName:@"IosTestDetailVC" bundle:nil];
        
        NSArray *files = [Files MR_findAllSortedBy:@"status" ascending:YES];
       
            
        [viewController setMyFilesDetails:files];

        [self.navigationController pushViewController:viewController animated:YES];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    } else {
        
        IosTestDetailVC *viewController = [[IosTestDetailVC alloc]initWithNibName:@"IosTestDetailVC_iPad" bundle:nil];
        
        NSArray *files = [Files MR_findAllSortedBy:@"status" ascending:YES];
        
        [viewController setMyFilesDetails:files];
        
        [self.navigationController pushViewController:viewController animated:YES];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    
}

@end
