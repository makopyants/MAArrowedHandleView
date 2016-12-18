//
//  MAArrowedHandleView.h
//  Pods
//
//  Created by Michael Akopyants on 18/12/2016.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MAHandleDisplayMode){
    MAHandleDisplayModeHorizontalLine   = 0,
    MAHandleDisplayModeArrowDown        = 1,
    MAHandleDisplayModeArrowUp          = 2,
    MAHandleDisplayModeVerticalLine     = 3,
    MAHandleDisplayModeArrowLeft        = 4,
    MAHandleDisplayModeArrowRight       = 5
};

IB_DESIGNABLE
@interface MAArrowedHandleView : UIView
#if TARGET_INTERFACE_BUILDER
@property (nonatomic) IBInspectable NSUInteger mode;
#else
@property (nonatomic) MAHandleDisplayMode mode;
#endif

@property (nonatomic) IBInspectable CGFloat height;
@property (nonatomic) IBInspectable UIColor * color;


@end
