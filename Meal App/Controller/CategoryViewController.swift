//
//  CategoryViewController.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/14/21.
//

import UIKit

class CategoryViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel = CategoryViewModel()
    var category_text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.category.text = category_text
        
        loadMealTypesData()
    }
    
    func loadMealTypesData() {
        viewModel.getMealsForCategoryData(category: category_text) { 
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.searchBar.delegate = self
            
            self.tableView.reloadData()
        }
    }
    
    //MARK: Search Bar Config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchForText(text: searchText)
        self.tableView.reloadData()
    }
}
// MARK: Table View Delegate
extension CategoryViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as?
            RecipeViewController {
            vc.id_text = viewModel.cellForRowAt(indexPath: indexPath).id ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
// MARK: Table View DataSource
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
