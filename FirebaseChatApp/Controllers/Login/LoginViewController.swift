//
//  LoginViewController.swift
//  FirebaseChatApp
//
//  Created by steven on 2021/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
    }
    
    @objc private func didTapRegister() {
        let registerViewController = RegisterViewController()
        registerViewController.title = "Create Account"
        navigationController?.pushViewController(registerViewController, animated: true)
    }

}
