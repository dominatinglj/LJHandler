//
//  LJViewController.m
//  LJHandler
//
//  Created by jun_liao on 10/29/2015.
//  Copyright (c) 2015 jun_liao. All rights reserved.
//

#import "LJViewController.h"
#import <LJHandler/LJHandler.h>

@interface LJViewController ()

@end

@implementation LJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [button setTitle:@"显示" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClicked:(id)sender {
    [[LJImagePickerHandler defaultHandler] showActionSheetPickerInViewController:self allowsEditing:YES completion:^(UIImage *image, BOOL cancelled) {
        
    }];
    //    [[LJActionSheetHandler defaultHandler] showActionSheetInViewController:self
    //                                                                     title:@"性别"
    //                                                               cancelTitle:@"取消"
    //                                                             destructTitle:nil
    //                                                               otherTitles:@[@"男",@"女"]
    //                                                                completion:^(NSInteger index) {
    //
    //    }];
    //    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleActionSheet];
    //
    //    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    //
    //        // Cancel button tappped.
    //        [self dismissViewControllerAnimated:YES completion:^{
    //        }];
    //    }]];
    //
    //    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
    //
    //        // Distructive button tapped.
    //        [self dismissViewControllerAnimated:YES completion:^{
    //        }];
    //    }]];
    //
    //    [actionSheet addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    //
    //        // OK button tapped.
    //
    //        [self dismissViewControllerAnimated:YES completion:^{
    //        }];
    //    }]];
    //    
    //    // Present action sheet.
    //    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end
