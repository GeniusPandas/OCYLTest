//
//  Header.h
//  CoreTextDemo
//
//  Created by Jerry on 16/1/5.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#ifndef Header_h
#define Header_h

#ifdef DEBUG
#define kDLog(...)    NSLog(__VA_ARGS__)
#define kDLogMethod() NSLog(@"%s", __FUNC__)
#else
#define kDLog(...)
#define kDLogMethod()
#endif

#define kRGB(a, b, c) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1.0]

#endif /* Header_h */
