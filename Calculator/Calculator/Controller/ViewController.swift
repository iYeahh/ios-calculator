//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var 임시list낱개: TemporaryInput = TemporaryInput()
    var 임시list모음: [String] = []
    var 계산결과: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - 버튼 눌리면 (+뷰 반영 메서드 추가할 것)
    @IBAction func CalculatorButtonDidTap(sender: UIButton) {
        guard let button = sender as? CalculatorButtonProtocol else { return }
        
        switch button.job {
        case .writer(let contentType):
            writeTemporaryInput(for: contentType)
        case .eraser(let removeAll):
            removeAll ? eraseAll() : erasePart()
        case .calculator:
            theEnd()
            printResult()
        //case .presenter(let work):
        //    work()
        }
        
        printHistory()
    }
    
    //MARK: - 숫자or기호 버튼 눌리면
    func writeTemporaryInput(for content: WriterTypes) {
        switch content {
        // 연산자 버튼이면
        case .`operator`(let value):
            guard 임시list낱개.partialOperandsIsEmpty() else {
                임시list모음.append(임시list낱개.makePair())
                임시list낱개 = TemporaryInput()
                return
            }
            임시list낱개.changeOperator(to: Character(value))
        // 부호 버튼이면
        case .signValue(_):
            임시list낱개.toggleSignValue()
            
        // 숫자, 점 버튼이면
        case .number(let value):
            임시list낱개.addOperand(newNumber: value)
        }
    }
    
    //TODO: - 뷰: 계산내역 만들기
    func printHistory() {
        //큐에서 레이블 2개씩에 맞게 스크롤뷰 컨텐츠 조합
        //뷰에 띄우는 함수는 따로 만들 것(`printResult()`)
    }
        
    //MARK: - `=`버튼 눌리면 - 계산결과 만들기
    func theEnd() {
        let 전체식 = 임시list모음.joined()
        var 포뮬라 = ExpressionParser.parse(from: 전체식)
        계산결과 = try? 포뮬라.result()
    }
    
    //TODO: - 뷰: 계산결과 표시
    func printResult() {
        print(계산결과 ?? 0)
    }
    
    //MARK: - AC버튼 눌리면 - 직전 입력값 지우기
    func erasePart() {
        임시list낱개 = TemporaryInput()
    }
    
    //MARK: - CE버튼 눌리면 - 전체 입력값 지우기
    func eraseAll() {
        임시list낱개 = TemporaryInput()
        임시list모음 = []
        계산결과 = nil
    }
}


protocol CalculatorButtonProtocol {
    var job: CalculatorJobs { get }
    var name: String { get set }
}

class writingNumberButton: UIButton, CalculatorButtonProtocol {
    var name: String
    var job: CalculatorJobs {
        .writer(.number(name))
    }
    
    init(name: String) {
        self.name = name
        super.init(coder: .init())!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class writingOperatorButton: UIButton, CalculatorButtonProtocol {
    var name: String
    var job: CalculatorJobs
    
    init(name: String) {
        self.name = name
        self.job = .writer(.number(name))
        super.init(coder: .init())!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum CalculatorJobs {
    case writer(WriterTypes)
    case eraser(Bool)
    case calculator
    //case presenter(() -> Void)
}

//enum CalculatorJobs {
//    case writer(/*type: WriterTypes, */works: (String) -> Void)
//    case eraser(works: () -> Void)
//    case calculator(works: () -> Void)
//    case presenter(works: () -> Void)
//}

enum WriterTypes {
    case number(String)
    case signValue(String)
    case `operator`(String)
}
