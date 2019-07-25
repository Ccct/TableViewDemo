//
//  CustomCell.m
//  tableDemo
//
//  Created by RLY on 2019/5/10.
//  Copyright © 2019 demo. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

/// 初始化cell时 第一调用
+ (void)initialize
{
    if (self == [CustomCell class]) {
        
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSLog(@"载入cell完成");
    }
    return self;
}

/// controller中如果通过 cell = [[CustomCell4 alloc]init];  来初始化
/// 那就会走这里，然后走 initWithStyle ，但因为这个方法已废弃，就尽量不用 Frame is ignored. The size will be specified by the table view width and row height.
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//
//    }
//    return self;
//}

//被复用之前调用
- (void)prepareForReuse{
    [super prepareForReuse];
    NSLog(@"复用");
}



//布局（布局代码不要写在这里面，因为每当cell绘制时都会走此方法）
//- (void)layoutSubviews{
//    [super layoutSubviews];
//}

+ (NSString *)reuseIdentifier {
    static NSString *reuseIdentifier;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reuseIdentifier = NSStringFromClass([self class]);
    });
    return reuseIdentifier;
}

@end
