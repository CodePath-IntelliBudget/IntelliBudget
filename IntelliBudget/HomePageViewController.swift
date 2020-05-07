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
    var purchases = [PFObject]()


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
    
    // query for the purchases in the database
<<<<<<< HEAD
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
           
=======
    override func viewWillAppear(_ animated: Bool) {
           super.viewDidAppear(animated)

>>>>>>> 9b6e71a6c107bc8161ccb4b2ecc081d16c5366f5
        // get current user
        let user = PFUser.current()?.username

        let query = PFQuery(className:"Purchase")
        query.includeKeys(["store","price","category","date","user"])
        query.whereKey("user", equalTo:user)
        query.findObjectsInBackground { (purchases, error) in
        if purchases != nil {
            self.purchases = purchases!
            self.tableView.reloadData()
            }
        }

        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return purchases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // return desired height for your cell
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let purchase = purchases[indexPath.section]
        if purchases.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell") as! PurchaseCell
            
  
        
            //update data
            cell.storeLabel.text = purchase["store"] as? String
            cell.priceLabel.text = purchase["price"] as? String
            cell.dateLabel.text = purchase["date"] as? String
            cell.categoryLabel.text = purchase["category"] as? String

            return cell
                
            
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseCell") as! PurchaseCell
            
            
            return cell
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
