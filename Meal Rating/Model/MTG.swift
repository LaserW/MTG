//
//  Meal.swift
//  Meal Rating
//
//  Created by Denis Bystruev on 12/02/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

struct MTG {
    var name: String
    var photo: UIImage
    var notes: String
    var rating: Int
    //var timestamp: Date
    var cost: String
    //"💧""🌳"
    
    var stars: String {
        var starRating = ""
        
        guard 0 < rating else { return starRating }
        
        for _ in 1...min(rating, 10) {
            starRating += "⭐️"
        }
        
        return starRating
    }
    
//    var date: String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        formatter.timeStyle = .none
//        return formatter.string(from: self.timestamp)
//    }
    
    static func load() -> [MTG] {
        return [
            MTG(name: "Tamiyo, the Moon Sage", photo: UIImage(named: "Tamiyo, the Moon Sage")!, notes: "Волшебница и вдохновительница.", rating: 10, cost: "Стоимость вызова:  3💧💧"),
            MTG(name: "Phantom Centaur", photo: UIImage(named: "Phantom Centaur")!, notes: "Воин не боящийся тьмы!", rating: 9, cost: "Стоимость вызова:  2🌳🌳"),
            MTG(name: "Reveka, Wizard Savant", photo: UIImage(named: "Reveka, Wizard Savant")!, notes: "Маг пустынник", rating: 5, cost: "Стоимость вызова:  2💧💧"),
            MTG(name: "Terminal Moraine", photo: UIImage(named: "Terminal Moraine")!, notes: "Извлечение энергии!", rating: 6, cost: "Стоимость вызова:  0"),
            MTG(name: "Tropical Island", photo: UIImage(named: "Tropical Island")!, notes: "В любой момент - энергия нужного цвета.", rating: 9, cost: "Стоимость вызова:  0"),
        ]
    }
}
