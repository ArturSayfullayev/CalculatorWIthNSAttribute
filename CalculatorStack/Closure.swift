//
//  Closure.swift
//  CalculatorStack
//
//  Created by Artur on 1/12/21.
//

import UIKit

class Closure {
    /// Замыкание для любых математических действий.
    static func simpleMath(num1: Double, num2: Double, closure: (Double, Double) -> Double) -> Double {
        var result: Double
        result = closure(num1, num2)
        return result
    }
    
    /// Функция для автоматического подсчета по заранее известному оператору(простые)
    static func mathFunc(math: Int, num1: Double, num2: Double) -> Double {
        var result: Double = 0
        switch math {
        case 1:
            result = num1 / num2
        case 2:
            result = num1 * num2
        case 3:
            result = num1 - num2
        case 4:
            result = num1 + num2
        default: break
        }
        return result
    }
}
