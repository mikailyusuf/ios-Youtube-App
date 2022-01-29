//
//  Helpers.swift
//  ios-Youtube-App
//
//  Created by Mikail on 29/01/2022.
//

import Foundation

struct Helpers{
    
    
    static func convertToString (dateString: String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = Constants.serverDateFormat

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = Constants.dateFormat

        let date: NSDate? = dateFormatterGet.date(from: dateString) as NSDate?
        return dateFormatterPrint.string(from: date! as Date)
    }
}
