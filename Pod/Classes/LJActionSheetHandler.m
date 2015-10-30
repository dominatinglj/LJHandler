//
//  LJActionSheetHandler.m
//  AlertControllerDemo
//
//  Created by 廖军 on 15/10/29.
//  Copyright © 2015年 com.qiang. All rights reserved.
//

#import "LJActionSheetHandler.h"
#import <UIKit/UIKit.h>

static LJActionSheetHandler *handler = nil;

typedef void(^AlertControllerHandler)(UIAlertAction *action);

@interface LJActionSheetHandler()<UIActionSheetDelegate>
{
    
}

@end

@implementation LJActionSheetHandler

+ (instancetype)defaultHandler {
    if (!handler) {
        handler = [[LJActionSheetHandler alloc] init];
    }
    return handler;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)showActionSheetInViewController:(UIViewController *)vc
                                  title:(NSString *)title
                            cancelTitle:(NSString *)cancelTitle
                          destructTitle:(NSString *)destructTitle
                            otherTitles:(NSArray *)otherTitles
                             completion:(LJActionSheetBlock)completion{
    
    _completion = completion;
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if (systemVersion < 8.0) {
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:title
                                                          delegate:self
                                                 cancelButtonTitle:nil
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:nil];

        for (NSString *otherTitle in otherTitles) {
            [sheet addButtonWithTitle:otherTitle];
        }

        if (destructTitle) {
            [sheet addButtonWithTitle:destructTitle];
            sheet.destructiveButtonIndex = sheet.numberOfButtons - 1;
        }
        if (cancelTitle) {
            [sheet addButtonWithTitle:cancelTitle];
            sheet.cancelButtonIndex = sheet.numberOfButtons - 1;
        }
        [sheet showInView:vc.view];
    } else {
        __weak typeof(self) wself = self;
        
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        for (NSInteger i = 0; i < (NSInteger)otherTitles.count; i++) {
            [actionSheet addAction:[UIAlertAction actionWithTitle:otherTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                wself.completion(i);
            }]];
            
        }
        
        if (destructTitle) {
            [actionSheet addAction:[UIAlertAction actionWithTitle:destructTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                wself.completion(otherTitles.count);
            }]];
        }
        
        if (cancelTitle) {
            [actionSheet addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                wself.completion(otherTitles.count+(destructTitle?0:1));
            }]];
        }
        
        // Present action sheet.
        [vc presentViewController:actionSheet animated:YES completion:nil];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (_completion) {
        _completion(buttonIndex);
    }
}

@end
