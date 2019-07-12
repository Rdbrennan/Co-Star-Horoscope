//
//  ViewController.swift
//  Co-Star-App
//
//  Created by Robert Brennan on 7/10/19.
//  Copyright © 2019 Creatility. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift

class ViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    // Outlets & Variables
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    var helperClass = HelperFunctions()
    
    var slides:[Any] = []
    var slide1: UserSlide!
    var slide2: ZodiacSlide!
    var name: String = ""
    var zodiacSignMonth: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        scrollView.delegate = self
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    /*
     * Initialize Slides
     */
    func createSlides() -> [Any] {
        
        slide1 = Bundle.main.loadNibNamed("UserSlide", owner: self, options: nil)?.first as! UserSlide
        slide1.userName.delegate = self
        slide1.dateField.delegate = self
        slide2 = Bundle.main.loadNibNamed("ZodiacSlide", owner: self, options: nil)?.first as! ZodiacSlide
        slide1.picker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        
        // Zodiac Sun Setup
        let name = slide1.userName.text ?? "name"
        let zodiacSignMonth = slide1.picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: zodiacSignMonth)
        dateFormatter.dateFormat = "dd"
        let nameOfday: String = dateFormatter.string(from: zodiacSignMonth)
        let zodiaSun = helperClass.zodiacSigns(day: Int(nameOfday) ?? 9, Month: nameOfMonth ?? "April")
        slide2.zodiacText.text = "Hello \(name), your sun is in \(zodiaSun)."
        
        // UI/UX
        slide1.layer.shadowPath = UIBezierPath(rect: slide1.bounds).cgPath
        slide2.layer.shadowPath = UIBezierPath(rect: slide1.bounds).cgPath

        slide1.userName.keyboardAppearance = .dark
        slide1.layer.cornerRadius = 15
        slide1.clipsToBounds = true
        
        slide2.layer.cornerRadius = 15
        slide2.clipsToBounds = true
        
        return [slide1, slide2]
    }
    
    /*
     * Scroll view setup
     */
    func setupSlideScrollView(slides : [Any]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        let width = view.frame.width-80
        for i in 0 ..< slides.count {
            (slides[i] as! UIView).frame = CGRect(x: (view.center.x - (width/2))  + (view.frame.width * CGFloat(i)), y: 160, width: view.frame.width - 40, height: 290)
            scrollView.addSubview(slides[i] as! UIView)
        }
    }
    
    /*
     * Default function called when view is scolled
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    /*
     * Return value from text field upon pressing 'Done'
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name = textField.text!
        let space = "  \(name)" //Added space for UI Design
        textField.text = space
        
        // Update Zodiac phrase (Date could be default at this point)
        zodiacSignMonth = slide1.picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: zodiacSignMonth)
        dateFormatter.dateFormat = "dd"
        let nameOfday: String = dateFormatter.string(from: zodiacSignMonth)
        let zodiaSun = helperClass.zodiacSigns(day: Int(nameOfday) ?? 9, Month: nameOfMonth ?? "April")
        
        slide2.zodiacText.text = "Hello \(name), your sun is in \(zodiaSun)."
        self.view.endEditing(true)
        return false
    }
    
    /*
     * Return value from Date Picker upon pressing 'Done'
     */
    @objc func handleDatePicker(_ datePicker: UIDatePicker) {
        zodiacSignMonth = slide1.picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: datePicker.date)
        dateFormatter.dateFormat = "dd"
        let nameOfday: String = dateFormatter.string(from: datePicker.date)
        let zodiacSun = helperClass.zodiacSigns(day: Int(nameOfday) ?? 0, Month: nameOfMonth ?? "April")
        slide2.zodiacText.text = "Hello \(name), your sun is in \(zodiacSun)."
    }
}
