//
//  ChatVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/14.
//

import UIKit
import SnapKit
import Then

class ChatVC: UIViewController {
    
    //MARK: Properties
    private var chatNC = MusicHugNaviBarView()
    private var chatCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.backgroundColor = .chatBackgroundGray
        $0.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        registerCell()
        configueLayout()
    }
    
    // 대리자 위임
    func setupDelegate() {
        chatCV.delegate = self
        chatCV.dataSource = self
    }
    
    // 셀 등록
    func registerCell() {
        self.chatCV.register(ChatHeaderCVC.self,
                             forCellWithReuseIdentifier: "ChatHeaderCVC")
        self.chatCV.register(MusicPlayChatCVC.self,
                             forCellWithReuseIdentifier: "MusicPlayChatCVC")
        self.chatCV.register(CounterpartChatCVC.self,
                             forCellWithReuseIdentifier: "CounterpartChatCVC")
        self.chatCV.register(MyChatCVC.self,
                             forCellWithReuseIdentifier: "MyChatCVC")
    }
}
//MARK: - Layout
extension ChatVC {
    func configueLayout() {
        self.view.addSubviews([chatNC, chatCV])
        chatNC.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view)
            $0.height.equalTo(88)
        }
        
        chatCV.snp.makeConstraints {
            $0.top.equalTo(chatNC.snp.bottom).offset(0)
            $0.leading.trailing.bottom.equalTo(self.view)
        }
    }
}
//MARK: - UICollectionViewDataSource
extension ChatVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return musicHugChatData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let headCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.chatHeaderCVC, for: indexPath) as! ChatHeaderCVC
            return headCell
        }
        else {
            //뮤직 cell
            if musicHugChatData[indexPath.row].chatType == .music {
                print("music")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.musicPlayChatCVC, for: indexPath)
                if let musicPlayChatCell = cell as? MusicPlayChatCVC {
                    musicPlayChatCell.setupViews(model: musicHugChatData[indexPath.row])
                }
                return cell
            }
            //상대방 chat cell
            else if musicHugChatData[indexPath.row].chatType == .counterpart {
                print("counterpart")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.counterpartChatCVC, for: indexPath)
                if let counterpartChatCell = cell as? CounterpartChatCVC {
                    counterpartChatCell.setupViews(model: musicHugChatData[indexPath.row])
                    counterpartChatCell.couterpartTextLabel.adjustsFontSizeToFitWidth = true
                }
                return cell
                
            }
            //본인 chat cell
            else {
                print("me")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.mychatCVC, for: indexPath)
                if let myChatCell = cell as? MyChatCVC {
                    myChatCell.setupViews(model: musicHugChatData[indexPath.row])
                }
                return cell
            }
        }
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension ChatVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: self.view.frame.width, height: 110)
        }
        
        if musicHugChatData[indexPath.row].chatType == .music {
            let height = musicHugChatData[indexPath.row].messageText.height(constraintedWidth: self.view.frame.width, font: UIFont.AppleSDGothicR(size: 14))
            return CGSize(width: self.view.frame.width, height: height + 40)
        }
        else if musicHugChatData[indexPath.row].chatType == .counterpart {
            let height = heightForView(text: musicHugChatData[indexPath.row].messageText, font: UIFont.AppleSDGothicM(size: 14), width: 220)
            
            if height < 20 {
                return CGSize(width: self.view.frame.width, height: height + 60)
            }
            else if height >= 20 && height < 40 {
                return CGSize(width: self.view.frame.width, height: height + 80)
            }
            else {
                return CGSize(width: self.view.frame.width, height: height + 100)
            }
        }
        else if musicHugChatData[indexPath.row].chatType == .me {
            let height = heightForView(text: musicHugChatData[indexPath.row].messageText, font: UIFont.AppleSDGothicM(size: 14), width: 220)
            
            if height < 20 {
                return CGSize(width: self.view.frame.width, height: height + 28)
            }
            else if height >= 20 && height < 40 {
                return CGSize(width: self.view.frame.width, height: height + 80)
            }
            else {
                return CGSize(width: self.view.frame.width, height: height + 100)
            }
        }
        else {
            return CGSize(width: self.view.frame.width, height: self.view.frame.height)
        }
    }
}

//MARK: - Custom Method
extension ChatVC {
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
