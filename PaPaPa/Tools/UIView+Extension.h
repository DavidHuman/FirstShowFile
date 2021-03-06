//
//  UIView+Extension.h
//  fenlibao_iphone
//
//  Created by fenlibao on 15/6/15.
//  Copyright (c) 2015年 fenlibao. All rights reserved.
//
/** 设置自身x */
#define ZCSetX(value) self.x = value
/** 设置自身y */
#define ZCSetY(value) self.y = value
/** 设置自身centerX */
#define ZCSetCenterX(value) self.centerX = value
/** 设置自身centerY */
#define ZCSetCenterY(value) self.centerY = value
/** 设置自身center */
#define ZCSetCenter(x, y) ZCSetCenterX(x); \
SetCenterY(y)
/** 设置自身宽度 */
#define ZCSetWidth(value) self.width = value
/** 设置自身高度 */
#define ZCSetHeight(value) self.height = value
/** 设置自身尺寸 */
#define ZCSetSize(width, height) self.size = CGSizeMake(width, height)

/** 设置控件x */
#define ZCSetXForView(view, value) view.x = value
/** 设置控件y */
#define ZCSetYForView(view, value) view.y = value
/** 设置控件centerX */
#define ZCSetCenterXForView(view, value) view.centerX = value
/** 设置控件centerY */
#define ZCSetCenterYForView(view, value) view.centerY = value
/** 设置控件center */
#define ZCSetCenterForView(view, x, y) ZCSetCenterXForView(view, x); \
SetCenterYForView(view, y);
/** 设置控件水平居中 */
#define AlignHorizontal(view) [view alignHorizontal]
/** 设置控件垂直居中 */
#define AlignVertical(view) [view alignVertical]
/** 设置控件宽度 */
#define ZCSetWidthForView(view, value) view.width = value
/** 设置控件高度 */
#define ZCSetHeightForView(view, value) view.height = value
/** 设置控件尺寸 */
#define ZCSetSizeForView(view, width, height) view.size = CGSizeMake(width, height)

/** 快速添加子控件的宏定义 */
#define AddView(Class, property) [self addSubview:[Class class] propertyName:property]
#define AddViewForView(view, Class, property) [view addSubview:[Class class] propertyName:property]

// 屏幕bounds
#define ZCScreenBounds [UIScreen mainScreen].bounds
// 屏幕的size
#define ZCScreenSize [UIScreen mainScreen].bounds.size
// 屏幕的宽度
#define ZCScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕的高度
#define ZCScreenHeight [UIScreen mainScreen].bounds.size.height


#define kInputViewWidth ZCScreenWidth-20//输入框的width
#define kInputViewHeight 200//输入框的高度

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
/** 水平居中 */
- (void)alignHorizontal;
/** 垂直居中 */
- (void)alignVertical;
/** 添加子控件 */
- (void)addSubview:(Class)classs propertyName:(NSString *)propertyName;
@end
