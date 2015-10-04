//
//  Iterator.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

/**
*  反復処理
*/
protocol Iterator {
  
  /**
  反復処理を行う要素があるか示します
  
  - returns: trueなら要素があり、falseならありません
  */
  func hasNext() -> Bool
  
  /**
  次の要素を取得します
  
  - returns: 次の要素
  */
  func next() -> AnyObject?
}

/// メニューコンポーネントのイテレータ
class MenuComponentIterator: Iterator {
  var stack: [Iterator]
  
  /**
  イニシャライザ
  
  - parameter iterator: 反復処理を行う最上位のイテレータ
  
  - returns: メニューコンポーネントのイテレータ
  */
  init(iterator: Iterator) {
    self.stack = []
    self.stack.append(iterator)
  }
  
  /**
  次の要素を取得します
  
  - returns: 次の要素
  */
  func next() -> AnyObject? {
    if self.hasNext() {
      if let iterator: Iterator = self.stack.last, let component: MenuComponent = iterator.next() as? MenuComponent {
        if component is Menu {
          self.stack.append(component.createIterator())
        }
        return component
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
  
  /**
  次の要素があるか確認します
  
  - returns: Trueなら次の要素があり、Falseならありません
  */
  func hasNext() -> Bool {
    if self.stack.isEmpty {
      return false
    } else {
      if let iterator = self.stack.last {
        if !iterator.hasNext() {
          self.stack.removeLast()
          return hasNext()
        } else {
          return true
        }
      } else {
        return false
      }
    }
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
  func next() -> AnyObject? {
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

/// hasNextが呼び出されたときに常にfalseを返すイテレータ
class NullIterator: Iterator {
  /**
  次の要素を取得します
  
  - returns: 常にnilを返します
  */
  func next() -> AnyObject? {
    return nil
  }
  
  /**
  次の要素がある確認します
  
  - returns: 常にfalseを返します
  */
  func hasNext() -> Bool {
    return false
  }
}