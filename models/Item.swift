//
//  Item.swift
//  dynamic-table
//
//  Created by Jedediah Koch on 2/3/15.
//  Copyright (c) 2015 Jedediah Koch. All rights reserved.
//

import UIKit

class Item: NSObject, Equatable, NSCoding
{
    let name: String
    let value: Double
    
    init(name: String, value: Double)
    {
        self.name = name
        self.value = value
    }
    required init(coder aDecoder: NSCoder){
        self.name = aDecoder.decodeObjectForKey("name") as String
        self.value = aDecoder.decodeDoubleForKey("value")
    }
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeDouble(self.value, forKey: "value")
    }
    
}

func == (first: Item, second: Item) -> Bool {
    return first.name == second.name && first.value == second.value
}