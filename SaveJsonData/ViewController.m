//
//  ViewController.m
//  SaveJsonData
//
//  Created by 范磊 on 2020/7/24.
//  Copyright © 2020 范磊. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import "SaveJsonDataAndShare.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.saveBtn setTitle:@"分享啊" forState:UIControlStateSelected];
    // Do any additional setup after loading the view.
}
- (IBAction)saveBtnClick:(id)sender {
    self.saveBtn.selected = !self.saveBtn.isSelected;
    NSDictionary* jsonDic = @{@"hahah":@"111",
                              @"haoip":@"333",
                              @"ninind":@"444",
                              @"wwww":@"2323吼吼欧皇2",
                              @"wttttt":@"224928389"
    };
    
    if (self.saveBtn.isSelected) {
        [[SaveJsonDataAndShare shareInstance] OpenTheShareViewJsonDic:jsonDic andTitle:@"" andIsSave:YES];
    }else{
        [[SaveJsonDataAndShare shareInstance] OpenTheShareViewJsonDic:jsonDic andTitle:@"" andIsSave:NO];
    }
    
}

@end
