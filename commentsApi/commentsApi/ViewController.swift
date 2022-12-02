//
//  ViewController.swift
//  commentsApi
//
//  Created by Mac on 01/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var commentsArray: [Comments] = []

    @IBOutlet weak var commentsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseComments()
    }
    
    func parseComments() {
        let str = "https://jsonplaceholder.typicode.com/comments"
        let url = URL(string: str)
        
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                    self.commentsArray =  try JSONDecoder().decode([Comments].self, from: data!)
                    DispatchQueue.main.async {
                        self.commentsTable.reloadData()
                    }
                } catch {
                    print("Something went wrong!")
                }
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CommentsTableViewCell
        let comments = commentsArray[indexPath.row]
        cell.postIdLabel.text = "PostId : \(comments.postId)"
        cell.idLael.text = "Id : \(comments.id)"
        cell.nameLabel.text = "Name : \(comments.name)"
        cell.emailLabel.text = "Email : \(comments.email)"
        cell.bodyLabel.text = "Body : \(comments.body)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 267.0
    }
    
    
}

