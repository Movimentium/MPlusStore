//
//  ProductVC.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescr: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if product == nil {
            return
        }
        navBar.topItem?.title = product.name
        lblName.text = product.name
        lblDescr.text = product.descr
    }

    
    // MARK: - IBActions
    
    @IBAction func onBtnClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
 

}
