//
//  InfoGoastViewController.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 08.12.2022.
//

import UIKit

class InfoGoastViewController: UIViewController {
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var guestsTxtField: UITextField!
    @IBOutlet weak var tableTxtField: UITextField!
    @IBOutlet weak var bookedSwitch: UISwitch!
    @IBOutlet weak var prepaySwitch: UISwitch!
    @IBOutlet weak var vipSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func invoceButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let checkViewController = storyBoard.instantiateViewController(identifier: "checkView") as! CheckViewController
        let alert = UIAlertController(title: "Bill it?", message: "", preferredStyle: .alert)
        let actionAlertYes = UIAlertAction(title: "Yes", style: .default) { action in
            self.navigationController?.pushViewController(checkViewController, animated: true)
            checkViewController.name += self.nameTxtField.text ?? "not data"
            checkViewController.guests += self.guestsTxtField.text ?? "not data"
            checkViewController.table += self.tableTxtField.text ?? "not data"
            self.switchChange(param: self.bookedSwitch, text: &checkViewController.booked)
            self.switchChange(param: self.prepaySwitch, text: &checkViewController.prepay)
            self.switchChange(param: self.vipSwitch, text: &checkViewController.vip)
            
        }
        let actionAlertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionAlertYes)
        alert.addAction(actionAlertCancel)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    func switchChange(param: UISwitch, text: inout String){
        if param.isOn {
            text += "Yes"
        } else {
            text += "NO"
        }
    }
    
    
}


