//
//  X54UITool.h
//  Face54
//
//  Created by xu54 on 16/6/11.
//  Copyright © 2016年 徐五四. All rights reserved.

//  ------------说明-------------------------
//  这个文件主要是为了一些常用的ui操作提供便利，主要功能有：
//  1:）对于view提供了直接改变位置和大小的方法，避免了反复对frame的CGRect操作
//  2:) 提供了更便利的弹出UIAlertController的方法，同时提供例如弹出相机和相簿选择对话框的便利方法

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "x54Global.h"

@interface UIView(X54UITool)
-(void)setX:(CGFloat)x;
-(void)setY:(CGFloat)y;
-(void)setWidth:(CGFloat)w;
-(void)setHeight:(CGFloat)h;
-(void)setPosition:(CGPoint)pt;
-(void)setPositionWithX:(CGFloat)x y:(CGFloat)y;
-(void)setSize:(CGSize)sz;
-(void)setSizeWithWidth:(CGFloat)w height:(CGFloat)h;
-(float)x;
-(float)y;
-(float)width;
-(float)height;
_chain_set_decl(UIView, float, x )
_chain_set_decl(UIView, float, y )
_chain_set_decl(UIView, float, width)
_chain_set_decl(UIView, float, height)
@end


@interface  UIViewController(X54UITool)


-(void)showCameraPickerWithButtonBlock:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock;
-(void)showCameraPickerWithCameraTitle:(NSString*)cTitle albumTitle:(NSString*)aTitle cancelTitle:(NSString*)cancelTitle ButtonBlock:(void (^)(NSInteger, NSString *,BOOL isCancelBtn))handlerBlock;
-(void)showActionSheetWithTitle:(NSString*)title buttonTitles:(NSArray<NSString*>*)titles buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle)) handlerBlock;
-(void)showActionSheetWithTitle:(NSString*)title buttonTitles:(NSArray<NSString*>*)titles cancelButtonTitle:(NSString*)cancelTitle buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock;
-(void)showAlertWithTitle:(NSString*)title content:(NSString*)content buttonTitles:(NSArray<NSString*>*)titles cancelButtonTitle:(NSString*)cancelTitle buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock;
-(void)showAlertVCWithTitle:(NSString*)title content:(NSString*)content style:(UIAlertControllerStyle) style buttonTitles:(NSArray<NSString*>*)titles cancelButtonTitle:(NSString*)cancelTitle buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock;

@end


@interface X54UITool : NSObject
+(void)setAlertVCFont:(UIFont*)font;
+(void)setAlertVCNormalActionTextColor:(UIColor*)clr;
+(void)setAlertVCCancelActionTextColor:(UIColor*)clr;
+(UIFont*)alertVCFont;
+(UIColor*)alertVCNormalActionTextColor;
+(UIColor*)alertVCCancelActionTextColor;

+(void)enumateAllSubViewsOf:(UIView*)targetView handleBlock:(void(^)(UIView* view)) block;

@end
