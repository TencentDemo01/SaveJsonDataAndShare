//
//  SaveJsonDataAndShare.h
//  SaveJsonData
//
//  Created by 范磊 on 2020/7/24.
//  Copyright © 2020 范磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SaveJsonDataAndShare : NSObject

+ (instancetype) shareInstance;

- (void)OpenTheShareViewJsonDic:(NSDictionary*)jsonDic andTitle:(NSString*)titleStr andIsSave:(BOOL)isSave;

@end

NS_ASSUME_NONNULL_END
