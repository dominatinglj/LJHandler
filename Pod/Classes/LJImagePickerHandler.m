//
//  LJImagePickerHandler.m
//  AlertControllerDemo
//
//  Created by 廖军 on 15/10/29.
//  Copyright © 2015年 com.qiang. All rights reserved.
//

#import "LJImagePickerHandler.h"
#import "LJActionSheetHandler.h"

static LJImagePickerHandler *handler = nil;

@interface LJImagePickerHandler()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
}

@end

@implementation LJImagePickerHandler

+ (instancetype) defaultHandler {
    if (!handler) {
        handler = [[LJImagePickerHandler alloc] init];
    }
    return handler;
}

- (void)dealloc {
    
}

- (void)showPickerInViewController:(UIViewController *)vc completion:(void (^)(UIImage *image,BOOL cancelled))completion {
//    [self showPickerInViewController:vc allowsEditing:NO completion:completion];
}

- (void)showPickerInViewController:(UIViewController *)vc
                     allowsEditing:(BOOL)allowsEditing
                        sourceType:(UIImagePickerControllerSourceType)sourceType
                        completion:(LJImagePickerBlock)completion {
    _completion = completion;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = sourceType;
    imagePicker.delegate = self;
    imagePicker.allowsEditing = allowsEditing;
    [vc presentViewController:imagePicker animated:YES completion:nil];
}

- (void)showActionSheetPickerInViewController:(UIViewController *)vc
                                allowsEditing:(BOOL)allowsEditing
                                   completion:(LJImagePickerBlock)completion {
    __weak typeof(self) wself = self;
    [[LJActionSheetHandler defaultHandler] showActionSheetInViewController:vc title:@"图片选择" cancelTitle:@"取消" destructTitle:nil otherTitles:@[@"拍照",@"从相册选择"] completion:^(NSInteger index) {
        if (index < 2) {
            [wself showPickerInViewController:vc
                               allowsEditing:allowsEditing
                                  sourceType:index?UIImagePickerControllerSourceTypePhotoLibrary:UIImagePickerControllerSourceTypeCamera
                                  completion:completion];
        }
    }];
}

#pragma mark - UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (!image) {
        image = info[UIImagePickerControllerOriginalImage];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (_completion) {
        _completion(image,NO);
        _completion = nil;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (_completion) {
        _completion(nil,YES);
        _completion = nil;
    }
}

@end
