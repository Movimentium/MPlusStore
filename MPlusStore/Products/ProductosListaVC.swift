//
//  ProductosListaVC.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class ProductosListaVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {


    @IBOutlet weak var tablaProductos: UITableView!
    
    private var idCeldaProducto = "idCeldaProducto"
    
    var productos: [Producto] = [] {
        didSet {
            tablaProductos.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablaProductos.dataSource = self
        tablaProductos.delegate = self
        cargarProductos()
    }
    
    // Chapuza del instructor
    let sesion: URLSession = .shared
    
    private func cargarProductos() {
        productos = fakeProducts()
//        let url = URL(string: "https://hplussport.com/api/products")!
//        let task = sesion.dataTask(with: url) { (data:Data?, response:URLResponse?, error:Error?) in
//            print("Datos recibidos: \(String(describing: data))")
//        }
//        task.resume()
        
    }
    
    
    
    // MARK: - UITableViewDataSource & UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: idCeldaProducto, for: indexPath)
        let product = productos[indexPath.row]
        celda.textLabel?.text = product.nombre
        celda.detailTextLabel?.text = product.descr
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductoVC", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let productVC = segue.destination as? ProductoVC,
            let idx = tablaProductos.indexPathForSelectedRow?.row
        else {
            return
        }
        productVC.producto = productos[idx]
    }
    
    // MARK: - UINavigationBarDelegate

    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
