//
//  ViewController.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/23.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // singleton pattern 으로 데이터 공유 해서 마지막 페이지 까지 가지고 가야 함.
    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var userPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userPass.isSecureTextEntry = true
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! Join1ViewController
        if segue.identifier == "signUpButton" {
            // 버튼을 클릭할 경우
            print("signUpButton click")
        } else if segue.identifier == "signUpBarButton" {
            // 바 버튼을 클릭한 경우
            print("signUpBarButton click")
        }
    }
    
    func celebrationAlert (msg: String) {
        let alert = UIAlertController(title: "성공", message: msg, preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler : {(action) in
            // 초기화
            self.userId.text = ""
            self.userPass.text = ""
            self.userId.becomeFirstResponder() // userId로 포커스 이동
        })
        alert.addAction(defaultAction)
        present(alert, animated: false, completion: nil)
    }
    
    func warningAlert (msg: String) {
       let alert = UIAlertController(title: "경고", message: msg, preferredStyle: UIAlertController.Style.alert)
       let defaultAction = UIAlertAction(title: "OK", style: .destructive, handler : {(action) in
            self.userId.text = ""
            self.userPass.text = ""
            self.userId.becomeFirstResponder() // userId로 포커스 이동
       })
       alert.addAction(defaultAction)
       present(alert, animated: false, completion: nil)
    }
    
    // 로그인 버튼
    @IBAction func btnLogin(_ sender: Any) {
        print("btnLogin click")
        if (userId.text == "user" && userPass.text == "1234") {
            print("로그인 성공")
            celebrationAlert(msg: "로그인 성공 했습니다. 메인화면은 준비중 입니다.")
        } else {
            print("로그인 실패")
            warningAlert(msg: "로그인 실패 했습니다.")
        }
    }
    
    // 회원가입 버튼
    @IBAction func btnSignup(_ sender: Any) {
        print("btnSignUp click" )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.userId.text = ""
        self.userPass.text = ""
        self.userId.becomeFirstResponder() // userId 포커스이동
    }
    

}

