//
//  SaveJsonDataAndShare.m
//  SaveJsonData
//
//  Created by 范磊 on 2020/7/24.
//  Copyright © 2020 范磊. All rights reserved.
//

#import "SaveJsonDataAndShare.h"

@implementation SaveJsonDataAndShare
static SaveJsonDataAndShare *_instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    return _instance ;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [SaveJsonDataAndShare shareInstance] ;
}

- (id)copyWithZone:(struct _NSZone *)zone {
    return [SaveJsonDataAndShare shareInstance] ;
}

- (void)OpenTheShareViewJsonDic:(NSDictionary *)jsonDic andTitle:(NSString *)titleStr andIsSave:(BOOL)isSave{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *temp = NSTemporaryDirectory();
    NSString* docPath = [temp stringByAppendingPathComponent:@"SaveJsonFile.txt"];//json
    
    if (isSave) {
        if ([NSJSONSerialization isValidJSONObject:jsonDic]) {
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:1 error:nil];
            [manager createFileAtPath:docPath contents:jsonData attributes:nil];
        }
    }else{
        
        NSURL* jsonUrl = [NSURL fileURLWithPath:docPath];
        NSArray * fileList = @[jsonUrl,titleStr];
        
        UIActivityViewController* activeVc = [[UIActivityViewController alloc]initWithActivityItems:fileList applicationActivities:nil];
        //不出现在下列项目中
        activeVc.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
        UIWindow* window = nil;
        
        if (@available(iOS 13.0, *))
        {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
            {
                if (windowScene.activationState == UISceneActivationStateForegroundActive)
                {
                    window = windowScene.windows.lastObject;
                    
                    break;
                }
            }
        }else{
            window = [UIApplication sharedApplication].keyWindow;
        }
        
        
        [window.rootViewController presentViewController:activeVc animated:YES completion:nil];
        // 分享之后的回调
        activeVc.completionWithItemsHandler = ^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
            if (completed) {
                NSLog(@"completed");
                //分享 成功
            } else  {
                NSLog(@"cancled");
                //分享 取消
            }
        };
    }
}
//判断是否为文件
- (BOOL)isExistsAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
    
    
}
@end
