//
//  ViewController.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/23.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let join1ViewController = segue.destination as! Join1ViewController
        if segue.identifier == "signUpButton" {
            // 버튼을 클릭할 경우
            print("signUpButton click")
        } else if segue.identifier == "signUpBarButton" {
            // 바 버튼을 클릭한 경우
            print("signUpBarButton click")
        }
    }


}

