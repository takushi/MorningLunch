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
  
  /**
  菜食メニューを全て出力します
  */
  func printVegetarianMenu() {
    let iterator: Iterator = self.allMenus.createIterator()
    print("\n菜食メニュー\n----")
    while iterator.hasNext() {
      if let menuComponent: MenuComponent = iterator.next() as? MenuComponent {
        if menuComponent.isVegetarioan() {
          menuComponent.printMenu()
        }
      }
    }
  }
}