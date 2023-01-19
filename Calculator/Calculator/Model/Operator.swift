//
//  Operator.swift
//  Calculator
//
//  Created by J.E on 2023/01/19.
//

import Foundation

enum Operator: Character, CaseIterable {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
}

extension Operator: CalculateItem {
    func calculate(lhs: Double, rhs: Double) -> Double {
        switch self {
        case .add:
            return add(lhs: lhs, rhs: rhs)
        case .subtract:
            return subtract(lhs: lhs, rhs: rhs)
        case .divide:
            return divide(lhs: lhs, rhs: rhs)
        case .multiply:
            return multiply(lhs: lhs, rhs: rhs)
        }
    }

    private func add(lhs: Double, rhs: Double) -> Double {
        lhs + rhs
    }
    private func subtract(lhs: Double, rhs: Double) -> Double {
        lhs - rhs
    }
    private func divide(lhs: Double, rhs: Double) -> Double {
        lhs / rhs
    }
    private func multiply(lhs: Double, rhs: Double) -> Double {
        lhs *  rhs
    }
}
