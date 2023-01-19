//
//  String+.swift
//  Calculator
//
//  Created by J.E on 2023/01/19.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        self.split(separator: target).map { String($0) }
    }
}
