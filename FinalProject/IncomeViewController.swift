//
//  IncomeViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 3/29/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController {

    @IBOutlet weak var DollarLabel: UILabel!
    @IBOutlet weak var IncomeTextField: UITextField!
    @IBOutlet weak var incomeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewDidLayoutSubviews() {
        incomeView.layer.borderWidth = 1
        incomeView.layer.cornerRadius = 5
        incomeView.layer.borderColor = #colorLiteral(red: 0.0158147756, green: 0.7372249365, blue: 0.005748447962, alpha: 1).cgColor
        let maskPath = UIBezierPath(roundedRect: incomeView.bounds,
                                    byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight],
                                    cornerRadii: CGSize(width: 5.0, height: 5.0))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        incomeView.layer.mask = shape

        let toolBar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.sizeToFit()
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        IncomeTextField.inputAccessoryView = toolBar
    }
    
    func doneClicked()
    {
        self.view.endEditing(true)
    }


}
