//
//  TemporaryInput.swift
//  Calculator
//
//  Created by Bora Yang on 2023/01/20.
//

import Foundation

struct TemporaryInput {
    private var partialOperator: Character = "+"
    private var partialOperands: [String] = []
    private var isPositive: Bool = true

    func partialOperandsIsEmpty() -> Bool {
        partialOperands.isEmpty
    }

    mutating func changeOperator(to newOperator: Character) {
        partialOperator = newOperator
    }

    mutating func addOperand(newNumber: String) {
        partialOperands.append(newNumber)
    }

    mutating func toggleSignValue() {
        isPositive = isPositive ? false : true
    }

    func makePair() -> String {
        let signValue = isPositive ? "" : "-"
        let numbers = partialOperands.joined()
        return "\(partialOperator)\(signValue)\(numbers)"
    }
}
