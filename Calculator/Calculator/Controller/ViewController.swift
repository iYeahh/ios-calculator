//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var 연산자Q: CalculatorItemQueue<Operator> = CalculatorItemQueue()
    var 피연산자Q: CalculatorItemQueue<Double> = CalculatorItemQueue()
    var 임시list낱개: InputPair = InputPair()
    var 임시list모음: [String] = []
    var 계산결과: Double?    //nil이면(= 켜자마자 `=`부터 누르면) 에러 or 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 숫자or기호 버튼 눌리면
    func newList(/*button: 버튼종류로switch*/) {
        // 연산자 버튼이면
        guard 임시list낱개.피연산자.isEmpty else {
            임시list모음.append(임시list낱개.makePair())
            임시list낱개 = InputPair()
            return
        }
        임시list낱개.연산자 = "연"
        
        // 부호 버튼이면
        임시list낱개.is양수 = false //토글
        
        // 숫자, 점 버튼이면
        임시list낱개.피연산자.append("1")
    }

    // 끝(=) 버튼 눌리면
    func theEnd() {
        let 전체식 = 임시list모음.joined()
        var 포뮬라 = ExpressionParser.parse(from: 전체식)
        계산결과 = 포뮬라.result()
    }
    
    // 계산결과 표시
    func printResult() {
        print(계산결과 ?? 0)
    }
    
    // 직전 입력값 지우기
    func erasePart() {
        임시list낱개 = InputPair()
    }
    
    // 전체 입력값 지우기
    func eraseAll() {
        임시list낱개 = InputPair()
        임시list모음 = []
        계산결과 = nil
    }
}

