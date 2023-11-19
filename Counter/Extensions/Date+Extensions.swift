//
//  Date+Extensions.swift
//  Counter
//
//  Created by Andrey Zharov on 19.11.2023.
//

import Foundation

private let dateAndTimeFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "[dd.MM.yyyy HH:mm:ss]: "
    return dateFormatter
}()

extension Date {
    var dateAndTime: String {
        dateAndTimeFormatter.string(from: self)
    }
}
