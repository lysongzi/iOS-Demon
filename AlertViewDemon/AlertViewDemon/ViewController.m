//
//  ViewController.m
//  AlertViewDemon
//
//  Created by lysongzi on 16/1/29.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAlertViewController:(id)sender
{
    //创建一个UIAlertController对象
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示框" message:@"AlertController实现的提示框" preferredStyle:UIAlertControllerStyleAlert];
    
    //创建一个确定按钮及其点击触发事件
    UIAlertAction *submit = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //这里是点击确定按钮的操作
        NSLog(@"点击确定按钮.");
    }];
    
    //创建一个取消按钮
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    //将创建的两个按钮添加到UIAlertController对象中
    [alert addAction:submit];
    [alert addAction:cancle];
    
    //显示弹窗
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)showSheetController:(id)sender
{
    //创建一个UIAlertController对象
    UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"提示框" message:@"AlertController实现的提示框2" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //创建一个确定按钮及其点击触发事件
    UIAlertAction *sheet1 = [UIAlertAction actionWithTitle:@"Sheet 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //这里是点击确定按钮的操作
        NSLog(@"Sheet 1.");
    }];
    
    UIAlertAction *sheet2 = [UIAlertAction actionWithTitle:@"Sheet 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //这里是点击确定按钮的操作
        NSLog(@"Sheet 2.");
    }];
    
    UIAlertAction *sheet3 = [UIAlertAction actionWithTitle:@"Sheet 3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //这里是点击确定按钮的操作
        NSLog(@"Sheet 3.");
    }];
    
    //创建一个取消按钮
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    //将创建的两个按钮添加到UIAlertController对象中
    [alert2 addAction:sheet1];
    [alert2 addAction:sheet2];
    [alert2 addAction:sheet3];
    [alert2 addAction:cancle];
    
    //显示弹窗
    [self presentViewController:alert2 animated:YES completion:nil];
}

- (IBAction)showAlertView:(id)sender
{
    //创建UIAlertView对象
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示框" message:@"AlertView" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //显示弹窗
    [alert show];
}

- (IBAction)showSheetView:(id)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"提示框" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"Sheet1" otherButtonTitles:@"Sheet2", nil];
    //显示弹窗
    [sheet showInView:self.view];
}


#pragma mark UIAlertViewDelegate委托实现

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"点击取消按钮.");
            break;
        
        case 1:
            NSLog(@"点击确定按钮.");
            break;
            
        default:
            break;
    }
}


#pragma mark UIAlertSheetDelegate委托实现

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 2:
            NSLog(@"取消");
            break;
        
        case 0:
            NSLog(@"Sheet1");
            break;
        
        case 1:
            NSLog(@"Sheet2");
            break;
            
        default:
            break;
    }
}

@end
