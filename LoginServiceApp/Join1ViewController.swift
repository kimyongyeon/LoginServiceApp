//
//  Join1ViewController.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/23.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import UIKit

class Join1ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPass: UITextField!
    @IBOutlet weak var userRePass: UITextField!
    @IBOutlet weak var userMemo: UITextView!
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userName.text = nil
        self.userPass.text = nil
        self.userRePass.text = nil
        self.userMemo.text = nil
        
        self.picker.sourceType = .photoLibrary // 방식 선택. 앨범에서 가져오는걸로 선택.
        self.picker.allowsEditing = false // 수정가능하게 할지 선택. 하지만 false
        self.picker.delegate = self // picker delegate
        
        // imageview를 버튼으로 쓰기 위해서 사용하는 클래스, 뷰를 제스처로 만들어 주는 마법을 부린다. 이벤트도 등록이 가능하고... 암튼 그런것이다.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        self.imgView.isUserInteractionEnabled = true
        self.imgView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        // Your action
        self.present(self.picker, animated: true)
    }
    
    @IBAction func btnImage(_ sender: Any) {
        self.present(self.picker, animated: true) // Controller이기 때문에 present 메서드를 이용해서 컨트롤러 뷰를 띄워준다!
    }
    
    
    @IBAction func btnCancel(_ sender: Any) {
        
        // 정보의 흐름 : 네비게이션 push, pop
        // 정보의 흐름이 필요없는것 : 모달
        
        // push 방식으로 하면 스토리보드 방식으로 이동하는 것까지 걸 필요는 없었다.
        // 만약 스토리보드까지 연결해 놓으면 두번 호출 된다.
        // 당연한 걸까? 잘 모르겠다. 이유야 어찌됐든 한번만 호출해서 이대로 이해하고 넘어가자.
        print("join1 btnCancel click")
        let loingViewController = self.storyboard?.instantiateViewController(identifier: "loginView") as! ViewController
        self.navigationController?.pushViewController(loingViewController, animated: true)
        
    }
    @IBAction func btnNext(_ sender: Any) {
        let userNm = self.userName.text ?? ""
        let userP1 = self.userPass.text ?? ""
        let userP2 = self.userRePass.text ?? ""
        let userM = self.userMemo.text ?? ""
        print ("name:\(userNm), userP1:\(userP1), userP2:\(userP2), userMemo:\(userM)")
        
        // 싱글톤을 이용해서 넣는데 처음에는 인식을 못해서 xcode를 리스타트 하니까 잘된다. 버그가 아직 많은것 같다.
        UserInfo.shared.name = userNm
        UserInfo.shared.pass = userP1
        UserInfo.shared.memo = userM
        UserInfo.shared.pic = "???"
    }
    
    // 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

extension Join1ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("imagePickerController start")
   
        var newImage: UIImage? = nil

        if let possibleImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage { // 수정된 이미지가 있을 경우
           newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage { // 오리지널 이미지가 있을 경우
           newImage = possibleImage
        }

        print("image: \(String(describing: newImage))")

        imgView.image = newImage // 받아온 이미지를 이미지 뷰에 넣어준다.

        picker.dismiss(animated: true) // 그리고 picker를 닫아준다.

        print("imagePickerController end")
    }
    
}
