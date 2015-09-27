//
//  main.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

let pancakeMenu: Menu = Menu(name: "パンケーキハウスメニュー", description: "朝食")
let dinerMenu: Menu = Menu(name: "食堂メニュー", description: "昼食")
let cafeMenu: Menu = Menu(name: "カフェメニュー", description: "夕食")
let dessertMenu: Menu = Menu(name: "デザートメニュー", description: "もちろんデザート！")

let allMenu: MenuComponent = Menu(name: "すべてのメニュー", description: "すべてを統合したメニュー")
allMenu.add(pancakeMenu)
allMenu.add(dinerMenu)
allMenu.add(cafeMenu)

pancakeMenu.add(MenuItem(name: "K&Bのパンケーキ朝食", description: "スクランブルエッグとトーストが付いたパンケーキ", vegetarian: true, price: 2.99))
pancakeMenu.add(MenuItem(name: "通常のパンケーキ朝食", description: "卵焼きとソーセージが付いたパンケーキ", vegetarian: false, price: 2.99))
pancakeMenu.add(MenuItem(name: "ブルーベリーパンケーキ", description: "新鮮なブルーベリーで作ったパンケーキ", vegetarian: true, price: 3.49))
pancakeMenu.add(MenuItem(name: "ワッフル", description: "ブルーベリーか苺の好きな方をのせたワッフル", vegetarian: true, price: 3.59))

dinerMenu.add(MenuItem(name: "ベジタリアンBLT", description: "レタス、トマト、（偽）ベーコンをはさんだ全粒小麦パンサンドイッチ", vegetarian: true, price: 2.99))
dinerMenu.add(MenuItem(name: "BLT", description: "レタス、トマト、ベーコンをはさんだ全粒小麦パンサンドイッチ", vegetarian: false, price: 2.99))
dinerMenu.add(MenuItem(name: "本日のスープ", description: "ポテトサラダを添えた本日のスープ", vegetarian: false, price: 3.29))
dinerMenu.add(MenuItem(name: "HotDog", description: "ザワークラウト、レリッシュ、玉ねぎ、チーズを挟んだホットドッグ", vegetarian: false, price: 3.05))
dinerMenu.add(MenuItem(name: "パスタ", description: "マリナラソースのかかったスパゲティとサワードーパン", vegetarian: true, price: 3.89))
dinerMenu.add(dessertMenu)

dessertMenu.add(MenuItem(name: "アップルパイ", description: "バニラアイスクリームをのせたフレーク状生地のアップルパイ", vegetarian: true, price: 1.59))
dessertMenu.add(MenuItem(name: "チーズケーキ", description: "チョコレートグラハム生地のクリーミーなニューヨークチーズケーキ", vegetarian: true, price: 1.99))
dessertMenu.add(MenuItem(name: "シャーベット", description: "ひとすくいのラズベリーシャーベットをライムシャーベット", vegetarian: true, price: 1.89))

cafeMenu.add(MenuItem(name: "野菜バーガーとフライドポテト", description: "全粒小麦パンにレタスとトマトをはさんだ野菜バーガーとフライドポテト", vegetarian: true, price: 3.99))
cafeMenu.add(MenuItem(name: "本日のスープ", description: "サラダがついた本日のスープ", vegetarian: false, price: 3.69))
cafeMenu.add(MenuItem(name: "ブリトー", description: "インゲン豆、サルサ、グアカモーレ入りの大きなブリトー", vegetarian: true, price: 4.29))


let alice: Waitress = Waitress(allMenus: allMenu)
alice.printMenu()

