//
//  UITabBarController+.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/14.
//

import UIKit
extension UITabBarController {
    // MARK: tabItem Index return 함수
    func getSelectedTabIndex() -> Int? {
        if let selectedItem = self.tabBar.selectedItem {
            return self.tabBar.items?.firstIndex(of: selectedItem)
        }
        return nil
    }
}
