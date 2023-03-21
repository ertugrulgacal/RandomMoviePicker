//
//  MRandomViewController.swift
//  random movie picker
//
//  Created by Ertugrul GACAL on 12.03.2023.
//

import UIKit

final class MRandomViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Movie", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Random"
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 450)
        imageView.center = view.center
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        getRandomMovie()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    @objc func didTapButton() {
        
    }
    
    func getRandomMovie() {
        MService.shared.execute(.listTopRatedRequest, expecting: MTopRated.self) { result in
            switch result {
            case .success(let model):
                let posterURL = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2" + model.results[0].poster_path
                let url = URL(string: posterURL)!
                guard let data = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.sync {
                    self.imageView.image = UIImage(data: data)
                }
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
