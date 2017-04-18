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
        // Do any additional setup after loading the view, typically from a nib.
        /*let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [#colorLiteral(red: 0.03412822634, green: 0.2517896295, blue: 0.6118810773, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0.7775335908, blue: 1, alpha: 1).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)*/
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

