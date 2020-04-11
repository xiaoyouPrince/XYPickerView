//
//  ViewController.m
//  XYPickerView
//
//  Created by 渠晓友 on 2020/4/11.
//  Copyright © 2020 渠晓友. All rights reserved.
//

#import "ViewController.h"
#import "XYPickerView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *codeLabel;
@end
@implementation ViewController


- (IBAction)chooseType:(UIButton *)sender {
    
    [XYPickerView showPickerWithConfig:^(XYPickerView * _Nonnull picker) {
       
        picker.dataArray = [self relationShipArray];
        picker.title = sender.currentTitle;
        picker.defaultSelectedItemTitle = self.resultLabel.text;
        
    } result:^(XYPickerViewItem * _Nonnull selectedItem) {
        NSLog(@"选择完成，结果为:%@",selectedItem);
        self.resultLabel.text = selectedItem.title;
        self.codeLabel.text = [NSString stringWithFormat:@"code码：%@",selectedItem.code];
    }];
}

/// 用户关系类型
- (NSArray *)relationShipArray
{
    
    NSArray *array = @[
        @{
            @"title": @"父亲",
            @"code": @"1"
        },
        @{
            @"title": @"母亲",
            @"code": @"2"
        },
        @{
            @"title": @"夫/妻",
            @"code": @"3"
        },
        @{
            @"title": @"儿子",
            @"code": @"4"
        },
        @{
            @"title": @"女儿",
            @"code": @"5"
        },
    ];
    
    NSMutableArray *arrayM = @[].mutableCopy;
    for (NSDictionary *dict in array) {
        XYPickerViewItem *item = [XYPickerViewItem modelWithDict:dict];
        [arrayM addObject:item];
    }
    return arrayM;
}


@end
