//
//  SetReoccuringViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 3/29/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit

class SetReoccuringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for this view
        self.navigationItem.title = "Set Reoccuring Paydays"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for back button in next view
        self.navigationItem.title = "Back"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
