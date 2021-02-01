//
//  LaunchViewController.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 29.01.2021.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        passAccess()
    }
    
    func passAccess(){
        if NetworkMonitor.shared.isConnected{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.performSegue(withIdentifier: "goMain", sender: nil)
            }
        }
        else{
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Connection", message: "Please check your internet connection.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
             }
           }
        }
    }

