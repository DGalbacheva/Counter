//
//  ViewController.swift
//  Counter
//
//  Created by Doroteya Galbacheva on 11.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var historyView: UITextView!
    
    var historyText = "История изменения:\n"
    
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.text = "История изменения:\n"
        
        // UITextView unable to be edited by the user
        historyView.isEditable = false
        configureButton()
    }

    @IBAction func plus(_ sender: Any) {
        counter += 1
        countLabel.text = "Значение счетчика: \(counter)"
        updateHistoryText("значение изменено на +1")
    }
    
    @IBAction func minus(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            countLabel.text = "Значение счетчика: \(counter)"
            updateHistoryText("значение изменено на -1")
        } else {
            updateHistoryText("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        counter = 0
        countLabel.text = "Значение счетчика: 0"
        updateHistoryText("значение сброшено")
    }
    
    func configureButton() {
        buttonPlus.configuration = .tinted()
        buttonPlus.configuration?.image = UIImage(systemName: "plus")
        //buttonPlus.setTitle("+", for: .normal)
        buttonPlus.configuration?.baseForegroundColor = .systemRed
        buttonPlus.configuration?.baseBackgroundColor = .systemRed
        buttonPlus.configuration?.cornerStyle = .capsule
        
        buttonMinus.configuration = .tinted()
        buttonMinus.configuration?.image = UIImage(systemName: "minus")
       // buttonMinus.setTitle("-", for: .normal)
        buttonMinus.configuration?.baseForegroundColor = .systemBlue
        buttonMinus.configuration?.baseBackgroundColor = .systemBlue
        buttonMinus.configuration?.cornerStyle = .capsule
        
        buttonZero.configuration = .tinted()
        buttonZero.configuration?.image = UIImage(systemName: "xmark.circle.fill")
        buttonZero.setTitle("Нуль", for: .normal)
        buttonZero.configuration?.baseForegroundColor = .systemGreen
        buttonZero.configuration?.baseBackgroundColor = .systemGreen
        buttonZero.configuration?.cornerStyle = .capsule
    }
    
    func updateHistoryText(_ change: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let currentDateTime = dateFormatter.string(from: Date())
        
        historyText.append("[\(currentDateTime)]: \(change)\n")
        historyView.text = historyText
    }
}

