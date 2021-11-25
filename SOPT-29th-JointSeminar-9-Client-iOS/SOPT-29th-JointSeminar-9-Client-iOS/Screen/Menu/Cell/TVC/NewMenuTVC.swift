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
    initContentList()
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
  
  //MARK: - 최신부분 임시 데이터 설정
  
  func initContentList() {
    newContentList.append(contentsOf: [
      ContentData(title: "Savage", artist: "aespa", description: "에스파 팬이라면 퍼가 ㅋ", DJname: "에스파는나야둘이될수없어", fans: "29", listeners: "2", imgName: "mainImgCover6"),
      ContentData(title: "새삼스럽게 왜", artist: "AKMU(악뮤)", description: "음색깡패들과 함께 고막호강", DJname: "hawonow", fans: "12", listeners: "5", imgName: "mainImgCover7"),
      ContentData(title: "사람의 마음", artist: "장기하와 얼굴들", description: "집으로 돌아가는 길, 노래 한 스푼", DJname: "나의라임오지는나무", fans: "3", listeners: "1", imgName: "mainImgCover8"),
      ContentData(title: "문득", artist: "BE'O(비오)", description: "배가 고파서 밥🍚을 차렸는데", DJname: "생갈치1호의행방불명", fans: "529", listeners: "32", imgName: "mainImgCover9"),
      ContentData(title: "island", artist: "10CM", description: "타이틀만큼 좋은 수록곡 Playlist", DJname: "danborii", fans: "0", listeners: "7", imgName: "mainImgCover10"),
      ContentData(title: "미안해(Feat.Beenzino)", artist: "Zion.T", description: "사과를 할 때는 이 노래를 틀어주세요", DJname: "oe9day", fans: "3", listeners: "84", imgName: "mainImgCover11"),
      ContentData(title: "True Romance", artist: "Citizens!", description: "우리가 사랑했던 🎧OST", DJname: "그대내게햄버거주는사람", fans: "0", listeners: "3", imgName: "mainImgCover12")
    ])
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

