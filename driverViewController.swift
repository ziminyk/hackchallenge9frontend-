//
//  driverViewController.swift
//  hack
//
//  Created by Lucy Bazezy on 4/28/24.
//

import Foundation
import UIKit



class driverViewController: UIViewController {
    
    struct Driver {
        let name: String
        let age: Int
    }
    
    let drivers: [Driver] = [
        Driver(name: "Lucy Bazezy", age: 18),
        Driver(name: "Aina Ellington", age: 19),
        Driver(name: "Hailey Johnson", age: 18),
        Driver(name: "Vivian Bui", age: 22),
        Driver(name: "Rachael Godwin", age: 21)
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.showsVerticalScrollIndicator = true
        scrollView.backgroundColor = UIColor.white
        
        view.addSubview(scrollView)
        
        let title = UILabel()
        title.text = "Find a driver"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        title.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 50)
        
        view.addSubview(title)
        
        displayDrivers()
        
    }
    
    private func displayDrivers() {
        var previousDriverView: UIView?
        
        for driver in drivers {
            let driverView = createDriverView(driver: driver)
            view.addSubview(driverView)
            
            if let previousDriverView = previousDriverView {
                driverView.topAnchor.constraint(equalTo: previousDriverView.bottomAnchor, constant: 15).isActive = true
            } else {
                driverView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
            }
            
            driverView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
            driverView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            
            previousDriverView = driverView
        }
        
        if let lastDriverView = previousDriverView {
            view.bottomAnchor.constraint(equalTo: lastDriverView.bottomAnchor, constant: 15).isActive = true
        }
    }
    
    private func createDriverView(driver: Driver) -> UIView {
        let driverView = UIView()
        
        let nameLabel = UILabel()
        nameLabel.text = driver.name
        
        let ageLabel = UILabel()
        ageLabel.text = "Age: \(driver.age)"
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        driverView.translatesAutoresizingMaskIntoConstraints = false
        
        driverView.addSubview(nameLabel)
        driverView.addSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: driverView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: driverView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: driverView.trailingAnchor),
            
            ageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            ageLabel.leadingAnchor.constraint(equalTo: driverView.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: driverView.trailingAnchor),
            ageLabel.bottomAnchor.constraint(equalTo: driverView.bottomAnchor)
        ])
        
        return driverView
    }
    
    
    
    private func popVC(){
        navigationController?.popViewController(animated: true)
    }
    
}
