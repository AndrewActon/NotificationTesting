//
//  ViewController.swift
//  NotificationsTest
//
//  Created by Andrew Acton on 1/21/23.
//

import UIKit

class ViewController: UIViewController {

    let notificationManager = NotificationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("localNotificationFired"), object: nil, queue: OperationQueue.main) { [weak self] (note) in
            guard let userInfo = note.userInfo,
                  let message = userInfo["message"] as? String else { return }
            
            let alert = UIAlertController(title: "Local Notification", message: message, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "OK", style: .cancel)
            alert.addAction(cancel)
            
            DispatchQueue.main.async {
                self?.present(alert, animated: true, completion: nil)
            }
            
            
        }
        // Do any additional setup after loading the view.
    }


    @IBAction func requestPermissionTapped(_ sender: Any) {
        notificationManager.requestPermission()
    }
    
    @IBAction func sendLocalNotificationButtonTapped(_ sender: Any) {
        notificationManager.fireNotification()
    }
    
}

