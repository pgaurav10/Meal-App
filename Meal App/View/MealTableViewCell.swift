//
//  MealTableViewCell.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/12/21.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    private var url: String = ""
    
    //MARK: Set Cell Values
    func setCellWithValuesOf(category: Category) {
        updateUI(imgSrc: category.thumb, type: category.str, id: category.id, description: category.desc)
    }
    
    //MARK: Update UI
    private func updateUI(imgSrc: String?, type: String?, id: String?, description: String?) {
        
        self.id.text = id
        self.category.text = type
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
