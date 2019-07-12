//
//  zodiacSlide.swift
//  Co-Star-App
//
//  Created by Robert Brennan on 7/10/19.
//  Copyright © 2019 Creatility. All rights reserved.
//

import UIKit

class ZodiacSlide: UIView {
    @IBOutlet weak var zodiacText: UILabel!
    
    let containerView = UIView()
    let cornerRadius: CGFloat = 6.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layoutView()
    }
    
    func layoutView() {
        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.03
        layer.shadowRadius = 4.0
    }

}
