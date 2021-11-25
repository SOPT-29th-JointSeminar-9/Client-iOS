//
//  MenuPageCVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/18.
//

import UIKit

protocol TVCellDelegate {
  func createButtonDidTapped()
}

class MenuPageCVC: UICollectionViewCell {
  
  //MARK: - Vars & Lets
  
  private let sections: [String] = ["실시간 인기", "최신"]
  var delegate: TVCellDelegate?
  
  //MARK : - UI Component
  
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - Life Cycle Part
  
  override func awakeFromNib() {
    super.awakeFromNib()
    registerXib()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
  }
  
  //MARK: - Func
  
  func registerXib() {
    let xibName = UINib(nibName: Identifiers.popularMenuTVC, bundle: nil)
    tableView.register(xibName, forCellReuseIdentifier: Identifiers.popularMenuTVC)
    
    let xibName2 = UINib(nibName: Identifiers.buttonTVC, bundle: nil)
    tableView.register(xibName2, forCellReuseIdentifier: Identifiers.buttonTVC)
    
    let xibName3 = UINib(nibName: Identifiers.newMenuTVC, bundle: nil)
    tableView.register(xibName3, forCellReuseIdentifier: Identifiers.newMenuTVC)

    let xibName4 = UINib(nibName: Identifiers.upButtonTVC, bundle: nil)
    tableView.register(xibName4, forCellReuseIdentifier: Identifiers.upButtonTVC)
  }
}

//MARK: - Extension : UITableViewDataSource

extension MenuPageCVC: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  //홈탭의 테이블뷰
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0: //실시간 인기
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.popularMenuTVC) as? PopularMenuTVC else { return UITableViewCell() }
        return cell
      case 1: //개설하기 버튼
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.buttonTVC, for: indexPath) as? ButtonTVC else {return UITableViewCell() }
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
        return cell
      case 1: //맨위로 버튼
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.upButtonTVC) as? UpButtonTVC else { return UITableViewCell() }
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
  // 각 테이블 뷰 height 설정
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      switch indexPath.row {
      case 0: //실시간 인기
        return 390
      case 1: //개설하기 버튼
        return 60
      default:
        return 390
      }
    } else if indexPath.section == 1 {
      switch indexPath.row {
      case 0: //최신
        return CGFloat(116*newContentList.count)
      case 1: //맨위로 버튼
        return 60
      default:
        return 390
      }
    } else {
      return 390
    }
  }
  
  // 홈탭 헤더 설정
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
    let label = UILabel()
    label.frame = CGRect.init(x: 21, y: 35, width: headerView.frame.width-10, height: headerView.frame.height-10)
    label.text = sections[section]
    label.font = UIFont.AppleSDGothicM(size: 19)
    label.textColor = .black
    
    headerView.addSubview(label)
    return headerView
  }
  
  // 헤더 사이즈 설정
  func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
  
  // 스크롤하면 헤더 사라지게 하기
  func scrollViewDidScroll(_ scrollView: UIScrollView){
    let scrollHeaderHeight = tableView.rowHeight
    
    if scrollView.contentOffset.y <= scrollHeaderHeight{
      if scrollView.contentOffset.y >= 0 {
        scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
      }
    } else if (scrollView.contentOffset.y >= scrollHeaderHeight){
      scrollView.contentInset = UIEdgeInsets(top: -scrollHeaderHeight, left: 0, bottom: 0, right: 0)
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.section == 1 && indexPath.row == 1 {
      print("맨위로")
      tableView.setContentOffset(CGPoint.zero, animated: true)
    }
  }
}
