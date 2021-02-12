//
//  String+Extension.swift
//  ListOfThings
//
//  Created by Richárd Hardi on 2021. 02. 12..
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
