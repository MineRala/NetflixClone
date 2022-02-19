//
//  Extensions.swift
//  NetflixClone
//
//  Created by Mine Rala on 20.02.2022.
//

import Foundation

extension String {
    // Tableview section header Title'ın ilk hafrfini bükük diğer harflerini küçük yapma
    func capatilizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
