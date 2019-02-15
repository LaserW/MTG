//
//  MealDetailViewController.swift
//  Meal Rating
//
//  Created by Denis Bystruev on 12/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class MTGDetailViewController: UIViewController {
    
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var deck: MTG?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let card = deck else { return }
        
        photoImageView.image = card.photo
        nameLabel.text = card.name
        ratingLabel.text = card.stars
        costLabel.text = card.cost
        notesLabel.text = card.notes
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        topStackView.axis = size.width < size.height ? .vertical : .horizontal
    }
}
