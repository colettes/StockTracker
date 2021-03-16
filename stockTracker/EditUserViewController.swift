//
//  EditUseViewController.swift
//  stockTracker
//
//  Created by Dewone Westerfield and Colette Smith.
//

import UIKit

class EditUserViewController: UIViewController {

    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var quickButton: UIButton!
    @IBOutlet weak var longButton: UIButton!
    @IBOutlet weak var saveEditButton: UIButton!
    
    var tempFirst: String!
    var tempLast: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameText.isEnabled = false
        lastNameText.isEnabled = false
        quickButton.isEnabled = false
        longButton.isEnabled = false


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        firstNameText.text = firstName
        tempFirst = firstName
        firstNameText.sizeToFit()
        lastNameText.text = lastName
        tempLast = lastName
        lastNameText.sizeToFit()
        saveEditButton.layer.cornerRadius = 10
        if isQuick {
            quickButton.isSelected = true
            longButton.isSelected = false
        } else {
            longButton.isSelected = true
            quickButton.isSelected = false
        }
    }
    
    @IBAction func quickMoneyClicked(_ sender: UIButton) {
        quickButton.isSelected = true
        longButton.isSelected = false
    }
    
    @IBAction func longTermClicked(_ sender: UIButton) {
        quickButton.isSelected = false
        longButton.isSelected = true
    }
    
    @IBAction func saveEditClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == "Edit" {
            firstNameText.isEnabled = true
            lastNameText.isEnabled = true
            quickButton.isEnabled = true
            longButton.isEnabled = true
            sender.setTitle("Save", for: .normal)
        } else {
            firstName = firstNameText.text!
            lastName = lastNameText.text!
            firstNameText.isEnabled = false
            lastNameText.isEnabled = false
            quickButton.isEnabled = false
            longButton.isEnabled = false
            firstName = tempFirst
            lastName = tempLast
            isQuick = quickButton.isSelected
            sender.setTitle("Edit", for: .normal)
        }
    }
    

    @IBAction func firstEditEnded(_ sender: UITextField) {
        let message = "First name is required."
        if let first = sender.text {
            if first.count >= 1 {
                tempFirst = first
            } else {
                displayAlert(message)
            }
        }
        sender.resignFirstResponder()
    }
    
    @IBAction func lastEditEnded(_ sender: UITextField) {
        let message = "Last name is required."
        if let last = sender.text {
            if last.count >= 1 {
                tempLast = last
            } else {
                displayAlert(message)
            }
        }
        sender.resignFirstResponder()
    }
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil));
        self.present(alert, animated: true, completion: nil);
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
