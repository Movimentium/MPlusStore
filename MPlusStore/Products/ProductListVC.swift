//
//  ProductListVC.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class ProductListVC: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableProducts: UITableView!
    
    private var idProductCell = "idProductCell"
    
    var products: [Product] = [] {
        didSet {
            tableProducts.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableProducts.dataSource = self
        tableProducts.delegate = self
        loadProducts()
    }
    

    private func loadProducts() {
        products = fakeProducts()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idProductCell, for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.descr
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductVC", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productVC = segue.destination as? ProductVC,
            let idx = tableProducts.indexPathForSelectedRow?.row else {
            return }
        productVC.product = products[idx]
    }

}
