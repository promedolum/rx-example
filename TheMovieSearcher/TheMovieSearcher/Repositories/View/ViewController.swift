//
//  ViewController.swift
//  TheMovieSearcher
//
//  Created by Алешин Игорь Эдуардович on 05.09.2020.
//  Copyright © 2020 Алешин Игорь Эдуардович. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MovieSearchViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.keyboardDismissMode = .onDrag
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBindings()
    }
    
    private func setupBindings() {
        let searchQuery = searchBar.rx
            .text
            .changed
            .debounce(RxTimeInterval.seconds(3), scheduler: MainScheduler.asyncInstance)
        
        let input = MovieSearchViewModelInput(searchQuery: searchQuery)
        
        let output = viewModel.bind(input: input)
        output.searchResult.drive( tableView.rx.items(cellIdentifier: "cell")) { (_, model, cell) in
            cell.textLabel?.text = model.title
        }
        .disposed(by: disposeBag)
        
    }
}
