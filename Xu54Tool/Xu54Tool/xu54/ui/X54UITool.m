//
//  X54UITool.m
//  Face54
//
//  Created by xu54 on 16/6/11.
//  Copyright © 2016年 xu54. All rights reserved.
//

#import "X54UITool.h"

#import "X54Tool.h"
static UIColor*     _g_alertVCNormalActionColor = nil;
static UIColor*     _g_alertVCCancelActionColor = nil;
static UIFont*      _g_alertVCFont = nil;
//#import "X54AlertController.h"

@implementation UIView(X54UITool)

#pragma mark --convenient access of position and size
-(void)setX:(CGFloat)x
{
    CGRect rt = self.frame;
    rt.origin.x = x;
    self.frame = rt;
}

-(void)setY:(CGFloat)y
{
    CGRect rt = self.frame;
    rt.origin.y = y;
    self.frame = rt;
}


-(void)setWidth:(CGFloat)w
{
    CGRect rt = self.frame;
    rt.size.width = w;
    self.frame = rt;
}


-(void)setHeight:(CGFloat)h
{
    CGRect rt = self.frame;
    rt.size.height = h;
    self.frame = rt;
}

-(void)setPosition:(CGPoint)pt
{
    CGRect rt = self.frame;
    rt.origin = pt;
    self.frame = rt;
}
-(void)setPositionWithX:(CGFloat)x y:(CGFloat)y
{
    CGRect rt = self.frame;
    rt.origin = CGPointMake(x, y);
    self.frame = rt;
}

-(void)setSize:(CGSize)sz
{
    CGRect rt = self.frame;
    rt.size = sz;
    self.frame = rt;
}

-(void)setSizeWithWidth:(CGFloat)w height:(CGFloat)h
{
    CGRect rt = self.frame;
    rt.size = CGSizeMake(w, h);
    self.frame = rt;
}

-(float)x
{
    return self.frame.origin.x;
}
-(float)y
{
    return self.frame.origin.y;
}
-(float)width
{
    return self.frame.size.width;
}
-(float)height
{
    return self.frame.size.height;
}

_chain_set_impl(UIView, float, x, self.x )
_chain_set_impl(UIView, float, y, self.y )
_chain_set_impl(UIView, float, width, self.width)
_chain_set_impl(UIView, float, height, self.height)
@end

@implementation UIViewController(X54UITool)
-(void)showCameraPickerWithButtonBlock:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock
{
    [self showCameraPickerWithCameraTitle:@"拍照" albumTitle:@"照片图库" cancelTitle:@"取消" ButtonBlock:handlerBlock];
}

-(void)showCameraPickerWithCameraTitle:(NSString*)cTitle albumTitle:(NSString*)aTitle cancelTitle:(NSString*)cancelTitle ButtonBlock:(void (^)(NSInteger, NSString *,BOOL isCancelBtn))handlerBlock
{
    [self showActionSheetWithTitle:nil  buttonTitles:@[cTitle,aTitle] cancelButtonTitle:cancelTitle buttonHandler:handlerBlock];
}

-(void)showActionSheetWithTitle:(NSString*)title buttonTitles:(NSArray<NSString*>*)titles buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle)) handlerBlock
{
    [self showActionSheetWithTitle:title buttonTitles:titles cancelButtonTitle:nil buttonHandler:^(NSInteger btnIndex, NSString *btnTitle, BOOL isCancelBtn) {
        handlerBlock( btnIndex, btnTitle );
    }];
}

-(void)showActionSheetWithTitle:(NSString*)title buttonTitles:(NSArray<NSString*>*)titles cancelButtonTitle:(NSString*)cancelTitle buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock
{
    [self showAlertVCWithTitle:title content:nil style:UIAlertControllerStyleActionSheet buttonTitles:titles cancelButtonTitle:cancelTitle
                 buttonHandler:handlerBlock ];
}

-(void)showAlertWithTitle:(NSString*)title content:(NSString*)content buttonTitles:(NSArray<NSString*>*)titles cancelButtonTitle:(NSString*)cancelTitle buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock
{
    [self showAlertVCWithTitle:title content:content style:UIAlertControllerStyleAlert buttonTitles:titles cancelButtonTitle:cancelTitle
                 buttonHandler:handlerBlock ];
}
-(void)showAlertVCWithTitle:(NSString*)title content:(NSString*)content style:(UIAlertControllerStyle) style buttonTitles:(NSArray<NSString*>*)titles cancelButtonTitle:(NSString*)cancelTitle buttonHandler:(void(^)(NSInteger btnIndex,NSString* btnTitle,BOOL isCancelBtn)) handlerBlock
{
 
    UIAlertController* avc = [UIAlertController alertControllerWithTitle:title message:content
                                                          preferredStyle:style];

    NSInteger index = 0;
    for (NSString* str in titles) {
        UIAlertAction* action = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * _Nonnull action) {
            handlerBlock( index, str , NO );
            
        }];
        [avc addAction:action];

    }
    
    if( cancelTitle )
    {
        UIAlertAction* action = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            handlerBlock( titles.count , cancelTitle, YES );
        }];
        [avc addAction:action];
    }

    
    [self presentViewController:avc animated:YES completion:^{
        
    }];
    
}

@end



@implementation X54UITool
+(void)setAlertVCFont:(UIFont*)font
{
    _g_alertVCFont = font;
}
+(void)setAlertVCNormalActionTextColor:(UIColor*)clr
{
    _g_alertVCNormalActionColor = clr;
}
+(void)setAlertVCCancelActionTextColor:(UIColor*)clr
{
    _g_alertVCCancelActionColor = clr;
}
+(UIFont*)alertVCFont
{
    return _g_alertVCFont;
}
+(UIColor*)alertVCNormalActionTextColor
{
    return _g_alertVCNormalActionColor;
}
+(UIColor*)alertVCCancelActionTextColor
{
    return _g_alertVCCancelActionColor;
}


+(void)enumateAllSubViewsOf:(UIView*)targetView handleBlock:(void(^)(UIView* view)) block
{
    for (UIView* subView in targetView.subviews) {
        [self enumateAllSubViewsOf:subView handleBlock:block];
        block(subView);
    }
}
@end
