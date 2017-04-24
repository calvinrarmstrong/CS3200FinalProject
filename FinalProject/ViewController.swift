//
//  ViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 3/16/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for this view
        self.navigationItem.title = "Paydays"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for back button in next view
        self.navigationItem.title = "Back"
    }
    
}

