//
//  CommonUI.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-13.
//

import UIKit

class CommonUI {
    static func styledButton(title: String, fontSize: CGFloat) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(named: "HomeColor")
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 7
        button.titleLabel?.font = UIFont(name: "Nunito-Regular", size: fontSize)
        return button
    }
    
    static func styledLabel(text: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor(named: "HomeColor")
        label.text = text
        label.font = UIFont(name: "Nunito-Regular", size: fontSize)
        label.textColor = .black
        return label
    }
    
    static func styledTextView(text: String, fontSize: CGFloat) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = UIColor(named: "HomeColor")
        textView.text = text
        textView.textAlignment = .center
        textView.font = UIFont(name: "Nunito-Regular", size: fontSize)
        textView.isEditable = false
        textView.textColor = .black
        return textView
    }
}
