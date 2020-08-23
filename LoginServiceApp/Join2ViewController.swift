//
//  Join2ViewController.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/23.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit

class Join2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnCancel(_ sender: Any) {
        print("join2 btnCancel click")
        let loingViewController = self.storyboard?.instantiateViewController(identifier: "loginView") as! ViewController
        self.navigationController?.pushViewController(loingViewController, animated: true)
    }
    
    @IBAction func btnPrev(_ sender: Any) {
        print("join2 btnPrev click")
        let join1ViewController = self.storyboard?.instantiateViewController(identifier: "join1View") as! Join1ViewController
        self.navigationController?.pushViewController(join1ViewController, animated: true)
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
