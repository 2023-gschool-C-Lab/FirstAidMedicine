//
//  AuthViewModel.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var loginState: LoginState
    
    // 앱의 모델.
    @Published var user: User?
    
    // 유저의 세션 정보가 담겨져 있음. 앱을 껐다가 다시 들어가도 유지
    
    private var uid: String {
        Auth.auth().currentUser?.uid ?? ""
    }
    
    init() {
        loginState = Auth.auth().currentUser != nil ? .loggedIn : .loggedOut
    }
    // ! 논리부정연산자 true를 false로 false를 true 로  변환하다.
    //Auth.auth().currentUser가 nil이 아닌 경우 .loggedIn으로, nil인 경우 .loggedOut으로 초기화됩니다.
    //currentUser 현재 사용자의 고유식별자를 가져온다.
}
