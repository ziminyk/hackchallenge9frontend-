//
//  ViewController.swift
//  hack
//
//  Created by Lucy Bazezy on 4/28/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
        
        // MARK: - Properties (view)
        let scrollView = UIScrollView()
        let contentView = UIView()
        let titleLabel = UILabel()
        let content = UILabel()
        private let pushVCButton = UIButton()
        private let profileButton = UIButton()
    
    private var users: [User] = []
    
    struct User: Codable{
        let id: Int
        let name: String
        let age: Int
    }

    private let newUserButton = UIButton()
    private let returningUserButton = UIButton()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            scrollView.frame = view.bounds
            scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            scrollView.showsVerticalScrollIndicator = true
            scrollView.backgroundColor = UIColor.white
            
            contentView.frame = scrollView.bounds
            contentView.backgroundColor = UIColor.white
            contentView.autoresizingMask=[.flexibleWidth, .flexibleHeight]
            
            titleLabel.text = "Big Red Lifts"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
            titleLabel.textAlignment = .center
            titleLabel.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
            contentView.addSubview(titleLabel)
            setUpUI()
            

            scrollView.addSubview(contentView)
            view.addSubview(scrollView)
            

            
            
            
            //setupPushVCButton()
        }
    
    private func setUpUI() {
        newUserButton.setTitle("New User", for: .normal)
        newUserButton.setTitleColor(.systemBackground, for: .normal)
        newUserButton.backgroundColor = .systemRed
        newUserButton.layer.cornerRadius = 10
        newUserButton.addTarget(self, action: #selector(newUserButtonTapped), for: .touchUpInside)
        contentView.addSubview(newUserButton)
        
        returningUserButton.setTitle("Returning User", for: .normal)
        returningUserButton.setTitleColor(.systemBackground, for: .normal)
        returningUserButton.backgroundColor = .systemRed
        returningUserButton.layer.cornerRadius = 10
        returningUserButton.addTarget(self, action: #selector(returningUserButtonTapped), for: .touchUpInside)
        contentView.addSubview(returningUserButton)
        
        profileButton.setImage(UIImage(named: "profile"), for: .normal)
       // profileButton.frame = CGRect(x: 20, y: 40, width: 40, height: 40)
        profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        contentView.addSubview(profileButton)
                            
        let widthConstraint = newUserButton.widthAnchor.constraint(equalTo: returningUserButton.widthAnchor)
        widthConstraint.isActive = true
        
        let carImageView = UIImageView(image: UIImage(named: "redCar"))
        contentView.addSubview(carImageView)
        
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        returningUserButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        carImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newUserButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            newUserButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -60),
            
            returningUserButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            returningUserButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor,constant: 15),
        
            profileButton.leadingAnchor.constraint(equalTo: carImageView.leadingAnchor, constant: 40),profileButton.topAnchor.constraint(equalTo: carImageView.topAnchor, constant: 60),profileButton.widthAnchor.constraint(equalToConstant: 40), profileButton.heightAnchor.constraint(equalToConstant: 40),
            
            carImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            carImageView.bottomAnchor.constraint(equalTo: newUserButton.topAnchor,constant: -50),
            carImageView.widthAnchor.constraint(equalToConstant: 100),
            carImageView.heightAnchor.constraint(equalToConstant: 100)])
    }
    
    private func setupPushVCButton() {
        pushVCButton.setTitle("Find a driver", for: .normal)
        pushVCButton.setTitleColor(.systemBackground, for: .normal)
        pushVCButton.backgroundColor = .systemBlue
        pushVCButton.layer.cornerRadius = 10
        pushVCButton.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
        view.addSubview(pushVCButton)
        pushVCButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([pushVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),pushVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),pushVCButton.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    @objc private func newUserButtonTapped() {
        let createUserVC = CreateUserViewController()
        navigationController?.pushViewController(createUserVC, animated: true)
    }
    
    @objc private func returningUserButtonTapped() {
        let createUserVC = CreateUserViewController()
        navigationController?.pushViewController(createUserVC, animated: true)
    }
    @objc private func profileButtonTapped() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
        
    @objc private func pushVC(){
        let driverVC = driverViewController()
        
        navigationController?.pushViewController(driverVC, animated: true)
    }
        
}

protocol userInputDelegate: AnyObject {
    func didSubmitProfileInfo(name: String?, age: String?)
}
class CreateUserViewController: UIViewController {
    
    private var titleLabel = UILabel()
    
    private var saveButton = UIButton()
    private var nameTextField = UITextField()
    private var ageTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = "Big Red Lifts"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
    
    
        
        view.addSubview(titleLabel)

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
        
        let saveButton = UIButton(frame: CGRect(x: 30, y: 730, width: 320, height: 50))
    
        saveButton.setTitle("Continue", for: .normal)
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.backgroundColor = .systemRed
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.layer.cornerRadius = 16
    
        view.addSubview(saveButton)

    
            
        NSLayoutConstraint.activate([
        
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: titleLabel.centerYAnchor,constant: 30),
            
            ageTextField.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            ageTextField.topAnchor.constraint(equalTo:nameTextField.bottomAnchor,constant: 30),
            ])
 

        
            }
    @objc func saveButtonTapped() {

        let driverVC = driverViewController()
        navigationController?.pushViewController(driverVC, animated: true)
    }

    }








