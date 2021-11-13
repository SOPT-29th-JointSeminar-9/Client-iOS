//
//  GenieTBC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/12.
//

import UIKit

class GenieTBC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        addDotAtTabBarItemIndex(index: 0)
    }
    
    // MARK: tabBar didSelect 함수
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        addDotAtTabBarItemIndex(index: self.getSelectedTabIndex() ?? 0)
    }
    
    // MARK: 탭바 VC 지정 함수
    func makeTabVC<T>(storyboardName: String, identifier: String, vcName: T, tabBarTitle: String, tabBarImage: String, tabBarSelectedImage: String) -> T? where T: UIViewController {
        let sb = UIStoryboard.init(name: storyboardName, bundle: nil)
        guard let tab = sb.instantiateViewController(withIdentifier: identifier) as? T else { return nil }
        tab.tabBarItem = UITabBarItem(title: tabBarTitle, image: UIImage(named: tabBarImage), selectedImage: UIImage(named: tabBarSelectedImage))
        tab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        return tab
    }
    
    // MARK: 탭바 설정 함수
    func setTabBar() {
        guard let homeTab = makeTabVC(storyboardName: "Main", identifier: Identifiers.homeVC, vcName: HomeVC(), tabBarTitle: "홈", tabBarImage: "home_unselected", tabBarSelectedImage: "home"),
              let heartTab = makeTabVC(storyboardName: "Main", identifier: Identifiers.heartVC, vcName: HeartVC(), tabBarTitle: "For You", tabBarImage: "heart_unselected", tabBarSelectedImage: "heart"),
              let searchTab = makeTabVC(storyboardName: "Main", identifier: Identifiers.searchVC, vcName: SearchVC(), tabBarTitle: "검색", tabBarImage: "search_unselected", tabBarSelectedImage: "search"),
              let folderTab = makeTabVC(storyboardName: "Main", identifier: Identifiers.folderVC, vcName: FolderVC(), tabBarTitle: "내음악", tabBarImage: "folder_unselected", tabBarSelectedImage: "folder"),
              let menuTab = makeTabVC(storyboardName: "Menu", identifier: Identifiers.menuVC, vcName: MenuVC(), tabBarTitle: "전체메뉴", tabBarImage: "menu_unselected", tabBarSelectedImage: "menu") else { return }
        
        // 탭바 스타일 설정
        tabBar.frame.size.height = 54
        tabBar.tintColor = .black
        
        
        let tabs =  [homeTab, heartTab, searchTab, folderTab, menuTab]
        
        // VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
        
    }
}

extension GenieTBC {
    // MARK: tabBarItem에 dot 추가하는 함수
    func addDotAtTabBarItemIndex(index: Int) {
        
        for subview in self.tabBar.subviews {
            
            if let subview = subview as? UIView {
                
                if subview.tag == 1314 {
                    subview.removeFromSuperview()
                    break
                }
            }
        }
        
        let dotRadius: CGFloat = 3
        let dotDiameter = dotRadius * 2
        
        let TopMargin:CGFloat = 7
        
        let TabBarItemCount = CGFloat(self.tabBar.items!.count)
        
        let HalfItemWidth = view.bounds.width / (TabBarItemCount * 2)
        
        let xOffset = HalfItemWidth * CGFloat(index * 2 + 1) - 5
        
        let imageHalfWidth: CGFloat = (self.tabBar.items![index] ).selectedImage?.size.width ?? 0 / 2
        
        let dot = UIView(frame: CGRect(x: xOffset + imageHalfWidth, y: TopMargin, width: dotDiameter, height: dotDiameter))
        
        dot.tag = 1314
        dot.backgroundColor = UIColor.main
        dot.layer.cornerRadius = dotRadius
        
        self.tabBar.addSubview(dot)
    }
}