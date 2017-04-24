//
//  SetReoccuringViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 3/29/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit
import RealmSwift

class SetReoccuringViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var payday: Results<Payday>!
    var repeatOptions = ["", "Monthly", "Bi-Weekly", "Every Week"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        payday = realm.objects(Payday.self)
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
        self.tableView.reloadData()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for back button in next view
        self.navigationItem.title = "Back"
    }
}

extension SetReoccuringViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payday.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyy"
        cell.textLabel?.text = formatter.string(from: payday[indexPath.row].paydate!)
        if(payday[indexPath.row].reoccurrence >= 0 && payday[indexPath.row].reoccurrence < repeatOptions.count)
        {
            cell.detailTextLabel?.text = repeatOptions[payday[indexPath.row].reoccurrence]
        }
        return cell
    }
}
