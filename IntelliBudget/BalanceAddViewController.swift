//
//  BalanceAddViewController.swift
//  IntelliBudget
//
//  Created by user165734 on 4/29/20.
//  Copyright © 2020 user165734. All rights reserved.
//

import UIKit
import Parse

class BalanceAddViewController: UIViewController {

    @IBOutlet weak var addBalance: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func addBalance(_ sender: Any) {
        //get current user balance
        let user = PFUser.current()
        let balance = user?["money"] as! Float
        if (addBalance.text != " ") {
            let new: Float! = Float(self.addBalance.text!)
            
            //assign new value
            user?["money"] = new + balance
            user?.saveInBackground { (success, error) in
                if success
                {
                    print("saved")
                }
                else
                {
                    print("error")
                }
            }
            dismiss(animated: true, completion: nil)
        }
        
        
        
        
        
    }
    
    @IBAction func cancelBalance(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
