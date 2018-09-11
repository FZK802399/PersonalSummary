//
//  CustomView.m
//
//  Code generated using QuartzCode 1.21 on 16/6/21.
//  www.quartzcodeapp.com
//

#import "CustomView.h"
#import "QCMethod.h"


@interface CustomView ()

@property (nonatomic, strong) CAShapeLayer *star;

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupLayers];
	}
	return self;
}


- (void)setupLayers{
	CAShapeLayer * star = [CAShapeLayer layer];
	star.frame       = CGRectMake(2.52, 12.68, 8.96, 10.55);
	star.fillColor   = [UIColor colorWithRed:0.922 green: 0.286 blue:0.252 alpha:1].CGColor;
	star.strokeColor = [UIColor colorWithRed:0.128 green: 0.329 blue:0.0474 alpha:1].CGColor;
	star.path        = [self starPath].CGPath;
	[self.layer addSublayer:star];
	_star = star;
	
	CAShapeLayer * rectangle = [CAShapeLayer layer];
	rectangle.frame       = CGRectMake(37.73, 39.47, 7.12, 6.96);
	rectangle.fillColor   = [UIColor colorWithRed:0.922 green: 0.922 blue:0.922 alpha:1].CGColor;
	rectangle.strokeColor = [UIColor colorWithRed:0.329 green: 0.329 blue:0.329 alpha:1].CGColor;
	rectangle.path        = [self rectanglePath].CGPath;
	[self.layer addSublayer:rectangle];
}


- (IBAction)startAllAnimations:(id)sender{
	[self.star addAnimation:[self starAnimation] forKey:@"starAnimation"];
}

- (CAAnimationGroup*)starAnimation{
	CABasicAnimation * f = [CABasicAnimation animationWithKeyPath:@"path"];
	f.toValue            = (id)[QCMethod alignToBottomPath:[self rectanglePath] layer:_star].CGPath;
	f.duration           = 1;
	f.timingFunction     = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
	
	CABasicAnimation * fillColorAnim = [CABasicAnimation animationWithKeyPath:@"fillColor"];
	fillColorAnim.toValue            = (id)[UIColor colorWithRed:0.922 green: 0.286 blue:0.252 alpha:1].CGColor;
	fillColorAnim.duration           = 1;
	
	CABasicAnimation * positionAnim = [CABasicAnimation animationWithKeyPath:@"position"];
	positionAnim.toValue            = [NSValue valueWithCGPoint:CGPointMake(7, 17.958)];
	positionAnim.duration           = 1;
	
	CAAnimationGroup *starAnimGroup   = [CAAnimationGroup animation];
	starAnimGroup.animations          = @[f, fillColorAnim, positionAnim];
	[starAnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
	starAnimGroup.fillMode            = kCAFillModeForwards;
	starAnimGroup.removedOnCompletion = NO;
	starAnimGroup.duration = [QCMethod maxDurationFromAnimations:starAnimGroup.animations];
	
	
	return starAnimGroup;
}

#pragma mark - Bezier Path

- (UIBezierPath*)starPath{
	UIBezierPath *starPath = [UIBezierPath bezierPath];
	[starPath moveToPoint:CGPointMake(2.623, 2.623)];
	[starPath addCurveToPoint:CGPointMake(1.489, 6.887) controlPoint1:CGPointMake(0.571, 2.987) controlPoint2:CGPointMake(-1.48, 3.351)];
	[starPath addCurveToPoint:CGPointMake(4.457, 9.522) controlPoint1:CGPointMake(1.138, 9.383) controlPoint2:CGPointMake(0.788, 11.879)];
	[starPath addCurveToPoint:CGPointMake(7.426, 6.887) controlPoint1:CGPointMake(6.292, 10.701) controlPoint2:CGPointMake(8.127, 11.879)];
	[starPath addCurveToPoint:CGPointMake(6.292, 2.623) controlPoint1:CGPointMake(8.91, 5.119) controlPoint2:CGPointMake(10.395, 3.351)];
	[starPath addCurveToPoint:CGPointMake(2.623, 2.623) controlPoint1:CGPointMake(5.375, 0.351) controlPoint2:CGPointMake(4.457, -1.92)];
	[starPath closePath];
	[starPath moveToPoint:CGPointMake(2.623, 2.623)];
	
	return starPath;
}

- (UIBezierPath*)rectanglePath{
	UIBezierPath*  rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 7, 7)];
	return rectanglePath;
}

@end