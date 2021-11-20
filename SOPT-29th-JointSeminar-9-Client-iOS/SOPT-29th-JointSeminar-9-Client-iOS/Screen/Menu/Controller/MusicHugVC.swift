//
//  MusicHugVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/15.
//

import UIKit
import Then

class MusicHugVC: UIViewController, CustomMenuBarDelegate {
 
    //MARK: - Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setNC()
        setupCustomTabBar()
        setupPageCollectionView()
    }
    
    //MARK: - Navigation Tabbar
    func setNC() {
        
        //MARK: 왼쪽 버튼
        let backButton = UIButton().then {
            $0.setBackgroundImage(UIImage(named: "main_ic_back"), for: .normal)
            $0.addTarget(self, action: #selector(back), for: .touchUpInside)
            $0.tintColor = .black
        }
        let leftItem = UIBarButtonItem(customView: backButton)
        let leftSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                         target: nil, action: nil).then {
            $0.width = 21
        }
        navigationItem.setLeftBarButtonItems([leftSpacer, leftItem], animated: false)
        
        //MARK: 가운데 타이틀 라벨
        let titleLabel = UILabel().then {
            $0.textAlignment = .center
            $0.font = UIFont.AppleSDGothicSB(size: 19)
            $0.text = "뮤직허그"
        }
        navigationItem.titleView = titleLabel
        
        //MARK: 오른쪽 버튼
        let profileButton = UIButton().then {
            $0.setBackgroundImage(UIImage(named: "main_img_profile"), for: .normal)
        }
        let rightItem = UIBarButtonItem(customView: profileButton)
        let rightSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace,
                                          target: nil, action: nil).then {
            $0.width = 19
        }
        navigationItem.setRightBarButtonItems([rightSpacer, rightItem], animated: false)
    
        navigationController?.hidesBarsOnSwipe = true
    }

    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Custom TabBar
    var pageCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var customMenuBar = CustomMenuTabBar()

    func setupCustomTabBar(){
        self.view.addSubview(customMenuBar)
        customMenuBar.delegate = self
        customMenuBar.translatesAutoresizingMaskIntoConstraints = false
        //수정 필요
        customMenuBar.indicatorViewWidthConstraint.constant = self.view.frame.width / 3
        customMenuBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        customMenuBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        customMenuBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        customMenuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func customMenuBar(scrollTo index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.pageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupPageCollectionView(){
        pageCollectionView.delegate = self
        pageCollectionView.dataSource = self
        pageCollectionView.showsHorizontalScrollIndicator = false
        pageCollectionView.isPagingEnabled = true
        pageCollectionView.register(UINib(nibName: MenuPageCVC.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: MenuPageCVC.reusableIdentifier)
        self.view.addSubview(pageCollectionView)
        pageCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pageCollectionView.topAnchor.constraint(equalTo: self.customMenuBar.bottomAnchor).isActive = true
    }
}

//MARK: - Extension Part
extension MusicHugVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuPageCVC.reusableIdentifier, for: indexPath) as! MenuPageCVC
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // 수정 필요
        customMenuBar.indicatorViewLeadingConstraint.constant = scrollView.contentOffset.x / 3
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let itemAt = Int(targetContentOffset.pointee.x / self.view.frame.width)
        let indexPath = IndexPath(item: itemAt, section: 0)
        customMenuBar.customTabBarCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
    }
}

extension MusicHugVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageCollectionView.frame.width, height: pageCollectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MusicHugVC: CVCellDelegate {
    func touchUpToGoCreate(_ index: Int) {
        guard let vc = UIStoryboard(name: "PopUp", bundle: nil).instantiateViewController(withIdentifier: Identifiers.popUpVC) as? PopUpVC else { return }        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
}
