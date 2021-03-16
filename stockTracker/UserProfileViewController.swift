//
//  UserProfileViewController.swift
//  stockTracker
//
//  Created by Dewone Westerfield and Colette Smith.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var quickButton: UIButton!
    @IBOutlet weak var longButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBAction func firstEditEnded(_ sender: UITextField) {
        let message = "First name is required."
        if let first = sender.text {
            if first.count >= 1 {
                firstName = first
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
                lastName = last
            } else {
                displayAlert(message)
            }
        }
        sender.resignFirstResponder()
    }
    
    @IBAction func continueClicked(_ sender: UIButton) {
        if firstNameLabel.text!.count == 0 {
            displayAlert("First name is required.")
        }
        
        if lastNameLabel.text!.count == 0 {
            displayAlert("Last name is required.")
        }
        
        if !quickButton.isSelected && !longButton.isSelected {
            displayAlert("Choose an investment style.")
        }
        
        else {
            firstName = firstNameLabel.text!
            lastName = lastNameLabel.text!
            self.performSegue(withIdentifier: "toTabBarSegue", sender: nil)        }
    }
    
    @IBAction func quickMoneyClicked(_ sender: UIButton) {
        isQuick = true
        quickButton.isSelected = true
        longButton.isSelected = false
    }
    
    @IBAction func longTermClicked(_ sender: UIButton) {
        isQuick = false
        quickButton.isSelected = false
        longButton.isSelected = true
    }
    
    func displayAlert(_ message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil));
        self.present(alert, animated: true, completion: nil);
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.layer.cornerRadius = 10
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
