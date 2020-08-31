//
//  UserInfo.swift
//  LoginServiceApp
//
//  Created by yongyeon kim on 2020/08/26.
//  Copyright © 2020 yongyeon kim. All rights reserved.
//

import Foundation

class UserInfo {
    static let shared: UserInfo = UserInfo()
    var name: String?
    var phone: String?
    var regDate: String? 
    var pass: String?
    var memo: String?
    var pic: String?
}
