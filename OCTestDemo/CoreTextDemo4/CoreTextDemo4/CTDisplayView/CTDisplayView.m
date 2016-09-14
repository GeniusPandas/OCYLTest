//
//  CTDisplayView.m
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

// 显示视图

#import "CTDisplayView.h"
#import "CoreTextImageData.h"
#import "CoreTextLinkData.h"
#import "CoreTextUtility.h"
#import "CoretextMagnifyView.h"

@interface CTDisplayView ()<UIGestureRecognizerDelegate>

// 放大镜
@property (strong, nonatomic) CoretextMagnifyView * magnifyView;

@end

@implementation CTDisplayView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupEvents];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupEvents];
    }
    return self;
}

- (CoretextMagnifyView *)magnifyView {
    if (_magnifyView == nil) {
        _magnifyView = [[CoretextMagnifyView alloc] init];
        _magnifyView.viewToMagnify = self;
        [self addSubview:_magnifyView];
    }
    return _magnifyView;
}

#pragma mark - 手势
- (void)setupEvents
{
    UIGestureRecognizer * tapRecognizer =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(userTapGestureDetected:)];
    tapRecognizer.delegate = self;
    [self addGestureRecognizer:tapRecognizer];
    self.userInteractionEnabled = YES;
}

- (void)userTapGestureDetected:(UIGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:self];
    for (CoreTextImageData * imageData in self.textData.imageArray) {
        // 翻转坐标系, 因为imageData 中坐标是CoreText坐标系
        CGRect  imageRect     = imageData.imagePosition;
        CGPoint imagePosition = imageRect.origin;
        
        imagePosition.y = self.bounds.size.height - imageRect.origin.y - imageRect.size.height;
        
        CGRect rect = CGRectMake(imagePosition.x, imagePosition.y, imageRect.size.width, imageRect.size.height);
        
        // 检测点击位置 Point 是否在Rect之内
        if (CGRectContainsPoint(rect, point)) {
            // 在这里处理点击后的逻辑
            NSLog(@"bingo");
            break;
        }
    }
    
    CoreTextLinkData * linkData = [CoreTextUtility touchLinkInView:self
                                                           atPoint:point
                                                          textdata:self.textData];
    if (linkData) {
        NSLog(@"linkData");
        return;
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(contextRef, CGAffineTransformIdentity);
    CGContextTranslateCTM(contextRef, 0, self.bounds.size.height);
    CGContextScaleCTM(contextRef, 1.0, -1.0);
    
    if (self.textData) {
        CTFrameDraw(self.textData.ctFrame, contextRef);
    }
    
    for (CoreTextImageData * imageData in self.textData.imageArray) {
        UIImage *image = [UIImage imageNamed:imageData.name];
        if (image) {
            CGContextDrawImage(contextRef, imageData.imagePosition, image.CGImage);
        }
    }
}

@end
