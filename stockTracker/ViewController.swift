//
//  ViewController.swift
//  stockTracker
//
// Created by Dewone Westerfield and Colette Smith.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var instructionLabel: UILabel!
    
    let tap = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(goToProfile))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(goToProfile))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(goToProfile))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(goToProfile))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)

        // DOUBLE TAP
        tap.numberOfTapsRequired = 3
        tap.addTarget(self, action: #selector(tripleTapped))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }

    @objc func tripleTapped(){
        instructionLabel.text = "Now swipe."
    }
    
    @objc func goToProfile(){
        self.performSegue(withIdentifier: "GoToProfileSegue", sender: nil)
    }}



