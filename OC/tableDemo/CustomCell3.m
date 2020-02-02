//
//  CustomCell3.m
//  tableDemo
//
//  Created by RLY on 2019/5/10.
//  Copyright © 2019 demo. All rights reserved.
//

#import "CustomCell3.h"

@implementation CustomCell3

/// 初始化cell时 第一调用
+ (void)initialize{

    if (self == [CustomCell3 class]) {

    }
}

/// 通过xib载入cell 第二调用
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        // 如果 controller 写了 ：
        // cell =  [[[NSBundle mainBundle] loadNibNamed:@"CustomCell3" owner:self options:nil] firstObject];
        // [[[UINib nibWithNibName:@"CustomCell3" bundle:nil] instantiateWithOwner:self options:nil] firstObject];
        // 下面这句就可以不要
        self = [[[NSBundle mainBundle] loadNibNamed:@"CustomCell3" owner:self options:nil] firstObject];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        NSLog(@"载入cell完成");
    }
    return self;
}

+(instancetype)getCellWithTable:(UITableView *)tableView{
    
    CustomCell3 *cell = [tableView dequeueReusableCellWithIdentifier:[CustomCell3 reuseIdentifier]];
    //如果不先注册cell，则要写这些：
    if(!cell){
        NSLog(@"没有cell，开始载入cell");
        cell = [[CustomCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CustomCell3 reuseIdentifier]];
    }
    return cell;
}

/// controller中如果通过 cell = [[CustomCell4 alloc]init];  来初始化
/// 那就会走这里，然后走 initWithStyle ，但因为这个方法已废弃，就尽量不用 Frame is ignored. The size will be specified by the table view width and row height.
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//       // self =  [[[NSBundle mainBundle] loadNibNamed:@"CustomCell3" owner:self options:nil] firstObject];
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
    
}

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
