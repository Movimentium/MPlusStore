//
//  PostListVC.swift
//  MPlusStore
//
//  Created by Miguel on 17/12/2020.
//  Copyright © 2020 Miguel Gallego Martín. All rights reserved.
//

import UIKit

class PostListVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {


    @IBOutlet weak var postTable: UITableView!
    private var idPostCell = "idPostCell"
    private var refreshCtrl: UIRefreshControl?
    
    fileprivate var posts: [Post] = [] {
        didSet {
            postTable.reloadData()
            refreshCtrl?.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshCtrl = UIRefreshControl()
        refreshCtrl?.addTarget(self, action: #selector(loadPosts), for: .valueChanged)
        postTable.refreshControl = refreshCtrl
    }
    
    @objc dynamic private func loadPosts() {
        posts = fakePosts()
    }
 
    // MARK: - UITableViewDataSource & UITableViewDelegate

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: idPostCell, for: indexPath)
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPostVC", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let postVC = segue.destination as? PostVC,
            let idx = postTable.indexPathForSelectedRow?.row
        else {
            return
        }
        postVC.post = posts[idx]
    }
    
    // MARK: - UINavigationBarDelegate
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

}
