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
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    registerXib()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  //MARK: - Func
  
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
    return newContentList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.newTVC, for: indexPath) as? NewTVC else {
        return UITableViewCell()
    }
    cell.setData(data: newContentList[indexPath.row])
    cell.selectionStyle = .none
    return cell
  }
}

