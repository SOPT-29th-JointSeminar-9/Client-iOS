//
//  MenuContentData.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 임주민 on 2021/11/19.
//

import UIKit

var newContentList: [ContentData] = []
var popularContentList: [ContentData] = []

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
