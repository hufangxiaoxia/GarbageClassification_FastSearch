//
//  CoreDataHelper.swift
//  GarbageClassification
//
//  Created by 胡方 on 2019/6/28.
//  Copyright © 2019 胡方. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    public class func saveDataToDB(name: String, type: String, keywords: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print(#function + " failed to get appDelegate.")
            return
        }
        let context = appDelegate.persistentContainer.viewContext
        
        //Insert data into Entity
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Garbage", into: context)
        // Save values getting from database
        entity.setValue(name, forKey: "name")
        entity.setValue(type, forKey: "type")
        entity.setValue(keywords, forKey: "keywords")
        
        do{
            try context.save()
        }
        catch{
            print(#function + "Failed in saving the data.")
        }
    }
    
    public class func retrieveDataFromDB() -> [NSManagedObject?] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            print(#function + " failed to get appDelegate.")
            return []
        }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Garbage")
        request.returnsObjectsAsFaults = false;
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                guard let result = results as? [NSManagedObject] else {
                    print(#function + " failed to get results when retrieve from database.")
                    return []
                }
                return result
            }
        }
        catch {
            print(#function + " error occurred when retrieve data from database.")
        }
        return []
    }
    
    class func loadInitialData() {
        saveDataToDB(name: "菜叶", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "橙皮", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "葱", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "饼干", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "番茄酱", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "蛋壳", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "西瓜皮", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "马铃薯", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "鱼骨", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "甘蔗", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "玉米", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "骨头（鸡鸭鹅）", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "虾壳", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "蛋糕", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "面包", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "草莓", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "西红柿", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "梨", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "蟹壳", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "香蕉皮", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "辣椒", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "巧克力", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "茄子", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "碗豆皮", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "苹果", type: "湿垃圾", keywords: "")
        saveDataToDB(name: "树叶", type: "湿垃圾", keywords: "")
        
        saveDataToDB(name: "旧浴缸", type: "干垃圾", keywords: "")
        saveDataToDB(name: "盆子", type: "干垃圾", keywords: "")
        saveDataToDB(name: "坏马桶", type: "干垃圾", keywords: "")
        saveDataToDB(name: "旧水槽", type: "干垃圾", keywords: "")
        saveDataToDB(name: "贝壳", type: "干垃圾", keywords: "")
        saveDataToDB(name: "化妆刷", type: "干垃圾", keywords: "")
        saveDataToDB(name: "坛子", type: "干垃圾", keywords: "")
        saveDataToDB(name: "海绵", type: "干垃圾", keywords: "")
        saveDataToDB(name: "花生壳", type: "干垃圾", keywords: "")
        saveDataToDB(name: "菜板", type: "干垃圾", keywords: "")
        saveDataToDB(name: "砖块", type: "干垃圾", keywords: "")
        saveDataToDB(name: "卫生纸", type: "干垃圾", keywords: "")
        saveDataToDB(name: "篮球", type: "干垃圾", keywords: "")
        saveDataToDB(name: "杯子", type: "干垃圾", keywords: "")
        saveDataToDB(name: "陶瓷碗", type: "干垃圾", keywords: "")
        saveDataToDB(name: "一次性筷子", type: "干垃圾", keywords: "")
        saveDataToDB(name: "瓦片", type: "干垃圾", keywords: "")
        saveDataToDB(name: "西梅核", type: "干垃圾", keywords: "")
        saveDataToDB(name: "坏的花盆", type: "干垃圾", keywords: "")
        saveDataToDB(name: "扫把", type: "干垃圾", keywords: "")
        saveDataToDB(name: "木质梳子", type: "干垃圾", keywords: "")
        saveDataToDB(name: "脏污衣服", type: "干垃圾", keywords: "")
        saveDataToDB(name: "烟蒂", type: "干垃圾", keywords: "")
        saveDataToDB(name: "渣土", type: "干垃圾", keywords: "")
        saveDataToDB(name: "湿垃圾袋", type: "干垃圾", keywords: "")
        
        saveDataToDB(name: "漆桶", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "镍镉电池", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "打火机", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "创口贴", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "酒精", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "调色板", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "油漆", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "过期的胶囊药物", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "温度计", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "过期药片", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "荧光灯", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "蓄电池", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "医用棉签", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "煤气罐", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "医用手套", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "杀虫剂", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "水彩笔", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "农药瓶", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "医用纱布", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "口服液瓶", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "香水瓶", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "荧光棒", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "过期化妆品", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "发胶", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "注射器", type: "有害垃圾", keywords: "")
        saveDataToDB(name: "废弃灯泡", type: "有害垃圾", keywords: "")
        
        saveDataToDB(name: "塑料瓶", type: "可回收物", keywords: "")
        saveDataToDB(name: "食品罐头", type: "可回收物", keywords: "")
        saveDataToDB(name: "玻璃瓶", type: "可回收物", keywords: "")
        saveDataToDB(name: "易拉罐", type: "可回收物", keywords: "")
        saveDataToDB(name: "报纸", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧书包", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧手提包", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧鞋子", type: "可回收物", keywords: "")
        saveDataToDB(name: "牛奶盒", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧塑料篮子", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧玩偶", type: "可回收物", keywords: "")
        saveDataToDB(name: "玻璃壶", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧铁锅", type: "可回收物", keywords: "")
        saveDataToDB(name: "垃圾桶", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧镜子", type: "可回收物", keywords: "")
        saveDataToDB(name: "牙刷", type: "可回收物", keywords: "")
        saveDataToDB(name: "塑料梳子", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧帽子", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧夹子", type: "可回收物", keywords: "")
        saveDataToDB(name: "废锁头", type: "可回收物", keywords: "")
        saveDataToDB(name: "牙膏皮", type: "可回收物", keywords: "")
        saveDataToDB(name: "雨伞骨架", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧纸袋", type: "可回收物", keywords: "")
        saveDataToDB(name: "纸盒", type: "可回收物", keywords: "")
        saveDataToDB(name: "旧玩具", type: "可回收物", keywords: "")
    }
}
