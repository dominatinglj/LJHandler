//
//  LJImagePickerHandler.h
//  AlertControllerDemo
//
//  Created by 廖军 on 15/10/29.
//  Copyright © 2015年 com.qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LJImagePickerBlock)(UIImage *image,BOOL cancelled);

@interface LJImagePickerHandler : NSObject

@property (nonatomic,strong,readonly) LJImagePickerBlock completion;

+ (instancetype) defaultHandler;

- (void)showPickerInViewController:(UIViewController *)vc completion:(LJImagePickerBlock)completion;

- (void)showPickerInViewController:(UIViewController *)vc
                     allowsEditing:(BOOL)allowsEditing
                        sourceType:(UIImagePickerControllerSourceType)sourceType
                        completion:(LJImagePickerBlock)completion;

- (void)showActionSheetPickerInViewController:(UIViewController *)vc
                                allowsEditing:(BOOL)allowsEditing
                                   completion:(LJImagePickerBlock)completion;

@end
