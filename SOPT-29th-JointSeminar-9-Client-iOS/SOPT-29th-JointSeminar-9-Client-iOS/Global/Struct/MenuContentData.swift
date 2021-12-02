//
//  MenuContentData.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit
/*
var newContentList: [ContentData] = [
  ContentData(title: "Savage", artist: "aespa", description: "에스파 팬이라면 퍼가 ㅋ", DJname: "에스파는나야둘이될수없어", fans: "29", listeners: "2", imgName: "mainImgCover6"),
  ContentData(title: "새삼스럽게 왜", artist: "AKMU(악뮤)", description: "음색깡패들과 함께 고막호강", DJname: "hawonow", fans: "12", listeners: "5", imgName: "mainImgCover7"),
  ContentData(title: "사람의 마음", artist: "장기하와 얼굴들", description: "집으로 돌아가는 길, 노래 한 스푼", DJname: "나의라임오지는나무", fans: "3", listeners: "1", imgName: "mainImgCover8"),
  ContentData(title: "문득", artist: "BE'O(비오)", description: "배가 고파서 밥🍚을 차렸는데", DJname: "생갈치1호의행방불명", fans: "529", listeners: "32", imgName: "mainImgCover9"),
  ContentData(title: "island", artist: "10CM", description: "타이틀만큼 좋은 수록곡 Playlist", DJname: "danborii", fans: "0", listeners: "7", imgName: "mainImgCover10"),
  ContentData(title: "미안해(Feat.Beenzino)", artist: "Zion.T", description: "사과를 할 때는 이 노래를 틀어주세요", DJname: "oe9day", fans: "3", listeners: "84", imgName: "mainImgCover11"),
  ContentData(title: "True Romance", artist: "Citizens!", description: "우리가 사랑했던 🎧OST", DJname: "그대내게햄버거주는사람", fans: "0", listeners: "3", imgName: "mainImgCover12")
]*/
var popularContentList: [ContentData] = [
  ContentData(title: "낮잠", artist: "실리카겔", description: "나른한 오후,\n햇살과 어울리는 음악🌞", DJname: "Mez1nee", fans: "35.4K", listeners: "985", imgName: "mainImgCover5"),
  ContentData(title: "19", artist: "뎁트", description: "학창시절을 떠올리게\n하는 하이틴 노래모음", DJname: "효린쓰", fans: "42K", listeners: "593", imgName: "mainImgCover4"),
  ContentData(title: "Lemonade", artist: "NCT 127", description: "밤샘작업💦하는 당신을\n위한 흥겨운 K-POP", DJname: "강쥐가 세상을 구한다", fans: "13.7K", listeners: "426", imgName: "mainImgCover3"),
  ContentData(title: "Big Love", artist: "검정치마 (The Black Skirts)", description: "요즘 같은 날씨에\n듣기 좋은 감성플리🎶", DJname: "햄버거시키지마라", fans: "52.9K", listeners: "321", imgName: "mainImgCover2"),
  ContentData(title: "Sea Gets Hotter (Feat. Aar...", artist: "Durand Jones & The Indications", description: "포근함을\n노래로 만든다면", DJname: "auaoavxx", fans: "8.2K", listeners: "112", imgName: "mainImgCover1")
]

struct PageContentData {
  let pageName: String
}

struct ContentData {
  let title: String
  let artist: String
  let description: String
  let DJname: String
  let fans: String
  let listeners: String
  let imgName: String
  
  func makeImage() -> UIImage? {
    return UIImage(named: imgName)
  }
}
