//
//  IosTestDetailVC.m
//  IosTest
//
//  Created by Lorenzo Jose on 2/25/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#import "IosTestDetailVC.h"
#import "IosTestCustomCell.h"
#import "Files.h"

@interface IosTestDetailVC ()

@end

@implementation IosTestDetailVC

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
    
    self.navigationItem.title = @"Detail Files";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    return [_myFilesDetails count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellId = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        static NSString *CellIdentifier = @"customCellIphone";
        
        IosTestCustomCell *cell = (IosTestCustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            NSArray *nib= [[NSBundle mainBundle] loadNibNamed:@"IosTestCustomCell_iphone" owner:self options:nil];
            cell = (IosTestCustomCell*)[nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        Files *files = [_myFilesDetails objectAtIndex:indexPath.row];
        
        int userID = [files.user_id intValue];
        int shareBy = [files.shared_by intValue];
        int parentID = [files.parent_id intValue];
        int itemID   = [files.item_id intValue];
        int shareLevel = [files.share_level intValue];
        int size  = [files.size intValue];
  
        
//        cell.labelOfDetail.text = [NSString stringWithFormat:@"Status is: %@,\n Is shared: %@,\n Share ID: %@,\n User ID: %@,\n Name: %@,\n Share by: %@,\n Share date: %@,\n Share Level: %@,\n Parent ID: %@,\n Last update date: %@,\n Last update by: %@,\n Link: %@,\n Create date: %@,\n Item ID: %@,\n Path: %@,\n Type: %@,\n Mime type: %@,\n Size: %@", [files objectForKey:@"status"],[files objectForKey:@"is_shared"],[files objectForKey:@"share_id"],[files objectForKey:@"user_id"],[files objectForKey:@"name"],[files objectForKey:@"shared_by"],[files objectForKey:@"shared_date"],[files objectForKey:@"share_level"],[files objectForKey:@"parent_id"],[files objectForKey:@"last_update_date"],[files objectForKey:@"last_update_by"],[files objectForKey:@"link"],[files objectForKey:@"created_date"],[files objectForKey:@"item_id"],[files objectForKey:@"path"],[files objectForKey:@"type"],[files objectForKey:@"mime_type"],[files objectForKey:@"size"]];
        
        cell.labelOfDetail.text = [NSString stringWithFormat:@"Status is: %@,\n Is shared: %@,\n Share ID: %@,\n User ID: %d,\n Name: %@,\n Share by: %d,\n Share date: %@,\n Share Level: %d,\n Parent ID: %d,\n Last update date: %@,\n Last update by: %@,\n Link: %@,\n Create date: %@,\n Item ID: %d,\n Path: %@,\n Type: %@,\n Mime type: %@,\n Size: %d", files.status,files.is_shared,files.share_id,userID,files.name,shareBy,files.shared_date,shareLevel,parentID,files.last_update_date,files.last_update_by,files.link,files.created_date,itemID,files.path,files.type,files.mime_type,size];
        
        return cell;
        
    } else {
        
        static NSString *CellIdentifier = @"customCellIpad";
        
        IosTestCustomCell *cell = (IosTestCustomCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            NSArray *nib= [[NSBundle mainBundle] loadNibNamed:@"IosTestCustumCell_iPad" owner:self options:nil];
            cell = (IosTestCustomCell*)[nib objectAtIndex:0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }

        Files *files = [_myFilesDetails objectAtIndex:indexPath.row];
        
        int userID = [files.user_id intValue];
        int shareBy = [files.shared_by intValue];
        int parentID = [files.parent_id intValue];
        int itemID   = [files.item_id intValue];
        int shareLevel = [files.share_level intValue];
        int size  = [files.size intValue];
        
        cell.labelOfDetail.text = [NSString stringWithFormat:@"Status is: %@,\n Is shared: %@,\n Share ID: %@,\n User ID: %d,\n Name: %@,\n Share by: %d,\n Share date: %@,\n Share Level: %d,\n Parent ID: %d,\n Last update date: %@,\n Last update by: %@,\n Link: %@,\n Create date: %@,\n Item ID: %d,\n Path: %@,\n Type: %@,\n Mime type: %@,\n Size: %d", files.status,files.is_shared,files.share_id,userID,files.name,shareBy,files.shared_date,shareLevel,parentID,files.last_update_date,files.last_update_by,files.link,files.created_date,itemID,files.path,files.type,files.mime_type,size];
        
        return cell;
        
    }
    
    return cell;
    
    
    
}



@end
