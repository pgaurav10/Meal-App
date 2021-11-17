//
//  RecipeViewController.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/15/21.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var video: UILabel!
    @IBOutlet weak var link: UITextView!
    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var quantity: UITextView!
    @IBOutlet weak var recipe_label: UILabel!
    
    var viewModel = RecipeViewModel()
    var id_text = ""
    var recipe: Recipe?
    var url: String?
    var str: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instructions.isEditable = false
        link.isEditable = false
        quantity.isEditable = false
        
        self.video.text = "Video: "
        self.recipe_label.text = "Recipe: "
        print(self.id_text)
        loadRecipeDetail()
        
    }
    
    func loadRecipeDetail() {
        viewModel.getRecipeFromMealData(id: id_text) { [weak self] in
            self?.recipe = self?.viewModel.getRecipe()
            self?.loadPageData()
        }
    }
    
    func loadPageData() {
        self.name.text = recipe?.str
        self.instructions.text = recipe?.instructions
        self.link.text = recipe?.youtube
        
        
        if(recipe?.inr1 != "") {
            str = "Ingredients: \((recipe?.inr1)!)\nQuantity: \((recipe?.msr1)!)\n\n"
        }
        
        if(recipe?.inr2 != "") {
            str?.append( "Ingredients: \((recipe?.inr2)!)\nQuantity: \((recipe?.msr2)!)\n\n")
        }
        
        if(recipe?.inr3 != "") {
            str?.append( "Ingredients: \((recipe?.inr3)!)\nQuantity: \((recipe?.msr3)!)\n\n")
        }
        
        if(recipe?.inr4 != "") {
            str?.append( "Ingredients: \((recipe?.inr4)!)\nQuantity: \((recipe?.msr4)!)\n\n")
        }
        
        if(recipe?.inr5 != "") {
            str?.append( "Ingredients: \((recipe?.inr5)!)\nQuantity: \((recipe?.msr5)!)\n\n")
        }
        
        if(recipe?.inr6 != "") {
            str?.append( "Ingredients: \((recipe?.inr6)!)\nQuantity: \((recipe?.msr6)!)\n\n")
        }
        
        if(recipe?.inr7 != "") {
            str?.append( "Ingredients: \((recipe?.inr7)!)\nQuantity: \((recipe?.msr7)!)\n\n")
        }
        
        if(recipe?.inr8 != "") {
            str?.append( "Ingredients: \((recipe?.inr8)!)\nQuantity: \((recipe?.msr8)!)\n\n")
        }
        
        if(recipe?.inr9 != "") {
            str?.append( "Ingredients: \((recipe?.inr9)!)\nQuantity: \((recipe?.msr9)!)\n\n")
        }
        
        if(recipe?.inr10 != "") {
            str?.append( "Ingredients: \((recipe?.inr10)!)\nQuantity: \((recipe?.msr10)!)\n\n")
        }
        
        if(recipe?.inr11 != "") {
            str?.append( "Ingredients: \((recipe?.inr11)!)\nQuantity: \((recipe?.msr11)!)\n\n")
        }
        
        //if(recipe?.inr12 != "") {
          //  str?.append( "Ingredients: \((recipe?.inr12)!)\t Measure: \((recipe?.msr12)!)\n\n")
        //}
        
        if(recipe?.inr13 != "") {
            str?.append( "Ingredients: \((recipe?.inr13)!)\nQuantity: \((recipe?.msr13)!)\n\n")
        }
        
        if(recipe?.inr14 != "") {
            str?.append( "Ingredients: \((recipe?.inr14)!)\nQuantity: \((recipe?.msr14)!)\n\n")
        }
        
        if(recipe?.inr15 != "") {
            str?.append( "Ingredients: \((recipe?.inr15)!)\nQuantity: \((recipe?.msr15)!)\n\n")
        }
        
        if(recipe?.inr16 != "") {
            str?.append( "Ingredients: \((recipe?.inr16)!)\nQuantity: \((recipe?.msr16)!)\n\n")
        }
        
        if(recipe?.inr17 != "") {
            str?.append( "Ingredients: \((recipe?.inr17)!)\nQuantity: \((recipe?.msr17)!)\n\n")
        }
        
        if(recipe?.inr18 != "") {
            str?.append( "Ingredients: \((recipe?.inr18)!)\nQuantity: \((recipe?.msr18)!)\n\n")
        }
        
        if(recipe?.inr19 != "") {
            str?.append( "Ingredients: \((recipe?.inr19)!)\nQuantity: \((recipe?.msr19)!)\n\n")
        }
        
        if(recipe?.inr20 != "") {
            str?.append( "Ingredients: \((recipe?.inr20)!)\nQuantity: \((recipe?.msr20)!)\n\n")
        }
        
        self.quantity.text = str
        
        url = recipe?.thumb
        
        
        guard let image = URL(string: url ?? "nil") else {
            self.thumbNail.image = UIImage(named: "No image availabe")
            return
        }
        
        //Clear old image
        self.thumbNail.image = nil
        
        getImageDataFrom(url: image)
        
        
    }
    
    //Get Image
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
