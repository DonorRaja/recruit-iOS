//
//  Transaction.swift
//  ASBInterviewExercise
//
//  Created by DonorRaja on 16/12/21.
//

import Foundation


struct Transaction: Decodable {
    let id : String
    var transactionDate: String
    let summary: String
    var debit : Double
    let credit: Double
    
}
