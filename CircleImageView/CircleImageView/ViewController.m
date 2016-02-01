//
//  ViewController.m
//  CircleImageView
//
//  Created by lysongzi on 16/2/1.
//  Copyright © 2016年 lysongzi. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self changeToCirclePicture];
}

#pragma mark - 图像处理

//截取居中的方形图像
- (UIImage *)cutPicture:(UIImage *)raw
{
    CGSize origImageSize = raw.size;
    CGRect newRect = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH);
    
    float ratio = MAX(newRect.size.width / origImageSize.width, newRect.size.height / origImageSize.height);
    
    //创建透明位图上下文
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    //创建圆角矩形的对象
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:0.0];
    //裁剪图形上下文
    [path addClip];
    
    //让图片在缩略图绘制范围内居中
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    //在上下文中绘制图片
    [raw drawInRect:projectRect];
    
    //从上下文获取图片，并复制给item
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //清理图形上下文
    UIGraphicsEndImageContext();
    
    return smallImage;
}

//设置图像显示控件为圆形
- (void)changeToCirclePicture
{
    //设置圆角半径为方形边长一半
    [self.imageView.layer setCornerRadius:CGRectGetHeight([self.imageView bounds]) / 2];
    [self.imageView.layer setMasksToBounds:YES];
    
    //设置边框宽度和颜色
    [self.imageView.layer setBorderWidth:10];
    [self.imageView.layer setBorderColor:[[UIColor grayColor] CGColor]];
}

#pragma mark - 选择图片

- (IBAction)alertToChoosePicture:(id)sender
{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertView addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self choosePicture:UIImagePickerControllerSourceTypeCamera];
    }]];
    
    [alertView addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self choosePicture:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    
    [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)choosePicture:(UIImagePickerControllerSourceType)type
{
    if (!self.imagePickerController) {
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.editing = YES;
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:type]) {
        self.imagePickerController.sourceType = type;
    }
    else {
        return;
    }
    
    self.imagePickerController.delegate = self;
    self.imagePickerController.allowsEditing = YES;
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate 协议的实现

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
