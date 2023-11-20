//
//  Date+Extensions.swift
//  Counter
//
//  Created by Andrey Zharov on 19.11.2023.
//

import Foundation
import UIKit

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

// Держим скролл снизу
extension UITextView {
    func scrollToBottom() {
        guard text.count > 0 else { return }
        let location = text.count - 1
        let bottom = NSMakeRange(location, 1)
        scrollRangeToVisible(bottom)
    }
}
