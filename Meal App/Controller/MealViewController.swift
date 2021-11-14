//
//  ViewController.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/10/21.
//

import UIKit

class MealViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        loadMealData()
    }

    private func loadMealData() {
        viewModel.getFoodCategoriesData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.delegate = self
            
            self?.tableView.reloadData()
        }
    }

}
extension MealViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 140.0
    }
}

extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MealTableViewCell
        
        let type = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(category: type)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    
}
