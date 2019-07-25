//
//  CustomHeadFootView.m
//  tableDemo
//
//  Created by RLY on 2019/5/10.
//  Copyright © 2019 demo. All rights reserved.
//

#import "CustomHeadFootView.h"

@implementation CustomHeadFootView

/// 初始化时，第一个调
+ (void)initialize{
    
    if (self == [CustomHeadFootView class]) {
        
    }
}

/// 第二个调
/// 如果controller 有注册：
/// [_tableView registerNib:[UINib nibWithNibName:@"CustomHeadFootView" bundle:nil] forHeaderFooterViewReuseIdentifier:[CustomHeadFootView reuseIdentifier]];
/// 那么不会走这里 
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomHeadFootView" owner:self options:nil] firstObject];
    }
    return self;
}

/// 第三个调
- (instancetype)initWithCoder:(NSCoder *)coder{
    
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

//被复用之前调用
- (void)prepareForReuse{
    [super prepareForReuse];
    NSLog(@"header复用");
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
