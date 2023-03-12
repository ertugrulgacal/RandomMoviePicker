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
        let request = MRequest(endpoint: .movie, pathComponents: ["top_rated"], queryParameters: [URLQueryItem(name: "api_key", value: "00000000000000000")])
        print(request.url)
    }
}
