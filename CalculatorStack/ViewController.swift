//
//  ViewController.swift
//  CalculatorStack
//
//  Created by Artur on 1/12/21.
//

import UIKit

    // MARK: - Properties
private var currentNum: String = ""
private var firstNum: Double = 0
private var secondNum: Double = 0
private var isEmpty: Bool = false
private var mathOperathor: Int = 0
private var answer: Double = 0

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var numericButtons: [UIButton]! {
        didSet {
            self.numericButtons.forEach {
                $0.layer.cornerRadius = $0.frame.height / 2.5
                $0.layer.shadowColor = UIColor.blue.cgColor
                $0.layer.shadowRadius = 4
                $0.layer.shadowOpacity = 0.6
                $0.layer.shadowRadius = $0.frame.height / 2.5
            }
        }
    }
    
    @IBOutlet var operationButoons: [UIButton]! {
        didSet {
            self.operationButoons.forEach {
                $0.layer.cornerRadius = $0.frame.height / 3
                $0.layer.shadowColor = UIColor.black.cgColor
                $0.layer.shadowRadius = 5
                $0.layer.shadowOpacity = 0.6
                $0.layer.shadowRadius = $0.frame.height / 3
            }
        }
    }
    
    @IBOutlet weak var mainLabel: UILabel!
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Actions
    @IBAction func numAction(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        
        switch button.tag {
        case 0...9:
            if isEmpty == true || currentNum == "0" {
                currentNum = String(button.tag)
                isEmpty = false
            } else {
                currentNum += String(button.tag)
            }
        case 10:
            if currentNum.first == "-" {
                currentNum.removeFirst()
            } else {
                currentNum.insert("-", at: currentNum.startIndex)
            }
        case 11:
            currentNum += String(".")
        default:
            return
        }
        self.mainLabel.attributedText = setAmount(with: currentNum)
    }
    
    @IBAction func operationAction(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        guard let doubleText = Double(currentNum) else { return }
        
        switch button.tag {
        case 12:
            currentNum = ""
            firstNum = 0
            secondNum = 0
            isEmpty = true
            mathOperathor = 0
            self.mainLabel.text = ""
        case 13:
            answer = sqrt(doubleText)
            currentNum = answer.formatter()
            isEmpty = true
            self.mainLabel.attributedText = setAmount(with: currentNum)
        case 14:
            answer = (doubleText / 100)
            currentNum = answer.formatter()
            isEmpty = true
            self.mainLabel.attributedText = setAmount(with: currentNum)
        case 15:
            currentNum = ""
            firstNum = doubleText
            self.mainLabel.text = "÷"
            isEmpty = true
            mathOperathor = 1
        case 16:
            currentNum = ""
            firstNum = doubleText
            self.mainLabel.text = "x"
            isEmpty = true
            mathOperathor = 2
        case 17:
            currentNum = ""
            firstNum = doubleText
            self.mainLabel.text = "-"
            isEmpty = true
            mathOperathor = 3
        case 18:
            currentNum = ""
            firstNum = doubleText
            self.mainLabel.text = "+"
            isEmpty = true
            mathOperathor = 4
        case 19:
            secondNum = doubleText
            isEmpty = true
            answer = (Closure.mathFunc(math: mathOperathor, num1: firstNum, num2: secondNum))
            currentNum = answer.formatter()
//            switch mathOperathor {
//            case 1:
//                currentNum = String(Closure.simpleMath(num1: firstNum,
//                                                       num2: secondNum) { $0 / $1 })
//            case 2:
//                currentNum = String(Closure.simpleMath(num1: firstNum,
//                                                       num2: secondNum) { $0 * $1 })
//            case 3:
//                currentNum = String(Closure.simpleMath(num1: firstNum,
//                                                       num2: secondNum) { $0 - $1 })
//            case 4:
//                currentNum = String(Closure.simpleMath(num1: firstNum,
//                                                       num2: secondNum) { $0 + $1 })
//            default: return
//            }
            self.mainLabel.attributedText = setAmount(with: currentNum)
        default:
            return
        }
        
    }
}

