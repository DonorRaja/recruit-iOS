//
//  Utility.swift
//  ASBInterviewExercise
//
//  Created by DonorRaja on 16/12/21.
//

import Foundation

class Utility: NSObject {
    
    //MARK: convertDateFormater
    class func convertDateFormater(_ date: String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from: date)
            //dateFormatter.dateFormat = "E d MMM yyyy"
            dateFormatter.dateFormat = "d MMM yyyy"
            return  dateFormatter.string(from: date!)

        }

    //MARK: calculateGST
    class func calculateGST(excludeGST: Double,percentage: Double) -> Double {
        
        let gstAmount = (excludeGST*percentage)/100
        
        return gstAmount
    }
    
    //MARK: makeCurrencyFormatter
    class func makeCurrencyFormatter(currentAmount: Double) -> String {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale.current
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        
        return currencyFormatter.string(from: NSNumber(value: currentAmount))!
    }
    
}

