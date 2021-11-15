//
//  CategoryViewController.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/14/21.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CategoryViewModel()
    var category_text = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadMealTypesData()
    }
    
    func loadMealTypesData() {
        viewModel.getMealsForCategoryData(category: category_text) { 
            self.tableView.dataSource = self
            self.tableView.delegate = self
            
            self.tableView.reloadData()
        }
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140.0
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellc", for: indexPath) as! CategoryTableViewCell
        
        let type = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(meal: type)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    
}
