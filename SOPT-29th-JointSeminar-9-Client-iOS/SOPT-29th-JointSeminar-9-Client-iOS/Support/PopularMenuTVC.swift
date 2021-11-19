//
//  PopularMenuTVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit

class PopularMenuTVC: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var popularContentList: [ContentData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initContentList()
        registerXib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerXib() {
        let xibName = UINib(nibName: Identifiers.popularCVC, bundle: nil)
        collectionView.register(xibName, forCellWithReuseIdentifier: Identifiers.popularCVC)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initContentList() {
        popularContentList.append(contentsOf: [
            ContentData(title: "낮잠", artist: "실리카겔", description: "나른한 오후,\n햇살과 어울리는 음악🌞", DJname: "Mez1nee", fans: "35.4K", listeners: "985", imgName: "mainImgCover5"),
            ContentData(title: "19", artist: "뎁트", description: "학창시절을 떠올리게\n하는 하이틴 노래모음", DJname: "효린쓰", fans: "42K", listeners: "593", imgName: "mainImgCover4"),
            ContentData(title: "Lemonade", artist: "NCT 127", description: "밤샘작업💦하는 당신을\n위한 흥겨운 K-POP", DJname: "강쥐가 세상을 구한다", fans: "13.7K", listeners: "426", imgName: "mainImgCover3"),
            ContentData(title: "Big Love", artist: "검정치마 (The Black Skirts)", description: "요즘 같은 날씨에\n듣기 좋은 감성플리🎶", DJname: "햄버거시키지마라", fans: "52.9K", listeners: "321", imgName: "mainImgCover2"),
            ContentData(title: "Sea Gets Hotter (Feat. Aar...", artist: "Durand Jones & The Indications", description: "포근함을\n노래로 만든다면", DJname: "auaoavxx", fans: "8.2K", listeners: "112", imgName: "mainImgCover1")
        ])
    }
}

extension PopularMenuTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.popularCVC, for: indexPath) as? PopularCVC else {
            return UICollectionViewCell()
        }
        cell.setData(rank: indexPath.row, data: popularContentList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularContentList.count
    }
}

extension PopularMenuTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 225, height: 310)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
