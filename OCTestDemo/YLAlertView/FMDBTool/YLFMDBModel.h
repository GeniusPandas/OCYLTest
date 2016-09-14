//
//  YLFMDBModel.h
//  FMDBTest
//
//  Created by Jerry on 16/4/7.
//  Copyright © 2016年 Jerry. All rights reserved.
//

/**
 *  如果数据模型需要进行数据库操作, 需子类化
 */

#import <Foundation/Foundation.h>

//--------- SQLite五种数据类型 ---------
#define SQLTEXT    @"TEXT"
#define SQLINTEGER @"INTEGER"
#define SQLREAL    @"REAL"
#define SQLBLOB    @"BLOB"
#define SQLNULL    @"NULL"
#define SQLMODEL   @"MODEL"       // 为了与数组进行区分
#define PrimaryKey @"Primary key" // 主键

#define primaryId  @"PId"

@interface YLFMDBModel : NSObject

/**
 *  主键 Id
 */
@property (nonatomic, assign) int PId;
/**
 *  列名
 */
@property (nonatomic, retain, readonly) NSMutableArray * columnNames;
/**
 *  列类型
 */
@property (nonatomic, retain, readonly) NSMutableArray * columnTypes;


//--------- 建表 ---------

/**
 *  创建表（表名为类名: self.class）
 *
 *  @return 如果已创建，返回YES
 */
+ (BOOL)createTable;

/**
 *  获取该类的所有属性以及属性对应的类型
 *
 *  @return 返回字典
 */
+ (NSDictionary *)getPropertys;

/**
 *  获取模型中的所有属性, 并且添加一个主键字段Primary key.这些数据都存入一个字典中
 */
+ (NSDictionary *)getAllProperties;

/**
 *  取出数据库中指定表名的所有字段名称
 */
+ (NSArray *)getColumns;

/**
 *  数据库中是否存在表
 */
+ (BOOL)isExistInTable;


//--------- 存储 ---------

/**
 *  保存当前数据
 */
- (BOOL)save;
/**
 *  应用事务批量保存用户对象
 */
+ (BOOL)saveObjects:(NSArray *)array;

//--------- 删除 ---------

/**
 *  通过条件删除数据
 */
+ (BOOL)deleteObjectByCriteria:(NSString *)criteria;
/**
 *  清空表
 */
+ (BOOL)clearTable;

//--------- 更新 ---------

/**
 *  条件更新数据(这里的条件暂时以主键为条件, 因为创建模型对象时，会给主键主动赋一个值)
 */
- (BOOL)update;

/**
 *  通过主键批量更新用户对象
 */
+ (BOOL)updateObject:(NSArray *)array;

//--------- 查找 ---------

/**
 * 查找某条数据
 */
+ (instancetype)findFirstByCriteria:(NSString *)criteria;
/**
 *  查询全部数据
 */
+ (NSArray *)findAll;
/**
 *  通过条件查询数据
 */
+ (NSArray *)findByCriteria:(NSString *)criteria;

@end
