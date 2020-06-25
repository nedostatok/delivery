//
//  RestaurantViewController.swift
//  delivery
//
//  Created by User on 20.06.2020.
//  Copyright © 2020 sad. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    let restaurantsArray: [Restaurant] = [Restaurant(name: "McDonalds", check: "150 грн", type: "Fastfood", deliveryTime: "20 мин", folowers: "666 followers", image: "mac", menu: [Menu(foodName: "Big tasty", foodPrice: "150грн", drink: ["Cola","Fanta","Spirte"]),
                                                        Menu(foodName: "Big mac", foodPrice: "100грн", drink: ["Cola","Fanta","Spirte"]),
                                                        Menu(foodName: "Mac flury", foodPrice: "1000грн", drink: ["Cola","Fanta","Spirte"])]),
                                          
                                          Restaurant(name: "KFC", check: "200 грн", type: "FastFood", deliveryTime: "30 мин", folowers: "500 followers", image: "kfc", menu: [Menu(foodName: "Chicken wings", foodPrice: "130грн", drink: ["Cola","Fanta","Spirte"]),
                                                                                              Menu(foodName: "Strips", foodPrice: "90грн", drink: ["Cola","Fanta","Spirte"]) ]),
                            
                                          Restaurant(name: "BurgerKing", check: "300 грн", type: "Fastfood", deliveryTime: "15 мин", folowers: "400 followers", image: "burgerKing", menu: [Menu(foodName: "Bureger", foodPrice: "110грн", drink: ["Cola","Fanta","Spirte"]),
                                                                                                     Menu(foodName: "BurgerXXL", foodPrice: "160грн", drink: ["Cola","Fanta","Spirte"])]),]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension RestaurantViewController: UITableViewDelegate{}

extension RestaurantViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CastomTableViewCell else {return UITableViewCell()}
        
        let rest = restaurantsArray[indexPath.row]
        
        cell.configure(rest: rest)
        cell.logoImage?.layer.cornerRadius = 30.0
        cell.logoImage?.clipsToBounds = true

        

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let goToDetail = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        goToDetail.restourants = restaurantsArray[indexPath.row]
        navigationController?.pushViewController(goToDetail, animated: true)
    }
    
}
