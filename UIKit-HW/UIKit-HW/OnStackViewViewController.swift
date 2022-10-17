//
//  OnStackViewViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 17.10.2022.
//

import UIKit

// Светофор на StackView
final class OnStackViewViewController: UIViewController {
    
    // MARK: - Visual components
    private var traficLightStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.backgroundColor = .black
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var blackView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .black
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private var redView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .red
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private var yellowView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .yellow
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private var greenView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .green
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        configStackView()
        createStackViewConstraints()
    }
    
    private func configStackView() {
        view.addSubview(traficLightStackView)
        traficLightStackView.addArrangedSubview(redView)
        traficLightStackView.addArrangedSubview(yellowView)
        traficLightStackView.addArrangedSubview(greenView)
    }
    
    private func createStackViewConstraints() {
        traficLightStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        traficLightStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        traficLightStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        traficLightStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
