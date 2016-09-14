//
//  main.swift
//  TestSwift01
//
//  Created by Jerry on 15/12/14.
//  Copyright © 2015年 Jerry. All rights reserved.
//

import Foundation

// 2015-12-14 基础篇

// 1. Hello, world !!!
//print("Hello, world!!!")

/* 
   2. let 常量(全局只允许一次赋值)
      var 变量(未声明类型时, 编译器默认推断类型integer)
*/
var myVariable = 100
myVariable = 200
let myConstant = 150

//print(myVariable)
//print(myConstant)
//print("sum \(myVariable) + \(myConstant)")

// 3. 指定类型常量(需要指定类型的方式 :xxx)
let implicitInteger = 20
let implictiDouble = 20.0
let explicitDouble:Double = 20
let explicitFloat:Float   = 4

//print("implicitInteger \(implicitInteger)")
//print("implicitInteger \(implicitInteger)")
//print("explicitDouble  \(explicitDouble)")
//print("explicitFloat   \(explicitFloat)")

// 4. 值永远不会隐式创建其他类型, 如果需要转换, 请显示转换
let label = "The width is "
let width = 320
let widthLabel = label + String(width)

//print("widthLabel   \(widthLabel)")

// 5. 更简单的方法将值转换成字符串方法: 把值放在括号中, 并且在括号之前写一个反斜杠.
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) prieces of fruit"
let mySister = "My Sister \(Float(24)) years old"

//print("appleSummary \(appleSummary)")
//print("fruitSummary \(fruitSummary)")
//print("mySister     \(mySister)")

// 6. 使用方括号[]来创建数组和字典, 并使用下标或者键(key)访问元素. 最后一个元素后面允许有个逗号.
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm" : "Captain",
    "Kaylee"  : "Mechanic",
]

occupations["Jayne"] = "Public Relations"

//print("shoppingList : \(shoppingList)")
//print("occupations : \(occupations)")

// 7. 遍历数组
// 7.1 传统for循环方式
var num = 0
for (var i = 0; i < 10; i++) {
    num += i
}

// 7.2 for-in 遍历区间(range)、序列(sequence)、集合(collection)、系列(progression)
//     所有的元素执行一系列语句

// 1> 闭区间循环, 从1循环到10
num = 0

for i in 1...10 {
    num += i
}

// 2> 开区间循环, 从1循环到9
num = 0
for i in 1..<10 {
    num += i
}

// 3> 如果不需要知道区间内的每一项值, 可以使用下划线(_)代替变量名, 忽略对区间值的访问
num = 0
for _ in 1...10 {
    num++
}

// 4> 嵌套
num = 0
for i in 0...5 {
    for j in 0...5 {
        num += i + j
    }
}

// 7.3 循环生成数组 指定类型时[String]
var array = [String]()

for i in 0..<10 {
    array.append("itcast \(i)")
}

// 向指定位置插入数据
array.insert("itcast 11", atIndex: 0)
// 向数组添加最后一个元素
array.append("itcast 10")

//print("array \(array) \narray count \(array.count)")

// 7.4 循环遍历字典 指定字典内类型<String, Int>
var ageDict:Dictionary<String, Int> = ["mary" : 19, "rose" : 20]

var names = [String]()
var ages  = [Int]()

for (key, value) in ageDict {
    names.append(key);
    ages.append(value);
}

//print("names : \(names) \nages : \(ages)")

// 通过指定key遍历字典
var keys = [String]()
var values = [String]()
var dict1 = ["name" : "mike", "age" : "18"]
for (name, age) in dict1 {
    keys.append(name);
    values.append(age)
}

print("keys : \(keys) \nvalues : \(values)");

// 7.5 使用标签退出循环
//     使用标签的其中1个作用是: 可以明确指定要退出哪个循环, 以下示例是退出名字为"mainloop"的循环
var result = 1
mainloop : for i in 1...5 {
    for j in 1...5 {
        result += j
        
        // 判断内容进行退出
        if (i == 3 && j == 3) {
            break mainloop
        }
    }
}

print("result : \(result)")

//var result = 1;
//mainloop : for i in 1...5 {
//    for j in 1...5 {
//        result += j
//        
//        if (i == 3 && j == 3) {
//            break mainloop
//        }
//    }
//}
//result




