//
//  XCTestCase+JSON.swift
//  ASBInterviewExerciseTests
//
//  Created by DonorRaja on 18/12/21.
//


import XCTest

extension XCTestCase {
  enum TestError: Error {
    case fileNotFound
  }
  
  func getData(fromJSON fileName: String) throws -> Data {
   //let bundle = Bundle(for: type(of: self))
    guard let url = URL(string: fileName) else {
      XCTFail("Missing File: \(fileName)")
      throw TestError.fileNotFound
    }
    do {
      let data = try Data(contentsOf: url)
      return data
    } catch {
      throw error
    }
  }
}
