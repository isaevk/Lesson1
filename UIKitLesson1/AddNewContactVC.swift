//
//  AddNewContactVC.swift
//  UIKitLesson1
//
//  Created by Kirill Dev on 14.12.2022.
//

import UIKit

final class AddNewContactVC: UIViewController {
    
    private let age = Array(1...100)
    
    private let gender = ["Male", "Female"]
    
    private let logoNewContact = UIImageView()
    
    private let changeImage = UIButton()
    
    private let nameLabel = UILabel()
    
    private let nameTxtField = UITextField()
    
    private let dateLabel = UILabel()
    
    private let dateTxtField = UITextField()
    
    private let agePicker = UIPickerView()
    
    private let ageLabel = UILabel()
    
    private let ageTxtField = UITextField()
    
    private let sexLabel = UILabel()
    
    private let sexTxtField = UITextField()
    
    private let sexPicker = UIPickerView()
    
    private let instLabel = UILabel()
    
    private let instTxtField = UITextField()
    
    private let instAlert = UIAlertController()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .infinite)
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewParameters()
    }
    
    private func setViewParameters() {
        view.backgroundColor = .white
        logoImage()
        changePhoto()
        addContactButton()
        setName()
        setDate()
        setAge()
        setSex()
        setInst()
    }
    
    
    private func logoImage() {
        logoNewContact.image = UIImage(named: "new-contact")
        logoNewContact.frame = CGRect(x: 140, y: 150, width: 100, height: 100)
        view.addSubview(logoNewContact)
    }
    
    private func changePhoto() {
        changeImage.setTitle("Change photo", for: .normal)
        changeImage.setTitleColor(.systemPink, for: .normal)
        changeImage.frame = CGRect(x: 125, y: 255, width: 120, height: 20)
        view.addSubview(changeImage)
    }
    
    // MARK: - Set Name
    private func setName() {
        nameLabel.text = "Name"
        nameLabel.textColor = .systemPink
        nameLabel.frame = CGRect(x: 30, y: 330, width: 50, height: 20)
        view.addSubview(nameLabel)
        
        nameTxtField.placeholder = "Please enter name"
        nameTxtField.frame = CGRect(x: 30, y: 355, width: 300, height: 30)
        nameTxtField.addBottomBorder()
        view.addSubview(nameTxtField)
    }
    
    // MARK: - Set Date
    private func setDate() {
        dateLabel.text = "Date"
        dateLabel.textColor = .systemPink
        dateLabel.frame = CGRect(x: 30, y: 400, width: 50, height: 20)
        view.addSubview(dateLabel)
        
        dateTxtField.frame = CGRect(x: 30, y: 425, width: 300, height: 30)
        dateTxtField.placeholder = "Please select a date"
        dateTxtField.addBottomBorder()
        dateTxtField.inputView = datePicker
        view.addSubview(dateTxtField)
        
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    
    // MARK: - Set Age
    private func setAge() {
        ageLabel.text = "Age"
        ageLabel.textColor = .systemPink
        ageLabel.frame = CGRect(x:30 , y: 470, width: 50, height: 20)
        view.addSubview(ageLabel)
        
        ageTxtField.placeholder = "Please select an age"
        ageTxtField.frame = CGRect(x: 30, y: 495, width: 300, height: 30)
        ageTxtField.addBottomBorder()
        ageTxtField.inputView = agePicker
        view.addSubview(ageTxtField)
        
        agePicker.delegate = self
        agePicker.dataSource = self
    }
    
    // MARK: - Set Sex
    private func setSex() {
        sexLabel.text = "Sex"
        sexLabel.textColor = .systemPink
        sexLabel.frame = CGRect(x: 30, y: 540, width: 50, height: 20)
        view.addSubview(sexLabel)
        
        sexTxtField.placeholder = "Please select sex"
        sexTxtField.frame = CGRect(x: 30, y: 565, width: 300, height: 30)
        sexTxtField.addBottomBorder()
        sexTxtField.inputView = sexPicker
        view.addSubview(sexTxtField)
        
        sexPicker.delegate = self
        sexPicker.dataSource = self
    }
    
    // MARK: - Set Inst
    private func setInst() {
        instLabel.text = "Instagram"
        instLabel.textColor = .systemPink
        instLabel.frame = CGRect(x: 30, y: 610, width: 80, height: 20)
        view.addSubview(instLabel)
        
        instTxtField.placeholder = "Add Instagram"
        instTxtField.frame = CGRect(x: 30, y: 635, width: 300, height: 30)
        instTxtField.addBottomBorder()
        instTxtField.addTarget(self, action: #selector(addInst), for: .touchDown)
        view.addSubview(instTxtField)
        
    }
    
    // MARK: - Add date in dateUITextField
    @objc private func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateTxtField.text = dateFormatter.string(from: sender.date)
    }
    
    
    // MARK: - Add contact button + alert
    private func addContactButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        let alert = UIAlertController(title: "Contact added", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    // MARK: - Add Instagramm for inst text field
    @objc private func addInst() {
        let alert = UIAlertController(title: "Enter username for Instagram", message: "", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { action in
            self.instTxtField.text = alert.textFields?.first?.text
        }
        
        alert.addTextField() { textField in
            textField.placeholder = "For example @alina_vetrova"
            
        }
        alert.addAction(actionCancel)
        alert.addAction(actionOk)
        present(alert, animated: true)
    }
}



// MARK: - UIPickerViewDataSource + UIPickerViewDelegate
extension AddNewContactVC: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows: Int = age.count
        if pickerView == sexPicker {
            countrows = gender.count
        }
        return countrows
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            let titleRow = String(age[row])
            return titleRow
        } else if pickerView == sexPicker {
            let titleRow = gender[row]
            return titleRow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePicker {
            ageTxtField.text = String(age[row])
            ageTxtField.resignFirstResponder()
        } else if pickerView == sexPicker {
            sexTxtField.text = gender[row]
            sexTxtField.resignFirstResponder()
        }
        
    }
}




