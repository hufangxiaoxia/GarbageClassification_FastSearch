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
        
        saveDataToDB(name: "菜叶", type: "湿垃圾", keywords: "vegetable")
        saveDataToDB(name: "橙皮", type: "湿垃圾", keywords: "orange")
        saveDataToDB(name: "葱", type: "湿垃圾", keywords: "onion")
        saveDataToDB(name: "饼干", type: "湿垃圾", keywords: "cookie")
        saveDataToDB(name: "番茄酱", type: "湿垃圾", keywords: "sauce")
        saveDataToDB(name: "蛋壳", type: "湿垃圾", keywords: "egg")
        saveDataToDB(name: "西瓜皮", type: "湿垃圾", keywords: "watermelon")
        saveDataToDB(name: "马铃薯", type: "湿垃圾", keywords: "potato")
        saveDataToDB(name: "鱼骨", type: "湿垃圾", keywords: "fishbone")
        saveDataToDB(name: "甘蔗", type: "湿垃圾", keywords: "sugarcane")
        saveDataToDB(name: "玉米", type: "湿垃圾", keywords: "corn")
        saveDataToDB(name: "骨头（鸡鸭鹅）", type: "湿垃圾", keywords: "bone")
        saveDataToDB(name: "虾壳", type: "湿垃圾", keywords: "shrimp")
        saveDataToDB(name: "蛋糕", type: "湿垃圾", keywords: "cake")
        saveDataToDB(name: "面包", type: "湿垃圾", keywords: "bread")
        saveDataToDB(name: "草莓", type: "湿垃圾", keywords: "strawberry")
        saveDataToDB(name: "西红柿", type: "湿垃圾", keywords: "tomato")
        saveDataToDB(name: "梨", type: "湿垃圾", keywords: "pear")
        saveDataToDB(name: "蟹壳", type: "湿垃圾", keywords: "crab")
        saveDataToDB(name: "香蕉皮", type: "湿垃圾", keywords: "banana")
        saveDataToDB(name: "辣椒", type: "湿垃圾", keywords: "pepper")
        saveDataToDB(name: "巧克力", type: "湿垃圾", keywords: "chocolate")
        saveDataToDB(name: "茄子", type: "湿垃圾", keywords: "eggplant")
        saveDataToDB(name: "碗豆皮", type: "湿垃圾", keywords: "pea")
        saveDataToDB(name: "苹果", type: "湿垃圾", keywords: "apple")
        saveDataToDB(name: "树叶", type: "湿垃圾", keywords: "leaf")
        
        saveDataToDB(name: "旧浴缸", type: "干垃圾", keywords: "bathtub")
        saveDataToDB(name: "盆子", type: "干垃圾", keywords: "basin")
        saveDataToDB(name: "坏马桶", type: "干垃圾", keywords: "toilet,closetool")  //
        saveDataToDB(name: "旧水槽", type: "干垃圾", keywords: "sink,basin") //
        saveDataToDB(name: "贝壳", type: "干垃圾", keywords: "shell")
        saveDataToDB(name: "化妆刷", type: "干垃圾", keywords: "brush")
        saveDataToDB(name: "坛子", type: "干垃圾", keywords: "jar")
        saveDataToDB(name: "海绵", type: "干垃圾", keywords: "sponge")
        saveDataToDB(name: "花生壳", type: "干垃圾", keywords: "peanut shell")
        saveDataToDB(name: "菜板", type: "干垃圾", keywords: "chopping board")
        saveDataToDB(name: "砖块", type: "干垃圾", keywords: "brick")
        saveDataToDB(name: "卫生纸", type: "干垃圾", keywords: "tissue, paper")
        saveDataToDB(name: "篮球", type: "干垃圾", keywords: "basketball")
        saveDataToDB(name: "杯子", type: "干垃圾", keywords: "cup")
        saveDataToDB(name: "陶瓷碗", type: "干垃圾", keywords: "bowl")
        saveDataToDB(name: "一次性筷子", type: "干垃圾", keywords: "chopsticks")
        saveDataToDB(name: "瓦片", type: "干垃圾", keywords: "tile")
        saveDataToDB(name: "西梅核", type: "干垃圾", keywords: "plum core")
        saveDataToDB(name: "坏的花盆", type: "干垃圾", keywords: "flowerpot")
        saveDataToDB(name: "扫把", type: "干垃圾", keywords: "besom,sweeper")
        saveDataToDB(name: "木质梳子", type: "干垃圾", keywords: "comb")
        saveDataToDB(name: "脏污衣服", type: "干垃圾", keywords: "clothes")
        saveDataToDB(name: "烟蒂", type: "干垃圾", keywords: "nipe, butt")
        saveDataToDB(name: "渣土", type: "干垃圾", keywords: "muck")
        saveDataToDB(name: "湿垃圾袋", type: "干垃圾", keywords: "garbage bag")
        
        saveDataToDB(name: "塑料瓶", type: "可回收物", keywords: "plastic bottle")
        saveDataToDB(name: "食品罐头", type: "可回收物", keywords: "can")
        saveDataToDB(name: "玻璃瓶", type: "可回收物", keywords: "glass bottle")
        saveDataToDB(name: "易拉罐", type: "可回收物", keywords: "beverage can")
        saveDataToDB(name: "报纸", type: "可回收物", keywords: "newspaper")
        saveDataToDB(name: "旧书包", type: "可回收物", keywords: "bag")
        saveDataToDB(name: "旧手提包", type: "可回收物", keywords: "handbag")
        saveDataToDB(name: "旧鞋子", type: "可回收物", keywords: "shoes")
        saveDataToDB(name: "牛奶盒", type: "可回收物", keywords: "milk box")
        saveDataToDB(name: "旧塑料篮子", type: "可回收物", keywords: "plastic basket")
        saveDataToDB(name: "旧玩偶", type: "可回收物", keywords: "doll, puppet")
        saveDataToDB(name: "玻璃壶", type: "可回收物", keywords: "kettle, pot, jug")
        saveDataToDB(name: "旧铁锅", type: "可回收物", keywords: "iron pan")
        saveDataToDB(name: "垃圾桶", type: "可回收物", keywords: "trash can, garbage-bin")
        saveDataToDB(name: "旧镜子", type: "可回收物", keywords: "mirror")
        saveDataToDB(name: "牙刷", type: "可回收物", keywords: "toothbrush")
        saveDataToDB(name: "塑料梳子", type: "可回收物", keywords: "plastic comb")
        saveDataToDB(name: "旧帽子", type: "可回收物", keywords: "cap,hat")
        saveDataToDB(name: "旧夹子", type: "可回收物", keywords: "clamp")
        saveDataToDB(name: "废锁头", type: "可回收物", keywords: "waste locks")
        saveDataToDB(name: "牙膏皮", type: "可回收物", keywords: "toothpaste tube")
        saveDataToDB(name: "雨伞骨架", type: "可回收物", keywords: "umbrella skeleton")
        saveDataToDB(name: "旧纸袋", type: "可回收物", keywords: "paper bag")
        saveDataToDB(name: "纸盒", type: "可回收物", keywords: "carton, paper box")
        saveDataToDB(name: "旧玩具", type: "可回收物", keywords: "toy")
        
        saveDataToDB(name: "漆桶", type: "有害垃圾", keywords: "paint bucket")
        saveDataToDB(name: "镍镉电池", type: "有害垃圾", keywords: "nickel-cadmium battery, cell")
        saveDataToDB(name: "打火机", type: "有害垃圾", keywords: "lighter")
        saveDataToDB(name: "创口贴", type: "有害垃圾", keywords: "bandage")
        saveDataToDB(name: "酒精", type: "有害垃圾", keywords: "alcohol")
        saveDataToDB(name: "调色板", type: "有害垃圾", keywords: "pallet")
        saveDataToDB(name: "油漆", type: "有害垃圾", keywords: "oil paint")
        saveDataToDB(name: "过期的胶囊药物", type: "有害垃圾", keywords: "capsule")
        saveDataToDB(name: "温度计", type: "有害垃圾", keywords: "thermometer")
        saveDataToDB(name: "过期药片", type: "有害垃圾", keywords: "tablet")
        saveDataToDB(name: "荧光灯", type: "有害垃圾", keywords: "lamp")
        saveDataToDB(name: "蓄电池", type: "有害垃圾", keywords: "battery")
        saveDataToDB(name: "医用棉签", type: "有害垃圾", keywords: "swab, bud")
        saveDataToDB(name: "煤气罐", type: "有害垃圾", keywords: "gas tank")
        saveDataToDB(name: "医用手套", type: "有害垃圾", keywords: "medical glove")
        saveDataToDB(name: "杀虫剂", type: "有害垃圾", keywords: "insecticide,pesticide")
        saveDataToDB(name: "水彩笔", type: "有害垃圾", keywords: "brush")
        saveDataToDB(name: "农药瓶", type: "有害垃圾", keywords: "pesticide, flask")
        saveDataToDB(name: "医用纱布", type: "有害垃圾", keywords: "medical gauze")
        saveDataToDB(name: "口服液瓶", type: "有害垃圾", keywords: "oral solution bottle")
        saveDataToDB(name: "香水瓶", type: "有害垃圾", keywords: "perfume bottle")
        saveDataToDB(name: "荧光棒", type: "有害垃圾", keywords: "glow stick")
        saveDataToDB(name: "过期化妆品", type: "有害垃圾", keywords: "cosmetics")
        saveDataToDB(name: "发胶", type: "有害垃圾", keywords: "hair spray")
        saveDataToDB(name: "注射器", type: "有害垃圾", keywords: "injection syringe")
        saveDataToDB(name: "废弃灯泡", type: "有害垃圾", keywords: "lamp bulb")
        
    }
}
