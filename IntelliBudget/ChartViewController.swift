//
//  ChartViewController.swift
//  IntelliBudget
//
//  Created by Joseph  DeMario on 5/1/20.
//  Copyright © 2020 user165734. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {

    //var barChart = BarChartView()
    //var lineChart = LineChartView()
    var pieChart = PieChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //barChart.delegate = self
        //lineChart.delegate = self
        pieChart.delegate = self
        
        // Do any additional setup after loading the view.
    }
    /*
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        barChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        barChart.center = view.center
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x:Double(x), y:Double(x)))
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
    }
    */
    
    /*
    override func viewDidLayoutSubviews() {
        lineChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        lineChart.center = view.center
        view.addSubview(lineChart)
               
        var entries = [ChartDataEntry]()
               
        for x in 0..<10 {
            entries.append(ChartDataEntry(x:Double(x), y:Double(x)))
        }
               
        let set = LineChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
               
        let data = LineChartData(dataSet: set)
               
        lineChart.data = data
    }
     
     override func viewDidLayoutSubviews() {
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
            
        var entries = [ChartDataEntry]()
            
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x:Double(x), y:Double(x)))
        }
            
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
            
        let data = PieChartData(dataSet: set)
            
        pieChart.data = data
     }
    */
     override func viewDidLayoutSubviews() {
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
               
        var entries = [ChartDataEntry]()
               
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x:Double(x), y:Double(x)))
        }
               
        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
               
        let data = PieChartData(dataSet: set)
               
        pieChart.data = data
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
