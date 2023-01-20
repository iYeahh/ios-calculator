//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var 임시list낱개: InputPair = InputPair()
    var 임시list모음: [String] = []
    var 계산결과: Double?    //nil이면(= 켜자마자 `=`부터 누르면) 에러 or 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 숫자or기호 버튼 눌리면
    func newList(/*button: 버튼종류로switch*/) {
        // 연산자 버튼이면
        guard 임시list낱개.피연산자isEmpty() else {
            임시list모음.append(임시list낱개.makePair())
            임시list낱개 = InputPair()
            return
        }
        임시list낱개.change연산자(to: "+")
        
        // 부호 버튼이면
        임시list낱개.toggle부호()
        
        // 숫자, 점 버튼이면
        임시list낱개.add피연산자(new숫자: "1")
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
        //포뮬라는 스택에 있어어 지울 필요 x
    }
}

