//
//  MAArrowedHandleView.m
//  Pods
//
//  Created by Michael Akopyants on 18/12/2016.
//
//

#import "MAArrowedHandleView.h"
static NSUInteger kDisplayModeMax = MAHandleDisplayModeArrowRight;
static const CGFloat kMod = 1.0f/3.0f;
@interface MAArrowedHandleView ()

@property (strong, nonatomic) CAShapeLayer * shapeLayer;

@end

@implementation MAArrowedHandleView


- (void)setMode:(MAHandleDisplayMode)mode
{
    
    _mode = mode;
    if (_mode > kDisplayModeMax)
    {
        _mode = 0;
    }
    
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue = (id)self.shapeLayer.path;
    switch (_mode)
    {
        case MAHandleDisplayModeHorizontalLine:
            self.shapeLayer.path = [self pathForHorizontalLineStyle].CGPath;
            break;
        case MAHandleDisplayModeArrowDown:
            self.shapeLayer.path = [self pathForArrowDownStyle].CGPath;
            break;
        case MAHandleDisplayModeArrowUp:
            self.shapeLayer.path = [self pathForArrowUpStyle].CGPath;
            break;
        case MAHandleDisplayModeVerticalLine:
            self.shapeLayer.path = [self pathForVerticalLineStyle].CGPath;
            break;
        case MAHandleDisplayModeArrowLeft:
            self.shapeLayer.path = [self pathForArrowLeftStyle].CGPath;
            break;
        case MAHandleDisplayModeArrowRight:
            self.shapeLayer.path = [self pathForArrowRightStyle].CGPath;
            break;
        default:
            break;
    }
    animation.toValue = (id)self.shapeLayer.path;
    animation.duration = .2f;
    [self.shapeLayer addAnimation:animation forKey:@"path"];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    self.shapeLayer.strokeColor = color.CGColor;
}

-(void)setHeight:(CGFloat)height
{
    _height = height;
    self.shapeLayer.lineWidth = height;
}
#pragma mark Init
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialSetup];
    }
    
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initialSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialSetup];
    }
    
    return self;
}

- (void)initialSetup
{
    
    self.mode = MAHandleDisplayModeHorizontalLine;
    
    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.lineJoin = kCALineJoinRound;
    
    self.shapeLayer = shapeLayer;
    [self.layer addSublayer:self.shapeLayer];
    self.height = 5.0f;
    self.color = [UIColor colorWithWhite:0.0f alpha:0.45];
}

#pragma mark Paths

- (CGFloat)centerCoordY
{
    return CGRectGetHeight(self.bounds)*0.5f;
}

- (CGFloat)centerCoordX
{
    return CGRectGetWidth(self.bounds)*0.5f;
}

#pragma mark Horizontal

- (UIBezierPath*)pathForHorizontalLineStyle
{
    CGPoint p0 = CGPointMake(0, [self centerCoordY]);
    
    CGPoint p1 = CGPointMake([self centerCoordX], [self centerCoordY]);
    CGPoint p2 = CGPointMake(CGRectGetWidth(self.bounds), [self centerCoordY]);
    
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:p0];
    [path addLineToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p1];
    
    [path closePath];
    return path;
}

- (UIBezierPath*)pathForArrowDownStyle
{
    CGPoint p0 = CGPointMake(0, [self centerCoordY] - [self centerCoordY]*kMod);
    CGPoint p1 = CGPointMake([self centerCoordX], [self centerCoordY] + [self centerCoordY]*kMod);
    CGPoint p2 = CGPointMake(CGRectGetWidth(self.bounds), p0.y);
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:p0];
    [path addLineToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p1];
    [path closePath];
    return path;
}

- (UIBezierPath*)pathForArrowUpStyle
{
    
    CGPoint p0 = CGPointMake(0,[self centerCoordY] + [self centerCoordY]*kMod);
    CGPoint p1 = CGPointMake([self centerCoordX], [self centerCoordY] - [self centerCoordY]*kMod);
    CGPoint p2 = CGPointMake(CGRectGetWidth(self.bounds), p0.y);
    UIBezierPath * path = [[UIBezierPath alloc] init];
    [path moveToPoint:p0];
    [path addLineToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p1];
    
    [path closePath];
    return path;
}

#pragma mark Vertical

- (UIBezierPath*)pathForVerticalLineStyle
{
    CGPoint p0 = CGPointMake([self centerCoordX], 0);
    CGPoint p1 = CGPointMake([self centerCoordX], [self centerCoordY]);
    CGPoint p2 = CGPointMake([self centerCoordX], CGRectGetHeight(self.bounds));
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:p0];
    [path addLineToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p1];
    [path closePath];
    
    return path;
    
}

- (UIBezierPath*)pathForArrowLeftStyle
{
    CGPoint p0 = CGPointMake([self centerCoordX] + [self centerCoordX]*kMod, 0);
    CGPoint p1 = CGPointMake([self centerCoordX] - [self centerCoordX]*kMod, [self centerCoordY]);
    CGPoint p2 = CGPointMake(p0.x, CGRectGetHeight(self.bounds));
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:p0];
    [path addLineToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p1];
    [path closePath];
    
    return path;
}

- (UIBezierPath*)pathForArrowRightStyle
{
    CGPoint p0 = CGPointMake([self centerCoordX] - [self centerCoordX]*kMod, 0);
    CGPoint p1 = CGPointMake([self centerCoordX] + [self centerCoordX]*kMod, [self centerCoordY]);
    CGPoint p2 = CGPointMake(p0.x, CGRectGetHeight(self.bounds));
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    
    [path moveToPoint:p0];
    [path addLineToPoint:p1];
    [path addLineToPoint:p2];
    [path addLineToPoint:p1];
    [path closePath];
    
    return path;
}




@end
