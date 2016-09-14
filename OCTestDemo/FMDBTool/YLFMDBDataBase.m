//
//  YLFMDBDataBase.m
//  FMDBTest
//
//  Created by Jerry on 16/4/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

#import "YLFMDBDataBase.h"

@implementation YLFMDBDataBase

@synthesize dbQueue = _dbQueue;

static YLFMDBDataBase * dataBase = nil;

/**
 *  单例
 *
 *  @return
 */
+ (instancetype)shareFMDBDataBase
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataBase = [[self alloc] init];
    });
    return dataBase;
}

/**
 *  创建数据库路径
 *
 *  @return 
 */
+ (NSString *)dbPath
{
    // 搜索路径的目录域
    NSString * docsdit = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSLog(@"docsdit : %@", docsdit);
    
    docsdit = [docsdit stringByAppendingPathComponent:@"Test"];
    
    BOOL isDir;
    BOOL exit = [fileManager fileExistsAtPath:docsdit
                                  isDirectory:&isDir];
    
    if (!exit || !isDir) {
        
        [fileManager createDirectoryAtPath:docsdit
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
        
    }
    
    NSString * dbPath = [docsdit stringByAppendingPathComponent:@"Test.sqlite"];
    
    return dbPath;
}

- (FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:[self.class dbPath]];
        
    }
    
    return _dbQueue;
}

@end
