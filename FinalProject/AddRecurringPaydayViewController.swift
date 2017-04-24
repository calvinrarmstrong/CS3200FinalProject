//
//  AddRecurringPaydayViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 4/5/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit
import RealmSwift

class AddRecurringPaydayViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var numDaysTextField: UITextField!
    @IBOutlet weak var paydatePicker: UIDatePicker!
    @IBOutlet weak var repeatPicker: UIPickerView!
    
    
    var repeatOptions = ["None", "Month", "Two Weeks", "Week"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.sizeToFit()
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        numDaysTextField.inputAccessoryView = toolBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        paydatePicker.maximumDate = Date()
    }
    
    func doneClicked()
    {
        self.view.endEditing(true)
    }

    @IBAction func SavePayday(_ sender: Any) {
        
        let realm = try! Realm()
        
        let payday = Payday()
        payday.paydate = paydatePicker.date
        payday.reoccurrence = repeatPicker.selectedRow(inComponent: 0)
        
        try! realm.write {
            realm.add(payday)
        }
        
        navigationController?.popViewController(animated: true)
        
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

extension AddRecurringPaydayViewController: UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return repeatOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return repeatOptions[row]
    }
    
}
