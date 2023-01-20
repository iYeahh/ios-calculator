//
//  InputPair.swift
//  Calculator
//
//  Created by J.E on 2023/01/19.
//

import Foundation

struct InputPair {
    private var 연산자: Character = "+"
    private var 피연산자: [String] = []
    private var is양수: Bool = true
    
    func 피연산자isEmpty() -> Bool {
        피연산자.isEmpty
    }

    mutating func change연산자(to new기호: Character) {
        연산자 = new기호
    }
    
    mutating func add피연산자(new숫자: String) {
        피연산자.append(new숫자)
    }
    
    mutating func toggle부호() {
        is양수 = is양수 ? false : true
    }
    
    func makePair() -> String {
        let 부호 = is양수 ? "" : "-"
        let 숫자 = 피연산자.joined()
        return "\(연산자)\(부호)\(숫자)"
    }
}
