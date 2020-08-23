//
//  Join1ViewController.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/23.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit

class Join1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        
        // push 방식으로 하면 스토리보드 방식으로 이동하는 것까지 걸 필요는 없었다.
        // 만약 스토리보드까지 연결해 놓으면 두번 호출 된다.
        // 당연한 걸까? 잘 모르겠다. 이유야 어찌됐든 한번만 호출해서 이대로 이해하고 넘어가자.
        print("join1 btnCancel click")
        let loingViewController = self.storyboard?.instantiateViewController(identifier: "loginView") as! ViewController
        self.navigationController?.pushViewController(loingViewController, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
