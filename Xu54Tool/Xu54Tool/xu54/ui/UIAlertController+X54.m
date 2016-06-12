//
//  X54AlertController.m
//  Face54
//
//  Created by xu54 on 16/6/11.
//  Copyright © 2016年 xu54. All rights reserved.
//

#import "UIAlertController+X54.h"
#import "X54UITool.h"


@implementation UIAlertController(X54)

/*
 //不可以覆盖，否则会造成cancel按钮布局问题
- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}
*/


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
  
    if( [X54UITool alertVCCancelActionTextColor])
        [[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[X54UITool alertVCCancelActionTextColor]];
    
    __block UIView* vc = nil;
    CGRect rt;
    [X54UITool enumateAllSubViewsOf:self.view handleBlock:^(UIView *view) {
        if( [view isKindOfClass:[UILabel class] ] )
        {
            UILabel* lb = (UILabel*)view;
            if( [X54UITool alertVCFont])
                ((UILabel*)view).font = [X54UITool alertVCFont];
            if( [X54UITool alertVCNormalActionTextColor])
                lb.textColor = [X54UITool alertVCNormalActionTextColor];
            CGRect rt = lb.frame;
            rt.origin.x -= 20;
            rt.size.width = 900;
            rt.size.height = 30;
            
            vc = lb.superview.superview.superview;
        }
        
        
    }];
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
  
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
