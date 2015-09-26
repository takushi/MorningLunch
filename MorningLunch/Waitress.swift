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
  /// パンケーキのメニュー
  let pancakeHouseMenu: Menu
  /// 食堂のメニュー
  let dinerMenu: Menu
  
  /**
  イニシャライザ
  
  - parameter pancakeHouse: パンケーキのメニュー
  - parameter dinerMenu:    食堂のメニュー
  
  - returns: ウェイトレス
  */
  init(pancakeHouseMenu: Menu, dinerMenu: Menu) {
    self.pancakeHouseMenu = pancakeHouseMenu
    self.dinerMenu = dinerMenu
  }
  
  /**
  メニューのすべてを出力します
  */
  func printmMenu() {
    let pancakeIterator: Iterator = self.pancakeHouseMenu.createIterator()
    let dinerIterator: Iterator = self.dinerMenu.createIterator()
    print("メニュー\n----\n朝食")
    self.printMenu(pancakeIterator)
    print("\n昼食")
    self.printMenu(dinerIterator)
  }
  
  /**
  メニューを出力します
  
  - parameter iterator: イテレータ
  */
  private func printMenu(iterator: Iterator) {
    while iterator.hasNext() {
      let menuItem: MenuItem = iterator.next() as! MenuItem
      print("\(menuItem.name)、\(menuItem.price) -- \(menuItem.description)")
    }
  }
}