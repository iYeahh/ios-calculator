//
//  InputPair.swift
//  Calculator
//
//  Created by J.E on 2023/01/19.
//

import Foundation

struct InputPair {
    var 연산자: Character = "+"
    var 피연산자: [String] = []
    var is양수: Bool = true

    func makePair() -> String {
        let 부호 = is양수 ? "" : "-"
        let 숫자 = 피연산자.joined()
        return "\(연산자)\(부호)\(숫자)"
    }
}
