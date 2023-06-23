//
//  FirstAidMedicineApp.swift
//  FirstAidMedicine
//
//  Created by 김정표 on 2023/06/20.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    // NsObject(본적인 메모리 관리, 다중 상속 및 동적 디스패치와 같은 Objective-C의 특징을 지원합니다)
    // UIApplicationDelegate( 앱의 생애주기 시작과 종료를 담당한다)
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
// application 함수를 제작해서, didFinishLaunchingWithOptions 메소드를 호출하고, lauchOption을 매개변수를 만들어 열거형 UIApplication(앱의 런칭이 전돨되는 옵션들).LaunchOptionKey 메소드 중 아무거나 닐 타입이 될 수 있는 것을 가져온다.)


//

@main
struct FirstAidMedicine: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // '@'attribute를 이용해서 앱 진입을 연결하고, 클래스를 선언한다음. 해당 변수에 넘겨준다.

  var body: some Scene {
    WindowGroup {
      NavigationView {
        ContentView()
      }
    }
  }
}
