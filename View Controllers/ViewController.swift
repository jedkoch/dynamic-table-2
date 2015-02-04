//
//  EditorTableViewController.swift
//  dynamic-table
//
//  Created by Jedediah Koch on 2/2/15.
//  Copyright (c) 2015 Jedediah Koch. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal:Meal)
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

        @IBOutlet var userNameField: UITextField?
        @IBOutlet var userPWField: UITextField?
        @IBOutlet var userNotesField: UITextField?
        var delegate:AddAMealDelegate?
    
    var items = [
        Item(name: "eggplant", value: 5),
        Item(name: "flour", value: 4),
        Item(name: "soup", value: 3),
        Item(name: "nuts", value: 2),
    ]
    
    
    var selected = Array<Item>()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil {
        return
        }

        let  item = items[indexPath.row]
        if cell!.accessoryType == UITableViewCellAccessoryType.None{
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(item)
        }
        else
        {
        cell!.accessoryType = UITableViewCellAccessoryType.None
        }
    }
       
    @IBAction func autoFill(){
        var randomResult = arc4random()
        var webPW = randomResult
        
        println("Generated text =  \(webPW)")
        userPWField!.text = String(webPW)
    }
    
        @IBAction func add() {
            
            if userNameField == nil{return}
            else{
                var userstring1 = userNameField!.text
                var userstring2 = userPWField!.text
                var userstring3 = userNotesField!.text

                let meal = Meal(name: userstring1, password: userstring2, notes: userstring3)
                meal.items = selected
                
                println("User Info Entered \(meal.name) - \(meal.password) - \(meal.notes) - \(meal.items)")
                
                if delegate == nil{return}
                delegate!.add(meal)
                
                if let navigation  = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                }
            }
    }
}