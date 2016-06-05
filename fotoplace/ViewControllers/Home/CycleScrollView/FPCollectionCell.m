//
//  FPCollectionCell.m
//  fotoplace
//
//  Created by MBP on 16/5/25.
//  Copyright © 2016年 MBP. All rights reserved.
//

#import "FPCollectionCell.h"
#import "UIImageView+WebCache.h"


@implementation FPCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
  
    
}


- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        if (self) {
            NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"FPCollectionCell" owner:self options:nil];
            
            // 如果路径不存在，return nil
            if (arrayOfViews.count < 1)
            {
                return nil;
            }
            // 如果xib中view不属于UICollectionViewCell类，return nil
            if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
            {
                return nil;
            }
            // 加载nib
            self = [arrayOfViews objectAtIndex:0];
        }
        

        
    
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    

}

@end
