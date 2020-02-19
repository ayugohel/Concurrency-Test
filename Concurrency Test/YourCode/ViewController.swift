//
//  ViewController.swift
//  ConcurrencyTest
//


import UIKit

class ViewController: UIViewController {

    let label = UILabel(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        
        label.text = "loading"
        
                // requirement 4
        DispatchQueue.main.async {
            loadMessage { combinedMessage in
                self.label.text = combinedMessage
            }
        }
    }
}

extension ViewController {
    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
