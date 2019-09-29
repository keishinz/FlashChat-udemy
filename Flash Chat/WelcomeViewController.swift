//
//  WelcomeViewController.swift
//  Flash Chat
//
//  This is the welcome view controller - the first thign the user sees
//

import UIKit
import Firebase



class WelcomeViewController: UIViewController {


    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "goToChat", sender: nil)
        }
//        _ = Auth.auth().addStateDidChangeListener({ (auth, user) in
//            if user != nil {
//                self.performSegue(withIdentifier: "goToChat", sender: nil)
//            }
//        })
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
