//
//  SignInView.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/27.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthViewModel // 서버와 모델과 연결하기 위한 것을 호출
    @State var retrySignIn = false //
    @State var email: String = ""  // 변경된 값을 authviewModel에 연동되고 변경되니 State
    @State var password: String = "" // 변경된 값을 authviewModel에 연동되고 변경되니 State
    @State var errorMessage = "" // 에러메세지는 해당 에러에 따라 다르므로 State 에러

    var body: some View {
        VStack {
            
            VStack { // 사용자의 상호작용 뷰 컨테이너
                TextField( // 매개변수와 옵션을 통해 사용쟈의 인터페이스 조성
                    "이메일을 입력해주세요.",
                    text : $email //  텍스트는 이메일이며, 이메일 값의 변경 상태를 추적하고 연동하겠다.
                )
                .font(.system(size: 16))
                .fontWeight(.light)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .background(
                  Capsule()
                .strokeBorder(Color(hex: 0xD9D9D9), lineWidth: 1)
                )
                .frame(height:51)
              .textInputAutocapitalization(.never) // 텍스트가 자동으로 대문자화 되는 것을 막겠다.
                Spacer()
                    .frame(maxHeight : 15)
                
                SecureField(
                    "비밀번호를 입력해주세요.",
                    text: $password //  텍스트는 패스워드이며, 패스워드의 값의 변경 상태를 추적하고 연동하겠다.
                )
                .font(.system(size: 16))
                .fontWeight(.light)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .background(
                Capsule()
                  .strokeBorder(Color(hex: 0xD9D9D9), lineWidth: 1)
                               )
                .frame(height : 51)
                .textInputAutocapitalization(.never)  // 텍스트가 자동으로 대문자화 되는 것을 막겠다.
            }
            Spacer()
                .frame(maxHeight: 28)
            
            Button {
                Task {
                    do {
                        try await authViewModel.signInUser(withEmail: email, password : password) // 로그인 버튼을 누르면 singinuser를 호출하고 해당 인자에 이메일 값을, 해당 인자에 패스워드 값을 할당하겠다. // 이렇게 로그인 버튼을 누르면 자도으로 저장이 되는 건가?
                    } catch {
                        retrySignIn = true // 밑에 에러코드가 이해가 되지 않습니다.
                        errorMessage = error.localizedDescription
                        print("DEBUG: Failed to sign in \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("로그인")
                    .fontWeight(.medium)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 333,height: 64)
                    .background(Color(hex: 0x5762EA))
                    .cornerRadius(36)
            }
            
            Spacer()
                .frame(maxHeight:92)
            
            
            Button {
                authViewModel.loginState = .notSigned // 버튼을 누르면 로그인의 상태를 로그인 되지 않음으로 변경한다.
            } label: {
                Text("아직 회원이 아니신가요?")
                    .font(.system(size:18))
                    .fontWeight(.regular)
                    .foregroundColor(Color(hex :0x5762EA))
                    .underline()
            }
        }
        .frame(width: 333)
        .alert("로그인 실패", isPresented: $retrySignIn) { // 로그인에 실패하면 다시 로그인 할 것인지에 대해서 묻는다.
            Button {
                retrySignIn = false // 해당 버튼이 주워지고 다시 시도하기를 버튼을 생성해라.
            } label: {
                Text("다시 시도하기")
            }
        } message: {
            Text(errorMessage) //라벨에 메세지를 띄워라
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthViewModel())
    }
}
