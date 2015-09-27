//
//  Menu.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/// メニューコンポーネント
class MenuComponent {
  /**
  イニシャライザ
  
  - returns: 使用禁止
  
  - throws: 抽象クラスはインスタンス化できません
  */
  init() {
    if (self.dynamicType === MenuComponent.self) {
      fatalError("Abstract Class")
    }
  }
  
  /**
  メニューコンポーネントを追加します
  
  - parameter menuComponent: メニューコンポーネント
  
  - throws: 抽象メソッドは呼び出せません
  */
  func add(menuComponent: MenuComponent) {
    fatalError("Abstract Class")
  }
  
  /**
  メニューコンポーネントを削除します
  
  - parameter menuComponent: メニューコンポーネント
  
  - throws: 抽象メソッドは呼び出せません
  */
  func remove(menuComponent: MenuComponent) {
    fatalError("Abstract Class")
  }
  
  /**
  メニューコンポーネントを取得します
  
  - parameter i: インデックス
  */
  func getChild(i: Int) -> MenuComponent {
    fatalError("Abstract Class")
  }
  
  /**
  名前
  
  - throws: 抽象メソッドは呼び出せません
  */
  func getName() -> String {
    fatalError("Abstract Class")
  }
  
  /**
  説明
  
  - throws: 抽象メソッドは呼び出せません
  */
  func getDescription() -> String {
    fatalError("Abstract Class")
  }
  
  /**
  価格
  
  - throws: 抽象メソッドは呼び出せません
  */
  func getPrice() -> Double {
    fatalError("Abstract Class")
  }

  /**
  菜食主義
  
  - throws: 抽象メソッドは呼び出せません
  */
  func isVegetarioan() -> Bool {
    fatalError("Abstract Class")
  }
  
  /**
  出力します
  
  - throws: 抽象メソッドは呼び出せません
  */
  func printMenu() {
    fatalError("Abstract Class")
  }
  
  /**
  同じメニューコンポーネントか
  
  - parameter menu1: メニューコンポーネント
  - parameter menu2: メニューコンポーネント
  
  - returns: 同じならTrue、違えばFalse
  */
  private func Equal(x: MenuComponent, y: MenuComponent) -> Bool {
    if x.getName() == y.getName() {
      return true
    } else {
      return false
    }
  }
}

/// メニュー
class Menu: MenuComponent {
  /// メニュー
  private var menuComponents: [MenuComponent]
  /// 名前
  private let name: String
  /// 説明
  private let description: String
  
  /**
  イニシャライザ
  
  - parameter name:        名前
  - parameter description: 説明
  
  - returns: メニュー
  */
  init(name: String, description: String) {
    self.menuComponents = []
    self.name = name
    self.description = description
  }

  /**
  メニューコンポーネントを追加します
  
  - parameter menuComponent: メニューコンポーネント
  */
  override func add(menuComponent: MenuComponent) {
    self.menuComponents.append(menuComponent)
  }
  
  /**
  メニューコンポーネントを削除します
  
  - parameter menuComponent: メニューコンポーネント
  */
  override final func remove(menuComponent: MenuComponent) {
    for i in 0...self.menuComponents.count {
      if super.Equal(menuComponent, y: self.menuComponents[i]) {
        self.menuComponents.removeAtIndex(i)
        return
      }
    }
  }
  
  /**
  メニューコンポーネントを取得します
  
  - parameter i: インデックス
  */
  override func getChild(i: Int) -> MenuComponent {
    return self.menuComponents[i]
  }
  
  /**
  名前
  
  - returns: 名前
  */
  override func getName() -> String {
    return self.name
  }
  
  /**
  説明
  
  - returns: 説明
  */
  override func getDescription() -> String {
    return self.description
  }
  
  /**
  出力します
  */
  override func printMenu() {
    print("\n\(self.getName())、\(self.getDescription())")
    print("---------------")

    if let iterator: Iterator = self.createIterator() {
      while iterator.hasNext() {
        let menu: MenuComponent = iterator.next() as! MenuComponent
        menu.printMenu()
      }
    }
  }
  
  /**
  イテレータを作成します
  
  - returns: イテレータ
  */
  func createIterator() -> Iterator? {
    return MenuIterator(items: self.menuComponents)
  }
}

/// メニューのイテレータ
class MenuIterator: Iterator {
  /// メニュー
  let items: [MenuComponent]
  /// イテレータの位置
  var position: Int
  
  /**
  イニシャライザ
  
  - parameter items: メニュー
  
  - returns: メニューのイテレータ
  */
  init(items: [MenuComponent]) {
    self.items    = items
    self.position = 0
  }
  
  /**
  次のメニューを取得します
  
  - returns: 次のメニュー
  */
  func next() -> AnyObject {
    let item: MenuComponent = self.items[position]
    self.position += 1
    return item
  }
  
  /**
  反復処理を行いメニューがあるか示します
  
  - returns: trueならメニューがあり、falseならありません
  */
  func hasNext() -> Bool {
    if self.position >= self.items.count {
      return false
    } else {
      return true
    }
  } 
}

/// メニュー
class MenuItem : MenuComponent {
  /// 名前
  private var name: String
  /// 説明
  private var description: String
  /// 菜食主義
  private var vegetarian: Bool
  /// 価格
  private var price: Double
  
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
  
  /**
  名前
  
  - returns: 名前
  */
  override func getName() -> String {
    return self.name
  }
  
  /**
  説明
  
  - returns: 説明
  */
  override func getDescription() -> String {
    return self.description
  }
  
  /**
  価格
  
  - returns: 価格
  */
  override func getPrice() -> Double {
    return self.price
  }
  
  /**
  菜食主義
  
  - returns: 菜食主義
  */
  override func isVegetarioan() -> Bool {
    return self.vegetarian
  }
  
  /**
  メニューを出力します
  */
  override func printMenu() {
    var menu: String = " \(self.getName())"
    if self.isVegetarioan() {
      menu += "(v)"
    }
    menu += "、\(String(self.getPrice()))\n -- \(self.getDescription())"
    
    print(menu)
  }
}