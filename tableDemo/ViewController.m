//
//  ViewController.m
//  tableDemo
//
//  Created by RLY on 2019/5/10.
//  Copyright © 2019 demo. All rights reserved.
//

#define WIDTH_SCREEN        [UIScreen mainScreen].bounds.size.width
#define HEIGHT_SCREEN       [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "CustomCell.h"
#import "CustomCell2.h"
#import "CustomCell3.h"
#import "CustomCell4.h"
#import "CustomHeadFootView.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (UITableView*)tableView{
    if(!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN) style:UITableViewStyleGrouped];
        _tableView.backgroundColor =[UIColor whiteColor];
        _tableView.delegate   =self;
        _tableView.dataSource =self;
        //注册cell
//        [_tableView registerClass:[CustomCell2 class] forCellReuseIdentifier:[CustomCell2 reuseIdentifier]];
//        [_tableView registerNib:[UINib nibWithNibName:@"CustomCell3" bundle:nil] forCellReuseIdentifier:[CustomCell3 reuseIdentifier]];
        [_tableView registerNib:[UINib nibWithNibName:@"CustomCell4" bundle:nil] forCellReuseIdentifier:[CustomCell4 reuseIdentifier]];
        //注册headerfooter
        [_tableView registerNib:[UINib nibWithNibName:@"CustomHeadFootView" bundle:nil] forHeaderFooterViewReuseIdentifier:[CustomHeadFootView reuseIdentifier]];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 第一种写法
    /*CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:[CustomCell reuseIdentifier]];
    if(!cell){
        ///  UITableViewCellStyleDefault   左边一张图，一个标题
        ///  UITableViewCellStyleValue1    左边一张图 一个主题，右边副主题
        ///  UITableViewCellStyleValue2    一个主题 一个副主题
        ///  UITableViewCellStyleSubtitle  左边一张图，一个主题，一个副主题（副主题在主题下面）
     
        NSLog(@"没有cell，开始载入cell");
        //cell = [[CustomCell alloc]init]; //不要这样写，没有复用
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CustomCell reuseIdentifier]];
    }*/
    
    
    // 第二种写法 （墙裂推荐）
    // 首先在tableview注册cell:
    // [_tableView registerClass:[CustomCell2 class] forCellReuseIdentifier:[CustomCell2 reuseIdentifier]];
    // 搭配 dequeueReusableCellWithIdentifier:forIndexPath 使用，一定会返回cell，系统在默认没有cell可复用的时候会自动创建一个新的cell出来。
    //CustomCell2 *cell = [tableView dequeueReusableCellWithIdentifier:[CustomCell2 reuseIdentifier] forIndexPath:indexPath];


    // 第三种写法 - xib
    // 首先在tableview注册cell:
    // [_tableView registerNib:[UINib nibWithNibName:@"CustomCell3" bundle:nil] forCellReuseIdentifier:[CustomCell4 reuseIdentifier]];
    /*CustomCell3 *cell = [tableView dequeueReusableCellWithIdentifier:[CustomCell3 reuseIdentifier]];
    if(!cell){
        NSLog(@"没有cell，开始载入cell");
        cell = [[CustomCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[CustomCell3 reuseIdentifier]];
        //cell = [[[UINib nibWithNibName:@"CustomCell3" bundle:nil] instantiateWithOwner:self options:nil] firstObject]; //也可以
        //cell =  [[[NSBundle mainBundle] loadNibNamed:@"CustomCell3" owner:self options:nil] firstObject]; //也可以
        //cell = [[CustomCell4 alloc] init]; //也可以
    }*/
    
    
    // 第四种写法 - xib （墙裂推荐）
    // 首先在tableview注册cell:
    // [_tableView registerNib:[UINib nibWithNibName:@"CustomCell4" bundle:nil] forCellReuseIdentifier:[CustomCell4 reuseIdentifier]];
    CustomCell4 *cell = [tableView dequeueReusableCellWithIdentifier:[CustomCell4 reuseIdentifier] forIndexPath:indexPath];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    //第一种
    /*CustomHeadFootView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[CustomHeadFootView reuseIdentifier]];
    if (!headView) {
        headView = [[CustomHeadFootView alloc] initWithReuseIdentifier:[CustomHeadFootView reuseIdentifier]];
    }*/
    
    //第二种  （墙裂推荐）
    // 首先在tableview注册headerfooter:
    // [_tableView registerNib:[UINib nibWithNibName:@"CustomHeadFootView" bundle:nil] forHeaderFooterViewReuseIdentifier:[CustomHeadFootView reuseIdentifier]];
    CustomHeadFootView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[CustomHeadFootView reuseIdentifier]];
    
    return headView;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click");
}

@end
