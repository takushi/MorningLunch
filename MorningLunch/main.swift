//
//  main.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

let pancakeMenu: PancakeHouseMenu = PancakeHouseMenu()
let dinerMenu: DinerMenu = DinerMenu()
let cafeMenu: CafeMenu = CafeMenu()

//let alice: Waitress = Waitress(pancakeHouseMenu: pancakeMenu, dinerMenu: dinerMenu, cafeMenu: cafeMenu)
let alice: Waitress = Waitress(menus: [pancakeMenu, dinerMenu, cafeMenu])
alice.printMenu()

