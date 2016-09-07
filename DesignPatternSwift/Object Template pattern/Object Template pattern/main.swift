//
//  main.swift
//  Object Template pattern
//
//  Created by martin chibwe on 9/6/16.
//  Copyright © 2016 Martin Chibwe. All rights reserved.
//

import Foundation

var products = [
	Product(name: "iPad", description: "Device with a 7 inche display", price: 600.00, stock: 12),
	Product(name: "Kayak",description: "pants to wear", price: 275, stock: 10),
	Product(name: "Lifejacket",description: "some jacket ", price: 48.95, stock: 14),
	Product(name: "Soccer Ball",description: " some soccer balls", price: 19.5, stock: 32)]




func calculateTax(product: Product) -> Double{
	return product.price * 0.2
}

func calculateStockValue(productsArray: [Product]) -> Double {
	
	return productsArray.reduce(0, combine: { (total, product) -> Double in
		
		return total + (product.price * Double(product.stock))
	})
}



print("Sales tax for iPad : \(calculateTax(products[0]))")
print("Total of stock: \(calculateStockValue(products))")
