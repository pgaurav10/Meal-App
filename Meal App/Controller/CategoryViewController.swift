//
//  CategoryViewController.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/14/21.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var category: UILabel!
    var category_text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        category.text = category_text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
