//
//  ExpressionParser.swift
//  Calculator
//
//  Created by J.E on 2023/01/19.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
//        let eachPair = componentsByOperators(from: input)
        var 연산자들 = CalculatorItemQueue<Operator>()
        input.compactMap { Operator(rawValue: $0) }
             .forEach { 연산자들.enqueue(item: $0) }
        
        var 피연산자들 = CalculatorItemQueue<Double>()
        componentsByOperators(from: input)
            .forEach { 피연산자들.enqueue(item: Double($0) ?? 0) }
        
        return Formula(operands: 피연산자들, operators: 연산자들)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        //input.split(with: " ")
        input.components(separatedBy: ["+", "−", "÷", "×"])
    }
}
