//
//  LoginViewController.swift
//  kinniku-swift
//
//  Created by 藤川慶 on 2017/11/11.
//  Copyright © 2017年 Barberry Inc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBAction func loginButtonTapped(_ sender: Any) {
        AuthAPI.login({ error in
            UserDefaultsStore.shared.saveRegister()
            self.gotoMain()
        })
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        self.gotoMain()
    }
    
    func gotoMain(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        present(vc, animated: true, completion: nil)
    }
}
