//
//  ViewController.swift
//  SSRNetwork
//
//  Created by wonderland.don@gmail.com on 01/15/2020.
//  Copyright (c) 2020 wonderland.don@gmail.com. All rights reserved.
//

import UIKit
import SSRNetwork
import Kingfisher

class ViewController: UIViewController {

    let url = "https://api.github.com/users/mistdon/following"
    
    var followers = [GithubFollower]()

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SSRNetwork"
        //Create UI
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    
        let reloadItem =  UIBarButtonItem(title: "Reload", style: .done, target: self, action: #selector(reloadData))
        self.navigationItem.rightBarButtonItem = reloadItem
        
        reloadData()
        
        // Custom timeoutInterval
        SSRNetwork.shared.requestOrigin(url: "https://api.github.com/search/repositories?q=SSR", method: .get, parameters: nil, headers: nil, timeoutInterval: 10
            ,success: { (response, dataResponse) in
            print(response.message)
        }) { (eror) in
            print(eror?.localizedDescription)
        }
    }
    @objc func reloadData(){
        GithubFollower.getMyFollowings { [weak self] (follower) in
            self?.followers = follower
            self?.tableView.reloadData()
        }
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")! 
        let follower = followers[indexPath.row]
        cell.imageView?.kf.setImage(with: URL(string: follower.avatar_url!))
        cell.textLabel?.text = follower.login
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.followers.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let follower = self.followers[indexPath.row]
        let alertVC = UIAlertController(title: follower.login, message:"Hello, \(String(describing: follower.login))", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
