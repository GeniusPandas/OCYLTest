//
//  Common.h
//  YLBaseModel
//
//  Created by Jerry on 15/12/2.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#ifndef Common_h
#define Common_h


#ifdef DEBUG
#define kDLog(fmt, ...) NSLog(@"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(fmt), ##__VA_ARGS__])
#else
#define kDLog(fmt, ...)
#endif

#endif /* Common_h */
