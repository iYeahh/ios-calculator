//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Bora Yang on 2023/01/16.
//

import XCTest

final class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue!

    override func setUp() {
        super.setUp()
        sut = CalculatorItemQueue()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_빈배열이면_true이다() {
        let result = sut.isEmpty()
        XCTAssertTrue(result)
    }

    func test_빈배열이_아니면_false이다() {
        let result = {
            sut.enqueue(item: "a")
            return sut.isEmpty()
        }()
        XCTAssertFalse(result)
    }

    func test_배열의_요소_개수를_반환한다() {
        sut.enqueue(item: "a")
        sut.enqueue(item: "b")
        let result = sut.count()
        XCTAssertEqual(result, 2)
    }

    func test_배열에_추가한_순서대로_저장된다() {
        sut.enqueue(item: "a")
        sut.enqueue(item: "b")
        let result = sut.itemArray
        XCTAssertEqual(result, ["a", "b"])
    }

    func test_배열에_추가한_순서대로_삭제된다() {
        sut.enqueue(item: "a")
        sut.enqueue(item: "b")
        do {
            try sut.dequeue()
            let result = sut.itemArray
            XCTAssertEqual(result, ["b"])
        } catch {

        }
    }

    func test_빈배열에서_요소를_삭제를_시도하면_에러를_던진다() {
        XCTAssertThrowsError(try sut.dequeue())
    }
}
