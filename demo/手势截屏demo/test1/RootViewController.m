//
//  RootViewController.m
//  test1
//
//  Created by madao on 14-8-6.
//  Copyright (c) 2014年 焦子成. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    UIView *view;//手势矩形
    
}
@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2"]];
    
    //拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerTap:)];
    [self.view addGestureRecognizer:pan];
    

    
}

//拖拽手势
-(void)panGestureRecognizerTap:(UIPanGestureRecognizer *)pan
{
    static CGPoint firstPoint;
    if (pan.state == UIGestureRecognizerStateBegan) {//手势开始
//        firstPoint = [pan translationInView:self.view];
        firstPoint = [pan locationInView:self.view];
//        printf("firstPoint--> x:%f  y:%f\n",firstPoint.x,firstPoint.y);
    }
    if (pan.state == UIGestureRecognizerStateChanged) {//手势移动
//        CGPoint lastPoint = [pan translationInView:self.view];
        CGPoint lastPoint = [pan locationInView:self.view];
//        printf("lastPoint--> x:%f  y:%f\n",lastPoint.x,lastPoint.y);
        
        if (view == nil) {
            view = [[UIView alloc]init];
            view.backgroundColor = [UIColor blackColor];
            view.alpha = 0.5;
            [self.view addSubview:view];
        }
        view.frame = CGRectMake(firstPoint.x, firstPoint.y, abs(lastPoint.x - firstPoint.x), abs(lastPoint.y - firstPoint.y));
    }
    if (pan.state == UIGestureRecognizerStateEnded) {//手势结束
//        printf("viewFram >>>  x:%f  y:%f  W:%f  H:%f\n",view.frame.origin.x,view.frame.origin.y,view.frame.size.width,view.frame.size.height);
        CGRect rect = view.frame;
        printf("rect >>  x:%f  y:%f  W:%f  H:%f\n",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
        [view removeFromSuperview];
        view = nil;
        
        //截屏
        shotScreenModel *shotModel = [[shotScreenModel alloc]init];
        [shotModel imageFromView:self.view atFrame:rect andDelegate:self];
//        [shotModel imageFromView:<#(UIView *)#> atFrame:<#(CGRect)#> andDelegate:<#(id<passImageDelegate>)#>]
    }
}


#pragma mark - passImageDelegate
-(void)passImage:(UIImage *)image
{
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
}

@end
