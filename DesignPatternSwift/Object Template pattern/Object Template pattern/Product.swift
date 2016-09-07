//
//  Product.swift
//  Object Template pattern
//
//  Created by martin chibwe on 9/6/16.
//  Copyright © 2016 Martin Chibwe. All rights reserved.
//

import Foundation

class Product {
	var name: String
	var description: String
	var price: Double
	var stock: Int
	
	
	init(name: String, description:String, price: Double, stock: Int){
		self.name = name
		self.description = description
		self.price = price
		self.stock = stock
	}
}