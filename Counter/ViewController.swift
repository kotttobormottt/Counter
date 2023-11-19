//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Zharov on 18.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var currentValue: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(currentValue)"
        }
    }
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var clearLog: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(currentValue)
        historyTextView.isEditable = false
        historyTextView.text = "История изменений:\n"
        historyTextView.layer.cornerRadius = 20
        historyTextView.layer.masksToBounds = true
        historyTextView.isScrollEnabled = true
    }
    
    @IBAction func plusCounterOnTap(_ sender: Any) {
        printHistoryTextView("Значение изменено на +1\n")
        currentValue += 1
    }
    
    @IBAction func minusCounterOnTap(_ sender: Any) {
        if currentValue != 0 {
            currentValue -= 1
            printHistoryTextView("Значение изменено на -1\n")
        } else {
            printHistoryTextView("Попытка уменьшить значение счётчика ниже 0\n")
        }
    }
    
    @IBAction func resetCounterOnTap(_ sender: Any) {
        printHistoryTextView("Значение сброшено\n")
        currentValue = 0
    }
    
    @IBAction func clearTextView(_ sender: Any) {
        historyTextView.selectAll(historyTextView)
        if let range = historyTextView.selectedTextRange {
            historyTextView.replace(range, withText: "")
        }
    }
    
    private func printHistoryTextView (_ message: String) {
        historyTextView.text.append(Date().dateAndTime)
        historyTextView.text.append(message)
    }
}
