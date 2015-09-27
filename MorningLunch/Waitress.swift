//
//  Waitress.swift
//  MorningLunch
//  Head First デザインパターン 9章 IteratorパターンとCompositeパターン：適切に管理されたコレクション
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// ウェイトレス
class Waitress {
  /// メニュー
  let allMenus: MenuComponent
  
  /**
  イニシャライザ
  
  - parameter allMenus: メニュー
  
  - returns: ウェイトレス
  */
  init(allMenus: MenuComponent) {
    self.allMenus = allMenus
  }
  
  /**
  メニューを全て出力します
  */
  func printMenu() {
    self.allMenus.printMenu()
  }
}