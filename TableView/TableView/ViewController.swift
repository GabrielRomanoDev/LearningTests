//
//  ViewController.swift
//  TableView
//
//  Created by Gabriel Luz Romano on 11/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        // Do any additional setup after loading the view.
    }

    func configTableView(){
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(movieCellTableViewCell.nib(), forCellReuseIdentifier: movieCellTableViewCell.identifier)
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: movieCellTableViewCell.identifier, for: indexPath) as? movieCellTableViewCell
        cell?.setupCell(movies: movies[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}

extension ViewController:UITableViewDelegate{
    
}
