//
//  SignOutView.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/27.
//

import SwiftUI

struct SignOutView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 32) {

            if let fullName = authViewModel.user?.fullName {
                Text("\(fullName)님 안녕하세요!")
                    .font(.title)
                    .bold()
            } else {
                Text("                      ")
                    .redacted(reason: .placeholder)
                //사용자의 전체 이름이 없는 경우에 플레이스홀더 텍스트를 표시하는 역할을 합니다.
            }

            Button {
                do {
                    try authViewModel.signOutUser() // Singout 버튼을 누르면 signoutuser를 실행해라.
                } catch {
                    print("DEBUG: Failed to sign out: \(error.localizedDescription)") //  로그아웃에 실패하였다고 에러에 대한 다국화적인 설명을 하여라.
                }
            } label: {
                Text("Sign Out")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 150)
                    .background(.blue)
                    .cornerRadius(12)
            }
        }
        .task { // 비동기 작업 수정자 // 그런데 이 테스크는 언제 어떻게 실행이 되는 것인지 잘 모르겠다.
            do { //
                try await authViewModel.fetchUser() // fetchUser를 실행할 것이며 에러가 발생할 수 있다.
            } catch {
                print("DEBUG: Failed to fetch user \(error.localizedDescription)") // 에러가 발생하면 유저를 찾을 수 없고 에러에 대한 다국화적인 설명을 하여라.
            }
        }
    }
}

struct SignOutView_Previews: PreviewProvider {
    static var previews: some View {
        SignOutView()
    }
}
