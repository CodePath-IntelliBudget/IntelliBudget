//
//  ChartViewController.swift
//  IntelliBudget
//
//  Created by Joseph  DeMario on 5/1/20.
//  Copyright © 2020 user165734. All rights reserved.
//

import UIKit
import Charts
import Parse

class ChartViewController: UIViewController, ChartViewDelegate {

    //var barChart = BarChartView()
    //var lineChart = LineChartView()
    var pieChart = PieChartView()
    var purchases = [PFObject]()
    //create a dictionary
    var categories = ["Groceries" : 0.0, "Games": 0.0, "Movies and TV": 0.0, "Food": 0.0, "Electronics": 0.0, "Bills": 0.0, "Around the house": 0.0, "Accessories": 0.0, "Gifts": 0.0, "Other": 0.0]

    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self

        // Do any additional setup after loading the view.
    }
    
    // query for the purchases in the database
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        
        //attempt to auto update the chart
            pieChart.clearValues()
            self.viewDidLayoutSubviews()
           
    }
    
    override func viewDidLayoutSubviews() {
       pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
       pieChart.center = view.center
       view.addSubview(pieChart)
            
        var entries = [ChartDataEntry]()

        // get current user
        let user = PFUser.current()?.username
               
        let query = PFQuery(className:"Purchase")
        query.includeKeys(["store","price","category","date","user"])
        query.whereKey("user", equalTo:user)
        query.findObjectsInBackground { (purchases, error) in
            if purchases != nil {
                for purchase in purchases! {
                    let category = purchase["category"] as! String
                    let price = purchase["price"] as! String
                    let temp = Double(price)!
                    let categoryCost = self.categories[category]! + temp
                    self.categories.updateValue(categoryCost, forKey: category)
                    
 
                }
                
                for (key,value) in self.categories {
                    if(value > 0.0 ) {
                        print(key , " " ,value)
                        entries.append( PieChartDataEntry(value: value, label: key))
                    }
                }
                print(self.categories)
                   
                          
                let set = PieChartDataSet(entries: entries, label: " ")
                var  colors: [UIColor] = [UIColor.green, UIColor.blue, UIColor.red, UIColor.yellow, UIColor.orange, UIColor.purple, UIColor.systemPink, UIColor.gray, UIColor.cyan, UIColor.systemTeal]
    
                set.colors = colors
                   
                let data = PieChartData(dataSet: set)
                   
                self.pieChart.data = data
                self.pieChart.data?.setValueTextColor(NSUIColor.black)
                self.pieChart.drawEntryLabelsEnabled = false
                self.pieChart.legend.orientation = .vertical
                self.pieChart.notifyDataSetChanged()
                }
            }
                   
        



    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
