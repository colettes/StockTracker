//
//  UserInfo.swift
//  stockTracker
//
//  Created by Dewone Westerfield on 3/12/21.
//

import Foundation

class SecureInfo{
    var firstName : String;
    var lastName  : String;
    var emailAddress : String;
    var passWord : String;
    var userName : String;
    init(firstName:String,lastName:String,emailAddress:String,
         passWord:String,userName:String) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.emailAddress = emailAddress;
        self.passWord = passWord;
        self.userName = userName;
    }
}
