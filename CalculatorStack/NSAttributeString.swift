//
//  NSAttributeString.swift
//  CalculatorStack
//
//  Created by Artur on 1/12/21.
//

import UIKit

func setAmount(with summ: String) -> NSAttributedString {
    let doubleSumm = Double(summ) ?? 0
    let mainPart: String = String(Int(doubleSumm))
    let decimalPart: String = "\(String(doubleSumm).split(separator: ".")[1])"
    
    let mainAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 40),
        NSAttributedString.Key.foregroundColor: UIColor.black]
    let decimalAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 35),
        NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    
    let amountAttributedText = NSMutableAttributedString(string: mainPart,
                                                         attributes: mainAttributes)
    if summ.contains(".") {
        amountAttributedText.append(NSAttributedString(string: ",",
                                                       attributes: mainAttributes))
    }
    if decimalPart != "0" {
        amountAttributedText.append(NSAttributedString(string: decimalPart,
                                                       attributes: decimalAttributes))
    }
    return amountAttributedText
}
