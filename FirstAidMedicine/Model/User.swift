//
//  User.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/23.
//

import Foundation

struct User : Codable {
    let fullName: String
    let email: String
    let uid: String
}

extension User {
    static let sample: User = User(fullName: "",
                                   email: "",
                                   uid: "")
}

//User.sample을 통해 기본 값을 가지는 User 인스턴스에 접근할 수 있습니다
