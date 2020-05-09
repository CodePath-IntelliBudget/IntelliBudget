//
//  PurchaseViewController.swift
//  IntelliBudget
//
//  Created by Joseph  DeMario on 4/25/20.
//  Copyright © 2020 user165734. All rights reserved.
//

import UIKit
import Parse

class PurchaseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var addStoreTextField: UITextField!
    @IBOutlet weak var addPriceTextField: UITextField!
    @IBOutlet weak var addDateTextField: UITextField!
    @IBOutlet weak var addCategoryTextField: UITextField!
    
    private var datePicker: UIDatePicker?
    
    let categories = ["Groceries", "Games", "Movies and TV", "Food", "Electronics", "Bills", "Around the house", "Accessories", "Gifts", "Other"]
    var categoryPicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(PurchaseViewController.dateChanged(datePicker:)), for: .valueChanged)
        addDateTextField.inputView = datePicker
        
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        addCategoryTextField.inputView = categoryPicker
       // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addCategoryTextField.text = categories[row]
        addCategoryTextField.resignFirstResponder()
    }
    
    @objc func dateChanged(datePicker: UIDatePicker)
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        addDateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPurchase(_ sender: Any)
    {
        
        let purchase = PFObject(className: "Purchase")
        purchase["store"] = addStoreTextField.text!
        purchase["price"] = addPriceTextField.text!
        purchase["date"] = addDateTextField.text!
        purchase["category"] = addCategoryTextField.text!
        purchase["user"] = PFUser.current()?.username
        
        purchase.saveInBackground { (success, error) in
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
