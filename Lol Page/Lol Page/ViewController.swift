//
//  ViewController.swift
//  Lol Page
//1.continuing a our existing project of login flow in iOS with storyboard add constraints to ur existing designed screens
/*2. Create a new screen for list
3 have multiple sections in it and try to design ui similar like setting screen for iPhone
4. Show use of segues on button click
5. Show use of programmatic screen navigation
6. Also pass data from one screen to another both with using segues and programmatic navigation*/
//  Created by Tony Lieu on 10/30/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emaillabel: UITextField!
    //var emailID:String = ""
    @IBOutlet weak var passwordinput: UITextField!
    //var passwordID:String = ""
    override func viewDidLoad() {
        self.title = "Login TrashCan"
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            // self.title = "Login Screen"
    }
    @IBAction func LoginButton(_ sender: Any) {
        print("login Button tapped")
        let emailID = emaillabel.text ?? ""
        print("\(emailID)")
    }//how to pass data between views
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmailSegue"{
            if let LoginpageViewController = segue.destination as? LoginpageViewController{
                LoginpageViewController.emailData = emaillabel.text
                LoginpageViewController.passwordData = passwordinput.text
            }
        }
    }

}
