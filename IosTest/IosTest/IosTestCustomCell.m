//
//  IosTestCustomCell.m
//  IosTest
//
//  Created by Lorenzo Jose on 2/25/13.
//  Copyright (c) 2013 Lorenzo Jose. All rights reserved.
//

#import "IosTestCustomCell.h"

@implementation IosTestCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
