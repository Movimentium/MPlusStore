//
//  ProductoVC.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class ProductoVC: UIViewController {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblDescr: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var btnComprar: UIButton!
    
    var producto: Producto!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if producto == nil {
            btnComprar.isEnabled = false
            return
        }
        navBar.topItem?.title = producto.nombre
        lblNombre.text = producto.nombre
        lblDescr.text = producto.descr
    }

    
    // MARK: - IBActions
    
    @IBAction func onBtnClose(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBtnBuyNow() {
        let msg = "\(producto.nombre) ha sido añadido a tu cesta"
        let alertVC = UIAlertController(title: "Cesta", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
        
    }
    
    
 

}
