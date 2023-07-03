//
//  LoginView.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/28.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    @State var isSignIn = true
    var body: some View {
        NavigationStack {
            Group {
                switch authViewModel.loginState {
                case .loggedIn:
                    SignOutView()
                case .loggedOut:
                    SignInView()
                case .notSigned:
                    SignUpView()
                }
            }
            .navigationTitle(authViewModel.loginState.navigationTitle)
        }
    }
}
  

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
