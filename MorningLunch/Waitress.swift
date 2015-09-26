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
//  /// パンケーキのメニュー
//  let pancakeHouseMenu: Menu
//  /// 食堂のメニュー
//  let dinerMenu: Menu
//  /// カフェのメニュー
//  let cafeMenu: Menu
//  
//  /**
//  イニシャライザ
//  
//  - parameter pancakeHouse: パンケーキのメニュー
//  - parameter dinerMenu:    食堂のメニュー
//  
//  - returns: ウェイトレス
//  */
//  init(pancakeHouseMenu: Menu, dinerMenu: Menu, cafeMenu: CafeMenu) {
//    self.pancakeHouseMenu = pancakeHouseMenu
//    self.dinerMenu = dinerMenu
//    self.cafeMenu = cafeMenu
//  }
//  
//  /**
//  メニューのすべてを出力します
//  */
//  func printmMenu() {
//    let pancakeIterator: Iterator = self.pancakeHouseMenu.createIterator()
//    let dinerIterator: Iterator = self.dinerMenu.createIterator()
//    let cafeIterator: Iterator = self.cafeMenu.createIterator()
//    
//    print("メニュー\n----\n朝食")
//    self.printMenu(pancakeIterator)
//    print("\n昼食")
//    self.printMenu(dinerIterator)
//    print("\n夕食")
//    self.printMenu(cafeIterator)
//  }
  /// メニュー
  private let menus: [Menu]
  
  /**
  イニシャライザ
  
  - parameter menus: メニュー
  
  - returns: ウェイトレス
  */
  init(menus: [Menu]) {
    self.menus = menus
  }
  
  /**
  メニューのすべてを出力します
  */
  func printMenu() {
    for menu in self.menus {
      self.printMenu(menu.createIterator())
    }
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