//
//  ViewController.swift
//  FirebaseChatApp
//
//  Created by steven on 2021/06/21.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isLoggdeIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isLoggdeIn {
            let loginViewController = LoginViewController()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            navigationController.modalPresentationStyle = .fullScreen
            // 애니메이션을 true로 하면 빨간 화면이 잠깜 나오고 로그인 뷰컨으로 넘어감
            // false로 하면 시작하자마자 네비게이션 뷰컨이 보임
            present(navigationController, animated: false)
        }
        
    }

}

