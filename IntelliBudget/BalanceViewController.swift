//
//  BalanceViewController.swift
//  IntelliBudget
//
//  Created by user165734 on 4/29/20.
//  Copyright © 2020 user165734. All rights reserved.
//

import UIKit
import Parse

class BalanceViewController: UIViewController {

    @IBOutlet weak var balance: UILabel!
    
    @IBOutlet weak var monthBalance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()

        balance.text =  String(format: "%.2f", user?["money"] as! Float)
        

                // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let user = PFUser.current()
        balance.text =  String(format: "%.2f", user?["money"] as! Float)
        
        
        let monthbalance = (user?["monthBalance"] as! NSNumber).floatValue
        monthBalance.text = String(format: "%.2f", monthbalance)
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }
}
