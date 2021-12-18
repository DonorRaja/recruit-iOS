//
//  TransactionResultTest.swift
//  ASBInterviewExerciseTests
//
//  Created by DonorRaja on 18/12/21.
//

import XCTest
@testable import ASBInterviewExercise

class TransactionResultTest: XCTestCase {

    var transactions: [Transaction]!
    
    override func setUpWithError() throws {
      super.setUp()
        let data = try getData(fromJSON: ASB.API.apiURL + ASB.API.transactions)
      transactions = try JSONDecoder().decode([Transaction].self, from: data)
    }

    override func tearDownWithError() throws {
      transactions = nil
      super.tearDown()
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testJSONMapping() {
        XCTAssertEqual(transactions.count, 19)
    }

}
