//
//  CalculatorError.swift
//  Calculator
//
//  Created by Bora Yang on 2023/01/16.
//

import Foundation

enum CalculatorError: Error {
    case noElementToDelete
    // 0으로 나누려고 할 때
    // 숫자입력 하나도 없이 `=` 눌렀을 때
}
