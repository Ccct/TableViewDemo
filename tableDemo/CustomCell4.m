//
//  CustomCell4.m
//  tableDemo
//
//  Created by RLY on 2019/5/10.
//  Copyright © 2019 demo. All rights reserved.
//

#import "CustomCell4.h"

@implementation CustomCell4

/// 初始化cell时 第一调用
+ (void)initialize{
    
    if (self == [CustomCell4 class]) {
        
    }
}

/// 通过xib载入cell 如果 先在控制器注册了 ：registerNib，并且 dequeueReusableCellWithIdentifier: forIndexPath: 用这个载入cell， 就不调用这里
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//
//    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
//
//        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomCell4" owner:self options:nil] firstObject];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        NSLog(@"载入cell完成");
//    }
//    return self;
//}

/// 通过xib载入cell 第三调用
/// 把 cell 解码出来。比如之前曾把cell压缩存在文件里，现在要把它还原出来。解压出来的cell的属性都是之前存起来的。
- (instancetype)initWithCoder:(NSCoder *)coder{
    
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

/// 通过xib载入cell 第四调用
/// 创建cell时会先调initWithCoder，再调awakeFromNib。但由于调initWithCoder时引出的一些子view可能为nil，所以实际操作中一般把初始化放在awakeFromNib里。
- (void)awakeFromNib{
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

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
