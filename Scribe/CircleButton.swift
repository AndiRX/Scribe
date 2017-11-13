//
//  CircleButton.swift
//  Scribe
//
//  Created by Petr on 13.11.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet {
                    self.layer.cornerRadius = cornerRadius
            
        }
    }
    
//    override func prepareForInterfaceBuilder() {
//        
//        
//    }
//    
//    func setupView() {
//
//    }
    
}
