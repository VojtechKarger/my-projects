//
//  addViewController.swift
//  custom calendar
//
//  Created by vojta on 02.02.2021.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate {
   
    var titleLabel : UILabel!
    var actionView : UIView!
    var datePicker : UIDatePicker!
    var textField : UITextField!
    var okButton : UIButton!
    var cancelButton : UIButton!
    var stackView : UIView!
    
    let defaults = UserDefaults.standard
    let screenSize: CGRect = UIScreen.main.bounds
    let margins : CGFloat = 15
    var datum : String {
        get{
            let formater = DateFormatter()
            formater.dateStyle = .medium
            formater.timeStyle = .short
            formater.locale = Locale(identifier: "en_GB")
            return formater.string(from: datePicker.date)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        actionView = UIView()
        actionView.translatesAutoresizingMaskIntoConstraints = false
        actionView.backgroundColor = .systemGray5
        actionView.layer.cornerRadius = 22
        actionView.layer.borderWidth = 1
        actionView.layer.borderColor = UIColor.systemGray4.cgColor
        view.addSubview(actionView)
        
        
        
        datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        actionView.addSubview(datePicker)
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.inline
        datePicker.locale = Locale(identifier: "en_CZ")
        
        textField = UITextField()
        textField.placeholder = "type your remainder"
        textField.delegate = self
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        actionView.addSubview(textField)
        
        okButton = UIButton()
        okButton.translatesAutoresizingMaskIntoConstraints = false
        okButton.setTitle("  Ok  ", for: .normal)
        okButton.setTitleColor(.systemGreen, for: .normal)
        okButton.layer.cornerRadius = 7
        okButton.layer.borderWidth = 2
        okButton.layer.borderColor = UIColor.systemGreen.cgColor
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        
        actionView.addSubview(okButton)
        
        titleLabel = UILabel()
        titleLabel.text = "Set reminder"
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionView.addSubview(titleLabel)
        
        cancelButton = UIButton()
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle(" cancel ", for: .normal)
        cancelButton.setTitleColor(.systemRed, for: .normal)
        cancelButton.layer.cornerRadius = 7
        cancelButton.layer.borderColor = UIColor.systemRed.cgColor
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.backgroundColor = UIColor.systemGray5.cgColor
        cancelButton.addTarget(self, action: #selector(cancelTapped), for: .touchUpInside)
        actionView.addSubview(cancelButton)
        
        
        
        NSLayoutConstraint.activate([
            actionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            actionView.widthAnchor.constraint(equalToConstant: 300),
            actionView.heightAnchor.constraint(equalToConstant: 450),
            
            titleLabel.centerXAnchor.constraint(equalTo: actionView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: actionView.topAnchor, constant: 10),
            
            textField.centerXAnchor.constraint(equalTo: actionView.centerXAnchor),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: margins),
            textField.leftAnchor.constraint(equalTo: actionView.leftAnchor, constant: margins),
            
            datePicker.centerXAnchor.constraint(equalTo: actionView.centerXAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: 290),
            datePicker.heightAnchor.constraint(equalToConstant: 310),
            datePicker.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: margins),

            okButton.rightAnchor.constraint(equalTo: actionView.rightAnchor, constant: margins * -1),
            okButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            okButton.widthAnchor.constraint(equalToConstant: 130),
            
            cancelButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            cancelButton.widthAnchor.constraint(equalToConstant: 130),
            cancelButton.leftAnchor.constraint(equalTo: actionView.leftAnchor, constant: margins)
            
            
            
            
        ])
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
    }
    
    
    @objc func okButtonTapped (){
        if textField.text != "" && textField.text != " " {
        NotificationCenter.default.post(name: .addingNotification, object: self)
        }
        dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if textField.isFirstResponder{
        textField.resignFirstResponder()
        }
        
        
    }
    @objc func cancelTapped (){
        dismiss(animated: true)
    }
    
}
