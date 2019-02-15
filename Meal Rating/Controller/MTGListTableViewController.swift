//
//  MealListTableViewController.swift
//  Meal Rating
//
//  Created by Denis Bystruev on 12/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class MTGListTableViewController: UITableViewController {
    
    var deck = [MTG]()
    
    override func viewDidLoad() {
        loadDeck()
    }
    
    func saveMeals() {
        // TODO: save the meals
    }
    
    func loadDeck() {
        deck = MTG.load()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell") as! MTGViewCell
        let card = deck[indexPath.row]
        
        configure(cell: cell, with: card)
        
        return cell
    }
    
    func configure(cell: MTGViewCell, with meal: MTG) {
        cell.photoImageView.image = meal.photo
        cell.nameLabel.text = meal.name
        cell.starsLabel.text = meal.stars
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "MealDetailSegue" else { return }
        
        let controller = segue.destination as! MTGDetailViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        controller.deck = deck[indexPath.row]
    }
}
