//
//  ResetManager.swift
//  GreenStep
//
//  Created by JIN on 8/1/25.
//

import UIKit


final class ResetManager {
    static let shared = ResetManager()
    private init() {}

    private let lastResetKey = "lastResetDate"
    private let calendar = Calendar.current
    
    
    private let userData = UserDefaultsStorage.shared

    // 날짜가 바뀌었으면 user.today를 0으로 초기화
    func resetTodayIfNeeded() {
        let todayStart = calendar.startOfDay(for: Date()) //자정을 구하는 코드

      
        if let lastReset = UserDefaults.standard.object(forKey: lastResetKey) as? Date,
           lastReset >= todayStart {
            return  // 이미 오늘 0시 이후에 리셋한 적 있으면 함수 종료
        }
     
        var user = userData.get(User.self, forKey: userData.userDefaultsKey)
        user?.today = 0
        
        userData.set(user, forKey: userData.userDefaultsKey)
        
        UserDefaults.standard.set(Date(), forKey: lastResetKey)

    }
}
