//
//  MealListTableViewController.swift
//  Meal Rating
//
//  Created by Denis Bystruev on 12/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
        loadMeals()
    }
    
    func saveMeals() {
        // TODO: save the meals
    }
    
    func loadMeals() {
        meals = Meal.load()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell") as! MealViewCell
        let meal = meals[indexPath.row]
        
        configure(cell: cell, with: meal)
        
        return cell
    }
    
    func configure(cell: MealViewCell, with meal: Meal) {
        cell.photoImageView.image = meal.photo
        cell.nameLabel.text = meal.name
        cell.starsLabel.text = meal.stars
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MealDetailSegue" else { return }
        
        let controller = segue.destination as! MealDetailViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        controller.meal = meals[indexPath.row]
    }
}
