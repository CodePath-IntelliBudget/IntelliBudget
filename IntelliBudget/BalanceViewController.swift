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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.current()

        balance.text = "\(user?["money"] as! Float)"
        // Do any additional setup after loading the view.
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
