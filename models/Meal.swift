//
//  Meal.swift
//  dynamic-table
//
//  Created by Jedediah Koch on 2/3/15.
//  Copyright (c) 2015 Jedediah Koch. All rights reserved.
//
import UIKit

class Meal: NSObject, NSCoding
{
    let name: String
    let notes: String
    let password: String
    var items = Array<Item>()
    
    init(name:String, password:String, notes:String)
    {
        self.name = name
        self.password = password
        self.notes = notes
    }
    required init(coder aDecoder: NSCoder){
        
        self.name = aDecoder.decodeObjectForKey("name") as String
        self.password = aDecoder.decodeObjectForKey("password") as String
        self.notes = aDecoder.decodeObjectForKey("notes") as String
        self.items = aDecoder.decodeObjectForKey("items") as Array<Item>
        
    }
    
    func encodeWithCoder(aCoder: NSCoder){
        
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.password, forKey: "password")
        aCoder.encodeObject(self.notes, forKey: "notes")
        aCoder.encodeObject(self.items, forKey: "items")
    }
    
//    func allCalories() -> Double
//    {
//        println("Calculating")
//        
//        var total = 0.0
//        for i in items
//        {
//            total += i.value
//        }
//        return total
//    }
    
    func details () -> String {
        var message = "password: \(self.password)"
        for item in self.items {
            message += "\n * \(item.name) - calories: \(item.value)"
        }
        return message
    }
}