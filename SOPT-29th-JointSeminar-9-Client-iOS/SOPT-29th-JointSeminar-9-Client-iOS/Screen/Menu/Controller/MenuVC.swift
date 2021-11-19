//
//  MenuVC.swift
//  SOPT-29th-JointSeminar-9-Client-iOS
//
//  Created by 황지은 on 2021/11/14.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBAction func touchUpToMusicHugVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MusicHugVC") else {return}
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.sizeToFit()
        super.viewDidLoad()
    }
}
