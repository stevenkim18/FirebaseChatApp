//
//  LoginViewController.swift
//  FirebaseChatApp
//
//  Created by steven on 2021/06/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        // TODO: 이미지 콘텐츠 모드 공부
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Log In"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        view.addSubview(logoImageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let size = view.frame.size.width/3
        logoImageView.frame = CGRect(x: (view.frame.size.width-size)/2,
                                     y: 20,
                                     width: size,
                                     height: size)
        
    }
    
    @objc private func didTapRegister() {
        let registerViewController = RegisterViewController()
        registerViewController.title = "Create Account"
        navigationController?.pushViewController(registerViewController, animated: true)
    }

}
