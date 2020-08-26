//
//  Join2ViewController.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/23.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit

class Join2ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        print ("vlaue click")
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        self.dateLabel.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 데이터 이동은 싱글톤이 깔끔하고 좋다.
        // 상황에 맞춰서 써야 하니까 무조건 쓸려고 하지 말고 다른 방법도 익혀 두도록.
        print("userIfo: \(UserInfo.shared.name), \(UserInfo.shared.pass), \(UserInfo.shared.memo), \(UserInfo.shared.pic)")
        
        self.datePicker.addTarget(self, action: #selector(didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)
    }
    @IBAction func btnCancel(_ sender: Any) {
        print("join2 btnCancel click")
        let loingViewController = self.storyboard?.instantiateViewController(identifier: "loginView") as! ViewController
        self.navigationController?.pushViewController(loingViewController, animated: true)
    }
    
    @IBAction func btnPrev(_ sender: Any) {
        print("join2 btnPrev click")
        let join1ViewController = self.storyboard?.instantiateViewController(identifier: "join1View") as! Join1ViewController
        self.navigationController?.popViewController(animated: true)
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
