//
//  ViewController.swift
//  dynamic-table
//
//  Created by Jedediah Koch on 1/22/15.
//  Copyright (c) 2015 Jedediah Koch. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {
    
    var meals = [   Meal(name: "amazon.com", password: "abc123", notes: "renews on Dec"),
        Meal(name: "ebay.com", password: "abc123", notes: "none")
    ]
    
    func add(meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as ViewController
            view.delegate = self
        }
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)  -> UITableViewCell{
        let row = indexPath.row
        let meal = meals[row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        return cell
    }
}


