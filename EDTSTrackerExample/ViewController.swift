//
//  ViewController.swift
//  EDTSTrackerExample
//
//  Created by Victor Toya on 13/07/22.
//

import UIKit
import EDTSTracker

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtHost: UITextField!
    @IBOutlet weak var txtToken: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtHost.delegate = self
        txtToken.delegate = self
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func btnConfigureTapped(_ sender: Any) {
        if txtHost.text == "" || txtHost.text == nil {
            showAlert(title: "Warning", message: "Please fill URL Host")
        } else if txtToken.text == "" || txtToken.text == nil {
            showAlert(title: "Warning", message: "Please fill Token")
        } else {
            if let urls = URL(string: txtHost.text!) {
                EDTSTracking.sharedInstance.configure(host: urls, token: txtToken.text!, headerType: .xAPIKey)
                EDTSTracking.sharedInstance.synchronizeTrackingData()
                
                let trackerViewController = TrackerViewController()
                trackerViewController.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(trackerViewController, animated: true)
            } else {
                showAlert(title: "Warning", message: "Please fill valid URL Host")
            }
        }
    }
}
