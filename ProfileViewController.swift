//
//  ProfileViewController.swift
//  hack
//
//  Created by Lucy Bazezy on 5/3/24.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    private var saveButton = UIButton()
    private var nameTextField = UITextField()
    private var ageTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = "Edit Profile"
        self.view.backgroundColor = .white
    
        title = "Profile"
    // MARK: - Properties (view)
        
        nameTextField.frame = CGRect(x: 32, y: 100, width: 300, height: 40)
        nameTextField.placeholder = "Enter Name"
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        
        ageTextField.frame = CGRect(x: 32, y: 100, width: 300, height: 40)
        ageTextField.placeholder = "Enter Age"
        ageTextField.borderStyle = .roundedRect
        ageTextField.keyboardType = .numberPad
        view.addSubview(ageTextField)
    
        //create the “Save” button
        let saveButton = UIButton(frame: CGRect(x: 30, y: 730, width: 320, height: 50))
    
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.backgroundColor = .systemRed
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.layer.cornerRadius = 16
    
        view.addSubview(saveButton)

    
        }
        @objc func saveButtonTapped() {
            //let newHometown = homeText.text
            //let newMajor = majorText.text
            //delegate?.didUpdateProfileInfo(hometown: newHometown, major: newMajor)
            navigationController?.popViewController(animated: true)
        }



    
}
