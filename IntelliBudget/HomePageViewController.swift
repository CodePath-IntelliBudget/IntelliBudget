//
//  HomePageViewController.swift
//  IntelliBudget
//
//  Created by Joseph  DeMario on 4/19/20.
//  Copyright © 2020 user165734. All rights reserved.
//

import UIKit
import Parse

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var purchases = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        PFUser.logOut()
        print(PFUser.current())
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginViewController
        
        //UserDefaults.standard.set(false, forKey: "userLoggedIn")
        print("Logging out")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell") as! PurchaseCell
        
        let purchase = purchases[indexPath.row]
        //let store = purchase[] as! String
        let price = purchase
        let date = purchase
        let category = purchase
        
        //cell.textLabel!.text = store
        
        return cell
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
