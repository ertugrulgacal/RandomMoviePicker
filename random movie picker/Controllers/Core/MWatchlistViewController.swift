//
//  MWatchlistViewController.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 12.03.2023.
//

import UIKit

final class MWatchlistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Watchlist"
        navigationItem.largeTitleDisplayMode = .automatic
        
        MService.shared.execute(.listTopRatedRequest, expecting: MTopRated.self) { result in
            switch result {
            case .success(let model):
                // print(String(describing: model))
                print(String(model.results[0].original_title + "\n" + model.results[0].poster_path))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
    }
    
    
}
