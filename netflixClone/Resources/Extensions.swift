//
//  Extensions.swift
//  netflixClone
//
//  Created by Dilara Şimşek on 12.04.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
