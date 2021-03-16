//
//  userProfile.swift
//  stockTracker
//
//  Created by Dewone Westerfield on 3/9/21.
//

import UIKit

class UserProfile: UIView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if let context = UIGraphicsGetCurrentContext(){
            context.setLineWidth(4);
            let profilePicture = CGRect(x: 135, y: 100, width: 120, height: 120);
            context.fillEllipse(in: profilePicture);
        }
    }
    

}
