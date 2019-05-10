//
//  CustomCell2.m
//  tableDemo
//
//  Created by RLY on 2019/5/10.
//  Copyright © 2019 demo. All rights reserved.
//

#import "CustomCell2.h"

@implementation CustomCell2

/// 初始化cell时 第一调用
+ (void)initialize
{
    if (self == [CustomCell2 class]) {
        
    }
}

/// 这种已经被划掉了，没用 Frame is ignored. The size will be specified by the table view width and row height.
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




//布局
- (void)layoutSubviews{
    [super layoutSubviews];
}

+ (NSString *)reuseIdentifier {
    static NSString *reuseIdentifier;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        reuseIdentifier = NSStringFromClass([self class]);
    });
    return reuseIdentifier;
}

@end
