//
//  Loginstate.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/23.
//

import Foundation


enum LoginState {
    case loggedIn
    case loggedOut
    case notSigned

var navigationTitle: String {
    switch self {
    case .loggedIn:
        return "로그아웃"
    case .loggedOut:
        return "로그인"
    case .notSigned:
        return "회원가입"
    }
  }
}

