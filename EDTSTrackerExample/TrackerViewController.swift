//
//  TrackerViewController.swift
//  EDTSTrackerExample
//
//  Created by Victor Toya on 13/07/22.
//

import UIKit
import EDTSTracker

class TrackerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUserId: UITextField!
    @IBOutlet weak var txtUTM: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSort: UITextField!
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var txtException: UITextField!
    @IBOutlet weak var txtStackTrace: UITextField!
    @IBOutlet weak var txtEventDetail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserId.delegate = self
        txtUTM.delegate = self
        txtName.delegate = self
        txtSort.delegate = self
        txtValue.delegate = self
        txtException.delegate = self
        txtStackTrace.delegate = self
        txtEventDetail.delegate = self
    }
    
    func checkUserIDValue() {
        if txtUserId.text != nil && txtUserId.text != "" {
            EDTSTracking.sharedInstance.setUserId(userId: txtUserId.text!)
        }
    }
    
    func checkUTMValue() {
        if txtUTM.text != nil && txtUTM.text != "" {
            EDTSTracking.sharedInstance.setUTMInfo(utm: txtUTM.text!)
        }
    }
    
    func checkNameValue() -> Bool {
        if txtName.text != nil && txtName.text != "" {
            return true
        } else {
            showAlert(title: "Warning", message: "Please fill event name")
            return false
        }
    }
    
    func checkSortValue() -> Bool {
        if txtSort.text != nil && txtSort.text != "" {
            return true
        } else {
            showAlert(title: "Warning", message: "Please fill event sort")
            return false
        }
    }
    
    func checkValue() -> Bool {
        if txtValue.text != nil && txtValue.text != "" {
            return true
        } else {
            showAlert(title: "Warning", message: "Please fill event value")
            return false
        }
    }
    
    func checkExceptionValue() -> Bool {
        if txtException.text != nil && txtException.text != "" {
            return true
        } else {
            showAlert(title: "Warning", message: "Please fill error exception")
            return false
        }
    }
    
    func checkStackTraceValue() -> Bool {
        if txtStackTrace.text != nil && txtStackTrace.text != "" {
            return true
        } else {
            showAlert(title: "Warning", message: "Please fill error stack trace")
            return false
        }
    }
    
    func checkEventDetailValue() -> Bool {
        if txtEventDetail.text != nil && txtEventDetail.text != "" {
            return true
        } else {
            showAlert(title: "Warning", message: "Please fill event detail")
            return false
        }
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
    
    @IBAction func btnEventPageViewTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() {
            EDTSTracking.sharedInstance.sendEventPageView(name: txtName.text!)
        }
    }
    
    @IBAction func btnEventImpressionTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() {
            EDTSTracking.sharedInstance.sendEventImpression(name: txtName.text!, impressions: nil)
        }
    }
    
    @IBAction func btnEventAppActivityTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() {
            EDTSTracking.sharedInstance.sendEventAppActivity(name: txtName.text!)
        }
    }
    
    @IBAction func btnClickLinkTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() {
            EDTSTracking.sharedInstance.sendEventClickLink(name: txtName.text!)
        }
    }
    
    @IBAction func btnEventFilterSortTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() && checkSortValue() {
            EDTSTracking.sharedInstance.sendEventFilterSort(name: txtName.text!, sort: txtSort.text!)
        }
    }
    
    @IBAction func btnEventFilterValueTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() && checkValue() {
            EDTSTracking.sharedInstance.sendEventFilterValue(name: txtName.text!, list: [txtValue.text!])
        }
    }
    
    @IBAction func btnEventSubmissionTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() {
            EDTSTracking.sharedInstance.sendEventSubmission(name: txtName.text!, status: nil, failed: nil)
        }
    }
    
    @IBAction func btnEventPageDetailTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() {
            EDTSTracking.sharedInstance.sendEventPageDetail(name: txtName.text!, details: nil)
        }
    }
    
    @IBAction func btnEventErrorTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkExceptionValue() && checkStackTraceValue() {
            EDTSTracking.sharedInstance.sendEventError(exception: txtException.text!, stackTrace: txtStackTrace.text!)
        }
    }
    
    @IBAction func btnEventBackendDataTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() && checkEventDetailValue() {
            EDTSTracking.sharedInstance.sendEventBackendData(name: txtName.text!, eventDetails: txtEventDetail.text!, details: nil)
        }
    }
    
    @IBAction func btnEventCustomTapped(_ sender: Any) {
        checkUTMValue()
        checkUserIDValue()
        
        if checkNameValue() && checkEventDetailValue() {
            EDTSTracking.sharedInstance.sendEventCustom(name: txtName.text!, eventDetails: txtEventDetail.text!)
        }
    }
}
