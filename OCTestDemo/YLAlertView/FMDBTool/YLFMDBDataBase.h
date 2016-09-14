//
//  YLFMDBDataBase.h
//  FMDBTest
//
//  Created by Jerry on 16/4/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface YLFMDBDataBase : NSObject

@property (nonatomic, strong, readonly) FMDatabaseQueue * dbQueue;

/**
 *  单例
 *
 *  @return 
 */
+ (instancetype)shareFMDBDataBase;

/**
 *  创建文件夹，拼接数据库路径
 *
 *  @return 文件夹路径
 */
+ (NSString *)dbPath;

@end
