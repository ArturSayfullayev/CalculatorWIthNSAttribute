//
//  Extension.swift
//  CalculatorStack
//
//  Created by Artur on 1/12/21.
//

import UIKit


extension Double {
    /// Расширение для красивого форматирования(без нулей на конце и до 5 символов) и конвертации из Double в String.
    func formatter() -> String {
        let divisor = pow(10.0, Double(5))
        return String(format: "%g", (self * divisor).rounded() / divisor)
    }
}
