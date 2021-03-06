//
//  MenuPageCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/18.
//

import UIKit
import Alamofire

protocol TVCellDelegate {
  func createButtonDidTapped()
}

class MenuPageCVC: UICollectionViewCell {
  
  //MARK: - Vars & Lets

  var delegate: TVCellDelegate?
  var numofRoom: String? = "7"
  private let sections: [String] = ["실시간 인기", "최신"]
  
  //MARK : - UI Component
  
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - Life Cycle Part
  
  override func awakeFromNib() {
    super.awakeFromNib()
    registerXib()
    setAttributes()
  }
  
  //MARK: - Func
  
  func setAttributes() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    tableView.tableFooterView = UIView(frame: .zero)
    tableView.sectionFooterHeight = 0
    tableView.sectionHeaderHeight = 100
  }
  
  func registerXib() {
    let xibName = UINib(nibName: Identifiers.popularMenuTVC, bundle: nil)
    tableView.register(xibName, forCellReuseIdentifier: Identifiers.popularMenuTVC)
    
    let xibName2 = UINib(nibName: Identifiers.buttonTVC, bundle: nil)
    tableView.register(xibName2, forCellReuseIdentifier: Identifiers.buttonTVC)
    
    let xibName3 = UINib(nibName: Identifiers.newMenuTVC, bundle: nil)
    tableView.register(xibName3, forCellReuseIdentifier: Identifiers.newMenuTVC)

    let xibName4 = UINib(nibName: Identifiers.upButtonTVC, bundle: nil)
    tableView.register(xibName4, forCellReuseIdentifier: Identifiers.upButtonTVC)
    
    let xibName5 = UINib(nibName: Identifiers.bottomEmptyTVC, bundle: nil)
    tableView.register(xibName5, forCellReuseIdentifier: Identifiers.bottomEmptyTVC)
  }
}

//MARK: - Extension : UITableViewDataSource

extension MenuPageCVC: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 2
    } else if section == 1 {
      return 3
    } else {
      return 2
    }
  }
  
  //홈탭의 테이블뷰
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0: //실시간 인기
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.popularMenuTVC)
                as? PopularMenuTVC else { return UITableViewCell() }
        return cell
      case 1: //개설하기 버튼
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.buttonTVC, for: indexPath) as? ButtonTVC else { return UITableViewCell() }
        cell.buttonTapped = { [self](cell) -> Void in
          if let delegate = delegate {
            delegate.createButtonDidTapped()
          }
        }
        cell.selectionStyle = .none
        return cell
      default:
        return UITableViewCell()
      }
    } else if indexPath.section == 1 {
      switch indexPath.row {
      case 0: //최신
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.newMenuTVC) as? NewMenuTVC else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
      case 1: //맨위로 버튼
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.upButtonTVC) as? UpButtonTVC else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
      case 2:
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.bottomEmptyTVC) as? BottomEmptyTVC else { return UITableViewCell() }
        return cell
      default:
        return UITableViewCell()
      }
    } else {
      return UITableViewCell()
    }
  }
}

//MARK: - Extension : UITableViewDelegate

extension MenuPageCVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0: //실시간 인기
        return 370
      case 1: //개설하기 버튼
        return 60
      default:
        return 0
      }
    } else if indexPath.section == 1 {
      switch indexPath.row {
      case 0: //최신
        return CGFloat(125*7)
      case 1: //맨위로 버튼
        return 50
      case 2: //여분 공간
        return 80
      default:
        return 0
      }
    } else {
      return 0
    }
  }
  
  // 헤더 설정
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView().then {
      $0.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.width)
    }
    let label = UILabel().then {
      $0.frame = CGRect(x: 21, y: 45, width: 94, height: 19)
      $0.text = sections[section]
      $0.font = UIFont.AppleSDGothicM(size: 19)
      $0.textColor = .black
    }
    let numlabel = UILabel().then {
      $0.frame = CGRect(x: 64, y: 46, width: 76, height: 18)
      $0.backgroundColor = .white
      $0.textColor = .main
      $0.font = UIFont.AppleSDGothicSB(size: 19)
      $0.text = numofRoom
    }
    headerView.addSubview(label)
    if section == 1 {
      headerView.addSubview(numlabel)
    }
    return headerView
  }
  
  // 헤더 사이즈 설정
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 70
  }
  
  // 맨위로 버튼 액션
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 1 && indexPath.row == 1 {
      print("맨위로")
      tableView.setContentOffset(CGPoint.zero, animated: true)
    }
  }
}
