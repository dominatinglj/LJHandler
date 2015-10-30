//
//  LJActionSheetHandler.h
//  AlertControllerDemo
//
//  Created by 廖军 on 15/10/29.
//  Copyright © 2015年 com.qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;

typedef void(^LJActionSheetBlock)(NSInteger index);

@interface LJActionSheetHandler : NSObject

@property (nonatomic,strong,readonly) LJActionSheetBlock completion;

+ (instancetype)defaultHandler;

- (void)showActionSheetInViewController:(UIViewController *)vc
                                  title:(NSString *)title
                            cancelTitle:(NSString *)cancelTitle
                          destructTitle:(NSString *)destructTitle
                            otherTitles:(NSArray *)otherTitles
                             completion:(LJActionSheetBlock)completion;

@end
