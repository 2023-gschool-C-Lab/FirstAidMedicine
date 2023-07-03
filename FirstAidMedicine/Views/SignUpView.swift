//
//  SignUpView.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/28.
// 

import SwiftUI
import PhotosUI

struct SignUpView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    @State var fullName : String = ""
    @State var email : String = ""
    @State var password : String = ""
    //    @State var repassword : String = ""
    @State var retrySignUp = false
    @State var errorMessage = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("회원가입")
                        .fontWeight(.bold)
                        .font(.system(size: 25))
                        .foregroundColor(Color(hex :0x5762EA))
                    
                    Spacer()
                        .frame(maxHeight: 3)
                    
                    Text("구급키트 앱에 오신것을 환영합니다!")
                        .fontWeight(.medium)
                        .font(.system(size: 15))
                }
                Spacer()
            }
            Spacer()
                .frame(maxHeight : 25)
            VStack {
                TextField(
                    "닉네임",
                    text: $fullName
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
                .textInputAutocapitalization(.never)
                .frame(width: 333)
                Spacer()
                    .frame(maxHeight : 15)
                
                
                TextField(
                    "이메일",
                    text: $email
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
                .textInputAutocapitalization(.never)
                .frame(width: 333)
                Spacer()
                    .frame(maxHeight : 15)
                
                
                SecureField(
                    "비밀번호",
                    text: $password
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
                .textInputAutocapitalization(.never)
                .frame(width: 333)
                Spacer()
                    .frame(maxHeight : 15)
                
                
                //                SecureField(
                //                    "비밀번호 확인", text: $repassword)
                //
                //                .font(.system(size: 16))
                //                .fontWeight(.light)
                //                .textFieldStyle(PlainTextFieldStyle())
                //                .padding()
                //                .background(
                //                  Capsule()
                //                .strokeBorder(Color(hex: 0xD9D9D9), lineWidth: 1)
                //                )
                //                .frame(height:51)
                //                .textInputAutocapitalization(.never)
                Spacer()
                    .frame(maxHeight: 30)
                
                
                
                
                
                Button {
                    authViewModel.loginState = .loggedOut
                } label: {
                    Text("이미 회원이신가요?")
                }
                
                Spacer()
                    .frame(maxHeight: 30)
                
                
                
                Button {
                    Task {
                        do {
                            try await authViewModel.registerUser(withEmail: email, password: password, fullName: fullName)
                        } catch {
                            retrySignUp = true
                            errorMessage = error.localizedDescription
                            print("DEBUG: Failed to sign up \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text("회원가입")
                        .fontWeight(.medium)
                        .font(.system(size: 19))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 333,height: 64)
                        .background(Color(hex: 0x5762EA))
                        .cornerRadius(36)
                    
                }
            }
        }
        .frame(width: 333)
        
        .alert("회원가입 실패", isPresented: $retrySignUp) {
            Button {
                retrySignUp = false
            } label: {
                Text("다시 시도하기")
            }
        } message: {
            Text("\(errorMessage)")
        }
        
    }
}
        
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
