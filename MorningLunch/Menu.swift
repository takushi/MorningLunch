//
//  Menu.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

// MARK: - Menu -
/**
*  メニュー
*/
protocol Menu {
  
  /**
  イテレータを作成します
  
  - returns: イテレータ
  */
  func createIterator() -> Iterator
}

// MARK: - パンケーキ -
/// パンケーキのメニュー
class PancakeHouseMenu: Menu {
  /// メニュー
  private var menuItems: Array<AnyObject>
  
  /**
  イニシャライザ
  
  - returns: パンケーキのメニュー
  */
  init() {
    self.menuItems = Array()
    
    self.addItem("K&Bのパンケーキ朝食", description: "スクランブルエッグとトーストが付いたパンケーキ", vegetarian: true, price: 2.99)
    self.addItem("通常のパンケーキ朝食", description: "卵焼きとソーセージが付いたパンケーキ", vegetarian: false, price: 2.99)
    self.addItem("ブルーベリーパンケーキ", description: "新鮮なブルーベリーで作ったパンケーキ", vegetarian: true, price: 3.49)
    self.addItem("ワッフル", description: "ブルーベリーか苺の好きな方をのせたワッフル", vegetarian: true, price: 3.59)
  }
  
  /**
  メニューを追加します
  
  - parameter name:       名前
  - parameter decription: 説明
  - parameter vegetarian: 菜食主義
  - parameter price:      価格
  */
  private func addItem(name: String
    , description: String
    , vegetarian: Bool
    , price: Double) {
      let menuItem: MenuItem = MenuItem(name: name, description: description, vegetarian: vegetarian, price: price)
      self.menuItems.append(menuItem)
  }
  
  /**
  イテレータを取得します
  
  - returns: イテレータ
  */
  func createIterator() -> Iterator {
    return PancakeHouseIterator(items: self.menuItems)
  }
}

/// パンケーキメニューのイテレータ
class PancakeHouseIterator: Iterator {
  /// パンケーキメニュー
  let items: Array<AnyObject>
  
  /// イテレータの位置
  var position: Int
  
  /**
  イニシャライザ
  
  - parameter items: パンケーキメニュー
  
  - returns: パンケーキメニューのイテレータ
  */
  init(items: Array<AnyObject>) {
    self.items    = items
    self.position = 0
  }
  
  /**
  次のパンケーキメニューを取得します
  
  - returns: 次の食堂メニュー
  */
  func next() -> AnyObject {
    let menuItem: MenuItem = self.items[position] as! MenuItem
    self.position += 1
    return menuItem
  }
  
  /**
  反復処理を行い食堂メニューがあるか示します
  
  - returns: trueなら食堂メニューがあり、falseならありません
  */
  func hasNext() -> Bool {
    if self.position >= self.items.count {
      return false
    } else {
      return true
    }
  }
}

// MARK: - 食堂 -
/// 食堂のメニュー
class DinerMenu: Menu {
  /// メニューの最大個数
  private let MAX_ITEMS: Int
  
  /// メニューの数
  private var numberOfItems: Int
  
  /// メニュー
  private var menuItems: [MenuItem]
  
  /**
  イニシャライザ
  
  - returns: 食堂のメニュー
  */
  init() {
    self.MAX_ITEMS = 6
    self.numberOfItems = 0
    self.menuItems = []
    
    self.addItem("ベジタリアンBLT", description: "レタス、トマト、（偽）ベーコンをはさんだ全粒小麦パンサンドイッチ", vegetarian: true, price: 2.99)
    self.addItem("BLT", description: "レタス、トマト、ベーコンをはさんだ全粒小麦パンサンドイッチ", vegetarian: false, price: 2.99)
    self.addItem("本日のスープ", description: "ポテトサラダを添えた本日のスープ", vegetarian: false, price: 3.29)
    self.addItem("HotDog", description: "ザワークラウト、レリッシュ、玉ねぎ、チーズを挟んだホットドッグ", vegetarian: false, price: 3.05)
  }
  
  /**
  メニューを追加します
  
  - parameter name:       名前
  - parameter decription: 説明
  - parameter vegetarian: 菜食主義
  - parameter price:      価格
  */
  private func addItem(name: String
    , description: String
    , vegetarian: Bool
    , price: Double) {
      let menuItem: MenuItem = MenuItem(name: name, description: description, vegetarian: vegetarian, price: price)
      if self.numberOfItems > self.MAX_ITEMS {
        print("すみません、メニューはいっぱいです！メニューに項目を追加できません。")
      } else {
        self.menuItems.append(menuItem)
        self.numberOfItems += 1
      }
  }
  
  /**
  イテレータを取得します
  
  - returns: イテレータ
  */
  func createIterator() -> Iterator {
    return DinerMenuIterator(items: self.menuItems)
  }
}

/// 食堂メニューのイテレータ
class DinerMenuIterator: Iterator {
  /// 食堂メニュー
  let items: [MenuItem]
  
  /// イテレータの位置
  var position: Int
  
  /**
  イニシャライザ
  
  - parameter items: 食堂メニュー
  
  - returns: 食堂メニューのイテレータ
  */
  init(items: [MenuItem]) {
    self.items    = items
    self.position = 0
  }
  
  /**
  次の食堂メニューを取得します
  
  - returns: 次の食堂メニュー
  */
  func next() -> AnyObject {
    let menuItem: MenuItem = self.items[position]
    self.position += 1
    return menuItem
  }
  
  /**
  反復処理を行う食堂メニューがあるか示します
  
  - returns: trueなら食堂メニューがあり、falseならありません
  */
  func hasNext() -> Bool {
    if self.position >= self.items.count {
      return false
    } else {
      return true
    }
  }
}