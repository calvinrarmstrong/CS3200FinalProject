//
//  SetManualViewController.swift
//  FinalProject
//
//  Created by Calvin Armstrong on 3/29/17.
//  Copyright © 2017 Calvin Armstrong. All rights reserved.
//

import UIKit
import JTAppleCalendar

class SetManualViewController: UIViewController {

    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView") // Registering your cell is manditory
        calendarView.registerHeaderView(xibFileNames: ["MonthHeaderView"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for this view
        self.navigationItem.title = "Set Paydays Manually"
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Set Title for back button in next view
        self.navigationItem.title = "Back"
    }

}


extension SetManualViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    //tipical setup
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let startDate = Date() // You can use date generated from a formatter
        let endDate = formatter.date(from: "2018 01 01")!                 // You can also use dates created from this function
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6, // Only 1, 2, 3, & 6 are allowed
            calendar: Calendar.current,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .sunday)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        let myCustomCell = cell as! CellView
        
        // Setup Cell text
        myCustomCell.dayLabel.text = cellState.text
        
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func handleCellTextColor(view: JTAppleDayCellView?, cellState: CellState) {
        
        guard let myCustomCell = view as? CellView  else {
            return
        }
        
        if cellState.isSelected {
            if(myCustomCell.selectedView.isHidden)
            {
                myCustomCell.dayLabel.textColor = UIColor(cgColor: #colorLiteral(red: 0.0158147756, green: 0.7372249365, blue: 0.005748447962, alpha: 1).cgColor)
            }
            else
            {
                myCustomCell.dayLabel.textColor = UIColor(cgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor)
            }
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                
                myCustomCell.dayLabel.textColor = UIColor(cgColor: #colorLiteral(red: 0.0158147756, green: 0.7372249365, blue: 0.005748447962, alpha: 1).cgColor)
            } else {
                myCustomCell.dayLabel.textColor = UIColor(cgColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor)
            }
        }
    }
    
    // Function to handle the calendar selection
    func handleCellSelection(view: JTAppleDayCellView?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        if cellState.isSelected {
            myCustomCell.selectedView.layer.cornerRadius =  25
            if(myCustomCell.selectedView.isHidden)
            {
                myCustomCell.selectedView.isHidden = false
            }
            else
            {
                myCustomCell.selectedView.isHidden = true
            }
        } else {
            myCustomCell.selectedView.isHidden = true
        }
    }
    
    // This sets the height of your header
    func calendar(_ calendar: JTAppleCalendarView, sectionHeaderSizeFor range: (start: Date, end: Date), belongingTo month: Int) -> CGSize {
        return CGSize(width: 200, height: 80)
    }
    
    // This setups the display of your header
    func calendar(_ calendar: JTAppleCalendarView, willDisplaySectionHeader header: JTAppleHeaderView, range: (start: Date, end: Date), identifier: String) {
        let headerCell = (header as? MonthHeaderView)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "MMMM"
        headerCell?.monthLabel.text = formatter.string(from: range.start)
    }
}
