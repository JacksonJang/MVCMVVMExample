//
//  ViewController.swift
//  MVCMVVMExample
//
//  Created by 장효원 on 4/3/24.
//

import UIKit

// MARK: - MVC

// Model
struct User {
    var name: String
    var age: Int
}

// View
class UserView: UIView {
    func showUser(name: String, age: Int) {
        print("이름: \(name), 나이: \(age)")
    }
}

// Controller
class ViewController: UIViewController {
    var user: User?
    var userView = UserView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUser(name: "장효원", age: 29)
    }
    
    func updateUser(name: String, age: Int) {
        self.user = User(name: name, age: age)
        guard let user = user else {
            return
        }
        userView.showUser(name: user.name, age: user.age)
    }
}

// MARK: - MVVM

/*
// Model
struct User {
    var name: String
    var age: Int
}

// View
class ViewController: UIViewController {
    private lazy var viewModel = UserViewModel(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateUser(name: "장효원", age: 29)
    }
    
    public func showUser() {
        viewModel.showUser()
    }
}

// ViewModel
class UserViewModel {
    private var user: User? {
        didSet {
            updateView()
        }
    }
    
    weak var viewController: ViewController?

    init(viewController: ViewController?) {
        self.viewController = viewController
    }

    func updateUser(name: String, age: Int) {
        user = User(name: name, age: age)
    }
    
    func showUser() {
        guard let user = user else {
            return
        }
        print("이름: \(user.name), 나이: \(user.age)")
    }

    private func updateView() {
        viewController?.showUser()
    }
}
*/
