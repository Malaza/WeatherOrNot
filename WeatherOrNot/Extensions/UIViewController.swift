//
//  UIViewController.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import Foundation
import UIKit

extension UIViewController {
    
    func attributedStringForTitle(title:String, subTitle:String, large: Bool) -> NSAttributedString {
        
        let attrHeading:NSMutableAttributedString
        let attrContent:NSMutableAttributedString
        let mainAttributedString = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.paragraphSpacing = 4.0
        
        attrHeading = NSMutableAttributedString(string: title)
        let range = NSRange.init(location: 0, length: title.count)
        let titleSize = large == true ? 70.0 : 20.0
        attrHeading.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: titleSize, weight: .semibold), range: range)
        attrHeading.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        mainAttributedString.append(attrHeading)
        
        let stringFormat = String(format: "\n\(subTitle)")
        attrContent = NSMutableAttributedString(string: stringFormat)
        let thisRange = NSRange.init(location: 0, length: stringFormat.count)
        let subTitleSize = large == true ? 25 : 15.0
        attrContent.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: subTitleSize, weight: .medium), range: thisRange)
        attrContent.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: thisRange)
        mainAttributedString.append(attrContent)
        
        mainAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                          range: NSRange.init(location: 0, length: mainAttributedString.length))
        
        return mainAttributedString
    }
    
    func showErrorMessage(message:String) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "WeatherOrNot", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
