//
//  ViewController.swift
//  Text Field Customization
//
//  Created by John Marstall on 9/28/15.
//  Copyright © 2015 Black Pixel. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var inputTextField: NSTextField!
    
    // establish our colors
    let fieldBackgroundColor = NSColor(
                                calibratedHue: 230/360,
                                saturation: 0.15,
                                brightness: 0.85,
                                alpha: 1)
    let fieldBorderColor = NSColor(
                                calibratedHue: 230/360,
                                saturation: 0.35,
                                brightness: 0.50,
                                alpha: 1)
    let fieldTextColor = NSColor(
                                calibratedHue: 230/360,
                                saturation: 0.40,
                                brightness: 0.35,
                                alpha: 1)
    
    let placeholderTextColor = NSColor(
                                calibratedHue: 230/360,
                                saturation: 0.40,
                                brightness: 0.35,
                                alpha: 0.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // these attributes are set in Interface Builder, but are included to prevent mistakes
        inputTextField.bordered = true
        inputTextField.drawsBackground = true
        
        // use CALayer with text field
        inputTextField.wantsLayer = true
        let textFieldLayer = CALayer()
        inputTextField.layer = textFieldLayer
        
        // assign colors
        inputTextField.backgroundColor = fieldBackgroundColor
        inputTextField.layer?.backgroundColor = fieldBackgroundColor.CGColor // double-bumped!
        inputTextField.layer?.borderColor = fieldBorderColor.CGColor
        inputTextField.layer?.borderWidth = 1
        inputTextField.layer?.cornerRadius = 5
        inputTextField.textColor = fieldTextColor
        
        // attributed string for placeholder text color
        let placeholderAttributes: [String: AnyObject] = [
            NSForegroundColorAttributeName: placeholderTextColor
        ]
        
        let placeholderAttributedString = NSMutableAttributedString(string: "Add text here", attributes: placeholderAttributes)
        
        // match baseline of placeholder to input text
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 17.0
        paragraphStyle.maximumLineHeight  = 17.0
        
        placeholderAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSRange(location: 0,length: placeholderAttributedString.length))
        
        inputTextField.placeholderAttributedString =  placeholderAttributedString
    }


}

