//
//  CategoryTableViewCell.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/14/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var desc: UILabel!
    var url = ""
    
    //MARK: Set Cell Values
    func setCellWithValuesOf(meal: Meal) {
        updateUI(imgSrc: meal.thumb, description: meal.str)
    }
    
    //MARK: Update UI
    private func updateUI(imgSrc: String?, description: String?) {
        
        self.desc.text = description
        
        url = imgSrc!
        
        guard let image = URL(string: url) else {
            self.thumbNail.image = UIImage(named: "No image availabe")
            return
        }
        
        //Clear old image
        self.thumbNail.image = nil
        
        getImageDataFrom(url: image)
    }
    
    //MARK: Get Image
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //Handle error
            if let error = error {
                print("Data Task Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                //Handle empty data
                print("Empty data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.thumbNail.image = image
                }
            }
        }.resume()
    }
}
