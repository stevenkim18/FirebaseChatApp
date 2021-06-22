//
//  RegisterViewController.swift
//  FirebaseChatApp
//
//  Created by steven on 2021/06/21.
//

import UIKit

class RegisterViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .gray
        // TODO: 이미지 콘텐츠 모드 공부
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "first name.."
        
        // 입력창에 왼쪽으로 딱 붙어 있는것을 조금 띄워주는 방법
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "last name.."
        
        // 입력창에 왼쪽으로 딱 붙어 있는것을 조금 띄워주는 방법
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address.."
        
        // 입력창에 왼쪽으로 딱 붙어 있는것을 조금 띄워주는 방법
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        // 비밀번호는 입력했으면 모든 입력이 끝나기 때문에! -> 로그인
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "password.."
        
        // 입력창에 왼쪽으로 딱 붙어 있는것을 조금 띄워주는 방법
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        // 비번 창
        field.isSecureTextEntry = true
        return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        // 파란 색
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "회원가입"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "회원가입",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
        registerButton.addTarget(self,
                              action: #selector(registerButtonTapped),
                              for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        // Add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(profileImageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(registerButton)
        
        // 프로필 이미지 뷰에 제스처 만들기 -> 터치를 해서 카메라나 캘러리 호출
        profileImageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapChangeProfileImage))
        profileImageView.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapChangeProfileImage() {
        print("profile image tapped!")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = scrollView.width/3
        profileImageView.frame = CGRect(x: (scrollView.width-size)/2,
                                     y: 20,
                                     width: size,
                                     height: size)
        firstNameField.frame = CGRect(x: 30,
                                  y: profileImageView.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 52)
        lastNameField.frame = CGRect(x: 30,
                                  y: firstNameField.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 52)
        emailField.frame = CGRect(x: 30,
                                  y: lastNameField.bottom + 20,
                                  width: scrollView.width - 60,
                                  height: 52)
        passwordField.frame = CGRect(x: 30,
                                     y: emailField.bottom + 20,
                                     width: scrollView.width - 60,
                                     height: 52)
        registerButton.frame = CGRect(x: 30,
                                   y: passwordField.bottom + 20,
                                   width: scrollView.width - 60,
                                   height: 52)
    }
    
    @objc private func registerButtonTapped() {
        // 텍스트필드에서 키보드가 내려감.
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        // 이메일, 비밀번호 유효성 검사
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let email = emailField.text,
              let password = passwordField.text,
              !firstName.isEmpty, !lastName.isEmpty,
              !email.isEmpty, !password.isEmpty,
              password.count >= 6 else {
            alertUserLoginError()
            return
        }
        // TODO: 파이어 베이스 로그인
    }
    
    func alertUserLoginError() {
        let alert = UIAlertController(title: "회원가입 실패",
                                      message: "입력 정보를 확인해주세요.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인",
                                      style: .cancel,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func didTapRegister() {
        let registerViewController = RegisterViewController()
        registerViewController.title = "계정 생성"
        navigationController?.pushViewController(registerViewController, animated: true)
    }

}

extension RegisterViewController: UITextFieldDelegate {
    // 텍스트 필드에서 입력을 클릭 했을 때 처리
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            // 이메일을 입력하고 계속 버튼을 누르면 비번이 활성화
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            // 비번을 입력하고 done 버튼을 누르면 로그인 하기!
            registerButtonTapped()
        }
        return true
    }

}
