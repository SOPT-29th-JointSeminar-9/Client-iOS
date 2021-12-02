//
//  ChatMusicBottomVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/16.
//

import UIKit
import SnapKit
import Then

class ChatMusicBottomVC: UIViewController {
    
    var roomChatData: [MusicHugDetailData] = []
    private var bottomMusicView: BottomMusicBarView?

    override func viewDidLoad() {
        super.viewDidLoad()
        requestGetDetailMusicHug()
    }
    
    func initBottomMusicView() {
        bottomMusicView = BottomMusicBarView(frame: self.view.frame, state: .chat, model: roomChatData[0])
    }
    
    func configureLayout() {
        self.view.addSubview(bottomMusicView ?? UIView())
        bottomMusicView?.snp.makeConstraints {
            $0.bottom.leading.trailing.equalTo(self.view).offset(0)
            $0.height.equalTo(68)
        }
    }
    
    func addTapGessture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        bottomMusicView?.addGestureRecognizer(tap)
    }
    
    //MARK: BottomMusicBarView에 Tap Gesture 발생 시 실행되는 함수
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
    
        // MusicPlayerVC로 이동하게끔 코드 변경 필요
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: Identifiers.heartVC) as? HeartVC else { return }
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
//MARK: - Network
extension ChatMusicBottomVC {
    func requestGetDetailMusicHug() {
        MusicHugAPI.shared.getDetailMusicHugAPI(hugID: "1") { [self] networkResult in
            switch networkResult {
            case .success(let res):
                if let data = res as? MusicHugDetailData {
                    self.roomChatData = [data]
                    initBottomMusicView()
                    configureLayout()
                    addTapGessture()
                }
                print("success")
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
