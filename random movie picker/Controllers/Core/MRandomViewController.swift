//
//  MRandomViewController.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 12.03.2023.
//

import UIKit

final class MRandomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Random"
        navigationItem.largeTitleDisplayMode = .automatic
        
        // print(MRequest.listTopRatedRequest.url)
        
        MService.shared.execute(.listTopRatedRequest, expecting: MTopRated.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
