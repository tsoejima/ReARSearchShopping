//
//  GradationSetting.swift
//  ReARSearchShopping
//
//  Created by 副島拓哉 on 2021/04/03.
//

import Foundation
import UIKit

final class gradetionSetting{
    let gradientLayer = CAGradientLayer()
    
    func gradation(){
    gradientLayer.frame = CGRect(x: 0, y: 0, width: 65, height: 65)
    // グラデーションカラーの設定
    gradientLayer.colors = [UIColor(red: 0.517, green: 0.980, blue:0.690, alpha: 1.000).cgColor,
                            UIColor(red: 0.560, green: 0.827, blue:0.956, alpha: 1.000).cgColor]
    // 上から下へグラデーション向きの設定
    gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint.init(x: 1, y:1)
    gradientLayer.cornerRadius = 32.5
    }
}
