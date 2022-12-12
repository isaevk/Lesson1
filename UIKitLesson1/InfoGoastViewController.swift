//
//  InfoGoastViewController.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 08.12.2022.
//

import UIKit

final class InfoGoastViewController: UIViewController {
    
    @IBOutlet private var nameTxtField: UITextField!
    @IBOutlet private var guestsTxtField: UITextField!
    @IBOutlet private var tableTxtField: UITextField!
    @IBOutlet private var bookedSwitch: UISwitch!
    @IBOutlet private var prepaySwitch: UISwitch!
    @IBOutlet private var vipSwitch: UISwitch!
    

    @IBAction func invoceButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let checkViewController = storyBoard.instantiateViewController(identifier: "checkView") as CheckViewController
        let alert = UIAlertController(title: "Bill it?", message: "", preferredStyle: .alert)
        let actionAlertYes = UIAlertAction(title: "Yes", style: .default) { [weak self] action  in
            self?.navigationController?.pushViewController(checkViewController, animated: true)
            checkViewController.checkInfo.name += self?.nameTxtField.text ?? "not data"
            checkViewController.checkInfo.guests += self?.guestsTxtField.text ?? "not data"
            checkViewController.checkInfo.table += self?.tableTxtField.text ?? "not data"
            checkViewController.checkInfo.booked += (self?.switchChange(param: (self?.bookedSwitch)!))!
            checkViewController.checkInfo.prepay += (self?.switchChange(param: (self?.prepaySwitch)!))!
            checkViewController.checkInfo.vip += (self?.switchChange(param: (self?.vipSwitch)!))!
        }
        
        let actionAlertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionAlertYes)
        alert.addAction(actionAlertCancel)
        present(alert, animated: true, completion: nil)
        
    }
    func switchChange(param: UISwitch) -> String {
        var result = ""
        param.isOn ? (result = "Yes") : (result = "NO")
        return result
    }
    
    
}


