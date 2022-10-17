//
//  NSLayoutAnchorViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 16.10.2022.
//

import UIKit

// Светофор на NSLayoutAnchor
final class NSLayoutAnchorViewController: UIViewController {

    private var blackView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .black
        return uiView
    }()
    
    private var redView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .red
        return uiView
    }()
    
    private var yellowView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .yellow
        return uiView
    }()
    
    private var greenView: UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.backgroundColor = .green
        return uiView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Private methods
    private func configUI() {
        addSubviews()
        createBlackViewConstraints()
        createRedViewConstraints()
        createYellowViewConstraints()
        createGreenViewConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
    }
    
    private func createBlackViewConstraints() {
        blackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        blackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55).isActive = true
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func createRedViewConstraints() {
        redView.widthAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 0.85).isActive = true
        redView.heightAnchor.constraint(equalTo: blackView.heightAnchor, multiplier: 0.25).isActive = true
        redView.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -15).isActive = true
        redView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 15).isActive = true
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
    }
    
    private func createYellowViewConstraints() {
        yellowView.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -15).isActive = true
        yellowView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 15).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true //pomeniay view na blackiew
        yellowView.heightAnchor.constraint(equalTo: blackView.heightAnchor, multiplier: 0.25).isActive = true
        yellowView.widthAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 0.85).isActive = true
    }
    
    private func createGreenViewConstraints() {
        greenView.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -15).isActive = true
        greenView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: 15).isActive = true
        greenView.bottomAnchor.constraint(equalTo: blackView.bottomAnchor, constant: -25).isActive = true
        greenView.widthAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 0.85).isActive = true
        greenView.heightAnchor.constraint(equalTo: blackView.heightAnchor, multiplier: 0.25).isActive = true
    }
}
