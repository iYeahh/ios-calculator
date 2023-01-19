//
//  Formula.swift
//  Calculator
//
//  Created by J.E on 2023/01/19.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        return (1...operators.count()).reduce(0.0) { initialResult, _  in
            let theOperand = (try? operands.dequeue()) ?? 0.0
            let theOperator = (try? operators.dequeue()) ?? .add
            return theOperator.calculate(lhs: initialResult, rhs: theOperand)
        }
    }
}
