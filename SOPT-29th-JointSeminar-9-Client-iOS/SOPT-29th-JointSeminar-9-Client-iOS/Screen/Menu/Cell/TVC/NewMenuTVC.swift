//
//  NewMenuTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/25.
//

import UIKit

class NewMenuTVC: UITableViewCell {
  
  //MARK: - UI Component
  
  @IBOutlet weak var tableView: UITableView!
  var newData: [MusicHugDetailData] = []
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    requestNewData()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  //MARK: - Func
  
  func setupDelegate() {
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  func registerXib() {
    let xibName = UINib(nibName: Identifiers.newTVC, bundle: nil)
    tableView.register(xibName, forCellReuseIdentifier: Identifiers.newTVC)
  }
}
  
//MARK: - Extension : UITableViewDelegate

extension NewMenuTVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}

//MARK: - Extension : UITableViewDataSource

extension NewMenuTVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 7
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.newTVC, for: indexPath) as? NewTVC else {
        return UITableViewCell()
    }
    cell.setData(data: newData[indexPath.row+58])
    cell.selectionStyle = .none
    return cell
  }
}

//MARK: - Network
extension NewMenuTVC {
  func requestNewData() {
    MusicHugAPI.shared.getDataNewAPI() { [self] networkResult in
      switch networkResult {
      case .success(let res):
        if let data = res as? [MusicHugDetailData] {
          self.newData = data
          setupDelegate()
          registerXib()
          print("success")
          tableView.reloadData()
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
  

