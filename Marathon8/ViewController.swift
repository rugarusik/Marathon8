//
//  ViewController.swift
//  Marathon8
//
//  Created by Alina Golubeva on 22/05/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let avatarImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        title = "Avatar"
        
        avatarImageView.tintColor = .lightGray
        
        view.addSubview(scrollView)
        scrollView.contentSize.height = view.frame.height
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
        
        if let navigationBar = navigationController?.navigationBar {
            for subview in navigationBar.subviews {
                guard NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") else { continue }
                
                subview.addSubview(avatarImageView)
                
                NSLayoutConstraint.activate([
                    avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: -12),
                    avatarImageView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -16),
                    avatarImageView.widthAnchor.constraint(equalToConstant: 36),
                    avatarImageView.heightAnchor.constraint(equalToConstant: 36),
                ])
            }
        }
    }
}
