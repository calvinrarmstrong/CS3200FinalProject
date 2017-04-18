//
//  AddRecurringPaydayViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 4/5/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit

class AddRecurringPaydayViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var numDaysTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.sizeToFit()
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        numDaysTextField.inputAccessoryView = toolBar
    }
    
    func doneClicked()
    {
        self.view.endEditing(true)
    }

}

extension AddRecurringPaydayViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        let point = CGPoint(x: 0, y: 225)
        scrollView.setContentOffset(point, animated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let point = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(point, animated: true)
    }
}
