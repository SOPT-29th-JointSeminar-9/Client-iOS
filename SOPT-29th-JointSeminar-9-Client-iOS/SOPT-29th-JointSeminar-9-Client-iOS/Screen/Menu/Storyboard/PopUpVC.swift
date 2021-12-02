//
//  PopUpVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/20.
//

import UIKit

class PopUpVC: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var roomTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var listenButton: UIButton!
    @IBOutlet weak var cancleButton: UIButton!
    
    @IBAction func touchUpToGoMusicHugVC(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func touchUpToGoChatVC(_ sender: Any) {
        requestCreateMusicHug()
        guard let vc = UIStoryboard(name: "Chat", bundle: nil).instantiateViewController(withIdentifier: Identifiers.chatVC) as? ChatVC else { return }
        vc.roomTitle = roomTextField.text
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        nickNameTextField.layer.cornerRadius = 10
        roomTextField.layer.cornerRadius = 10
        backView.layer.cornerRadius = 15
        nickNameTextField.borderStyle = .none
        roomTextField.borderStyle = .none
        nickNameTextField.addLeftPadding()
        roomTextField.addLeftPadding()
        listenButton.titleLabel?.textColor = .main
        cancleButton.titleLabel?.textColor = .gray3
        nickNameTextField.backgroundColor = .gray1
        roomTextField.backgroundColor = .gray1
        middleView.backgroundColor = .gray1
        nickNameLabel.textColor = .gray2
        roomTextField.textColor = .gray3
        roomLabel.textColor = .gray2
        roomTextField.placeholder = "나만의 뮤직허그 방명을 입력하세요."
        nickNameLabel.text = "닉네임 변경은 내정보>설정에서 가능합니다."
        roomLabel.text = "최대 20자까지 입력 가능합니다."
        listenButton.titleLabel?.font = UIFont.AppleSDGothicM(size: 14)
        cancleButton.titleLabel?.font = UIFont.AppleSDGothicM(size: 14)
        nickNameTextField.font = UIFont.AppleSDGothicM(size: 14)
        roomTextField.font = UIFont.AppleSDGothicM(size: 14)
        nickNameLabel.font = UIFont.AppleSDGothicM(size: 11)
        roomLabel.font = UIFont.AppleSDGothicM(size: 11)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

//MARK: - Network
extension PopUpVC {
    /// requestCreateMusicHug - 뮤직허그 방 생성하는(post) 함수
    func requestCreateMusicHug() {
        MusicHugAPI.shared.createMusicHugAPI(hugTitle: roomTextField.text ?? "", nickname: nickNameTextField.text ?? "") { networkResult in
            switch networkResult {
            case .success(let msg):
                if let message = msg as? String {
                    print(message)
                }
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
