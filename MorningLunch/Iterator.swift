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
  func next() -> AnyObject
}