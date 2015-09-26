//
//  main.swift
//  MorningLunch
//
//  Created by Homma Takushi on 2015/09/26.
//  Copyright © 2015年 mfmf.me. All rights reserved.
//

import Foundation

let pancakeMenu = PancakeHouseMenu()
let dinerMenu = DinerMenu()

let alice: Waitress = Waitress(pancakeHouseMenu: pancakeMenu, dinerMenu: dinerMenu)
alice.printmMenu()

