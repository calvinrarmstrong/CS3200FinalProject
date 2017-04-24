//
//  AddBill.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 4/24/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import Foundation
import UIKit

class AddBill : UIViewController
{
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Add a Bill"
    }
}
