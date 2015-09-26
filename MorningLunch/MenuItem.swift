//
//  MenuItem.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// メニュー
class MenuItem {
  /// 名前
  private(set) var name: String
  
  /// 説明
  private(set) var description: String
  
  /// 菜食主義
  private(set) var vegetarian: Bool
  
  /// 価格
  private(set) var price: Double
  
  /**
  イニシャライザ
  
  - parameter name:       名前
  - parameter decription: 説明
  - parameter vegetarian: 菜食主義
  - parameter price:      価格
  
  - returns: メニュー
  */
  init(name: String, description: String, vegetarian: Bool, price: Double) {
    self.name        = name
    self.description = description
    self.vegetarian  = vegetarian
    self.price       = price
  }
}