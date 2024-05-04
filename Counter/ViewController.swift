//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Гавриленко on 04.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter: Int = 0
    private let labelDefaultText: String = "Значение счётчика: "
    private let startHistoryTextViewText: String = "История изменений: "
    private let changedValueHistoryText: String = "значение изменено на "
    private let zeroingValueHistoryText: String = "значение сброшено"
    private let minusZeroErrorText: String = " попытка уменьшить значение счётчика ниже 0"
    private lazy var currentHistoryText: String = startHistoryTextViewText

    @IBOutlet weak var counterLable: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var zeroingButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        historyTextView.isEditable = false
        setUpTextView()
    }
    
    @IBAction func incrementLabelValue(_ sender: Any) {
        incrementValue()
    }
    
    @IBAction func incrementLabelValueUsingPlus(_ sender: Any) {
        incrementValue()
        currentHistoryText += "\n" + getCurrentDate() + " " + changedValueHistoryText + "+1"
        historyTextView.text = currentHistoryText
    }
    
    @IBAction func decrementLabelValue(_ sender: Any) {
        if counter != 0 {
            counter -= 1
            currentHistoryText += "\n" + getCurrentDate() + " " + changedValueHistoryText + "-1"
            
        } else {
            currentHistoryText += "\n" + getCurrentDate() + minusZeroErrorText
        }
        historyTextView.text = currentHistoryText
        counterLable.text = labelDefaultText + String(counter)
    }
    
    @IBAction func zeroingLabelValue(_ sender: Any) {
        counter = 0
        counterLable.text = labelDefaultText + String(counter)
        currentHistoryText += "\n" + getCurrentDate() + " " + zeroingValueHistoryText
        historyTextView.text = currentHistoryText
        
    }
    
    func setUpTextView() {
        historyTextView.text = startHistoryTextViewText
    }
    
    func incrementValue() {
        counter += 1
        counterLable.text = labelDefaultText + String(counter)
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDate = dateFormatter.string(from: Date())
        return currentDate
    }
}

