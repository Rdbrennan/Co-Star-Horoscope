//
//  UserSlide.swift
//  Co-Star-App
//
//  Created by Robert Brennan on 7/10/19.
//  Copyright © 2019 Creatility. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

class UserSlide: UIView, UITextViewDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var dateField: UITextField!
    
    let containerView = UIView()
    let cornerRadius: CGFloat = 6.0
    
    let picker = UIDatePicker()

    override func awakeFromNib() {
        super.awakeFromNib()
        createDatePicker()
        userName.text = ""
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        dateField.text = "  \(dateString)"
        endEditing(true)
        picker.setDate(Date(), animated: false)
        layoutView()
    }
    
    /*
     * Initialize DatePicker with toolbar
     */
    func createDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //donebutton
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action:
            #selector(donePressed))
        toolbar.setItems([done], animated: false)
        dateField.inputAccessoryView = toolbar
        dateField.inputView = picker
        //format for datepicker
        picker.datePickerMode = .date
    }
    
   /*
    * Format Date Output
    */
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        var space = " "
        dateField.text = "\(space)\(space)\(dateString)"
        endEditing(true)
    }

    /*
     * Set the shadow of the view's layer
     */
    func layoutView() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.03
        layer.shadowRadius = 4.0
    }
}
