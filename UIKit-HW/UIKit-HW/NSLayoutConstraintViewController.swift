//
//  NSLayoutConstraintViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 16.10.2022.
//

import UIKit

// Светофор на NSLayoutConstraint
final class NSLayoutConstraintViewController: UIViewController {
    
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
        NSLayoutConstraint(item: blackView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 45).isActive = true
        NSLayoutConstraint(item: blackView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -55).isActive = true
        NSLayoutConstraint(item: blackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: blackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
    }
    
    private func createRedViewConstraints() {
        NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: blackView, attribute: .width, multiplier: 0.85, constant: 0).isActive = true
        NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: blackView, attribute: .height, multiplier: 0.25, constant: 0).isActive = true
        NSLayoutConstraint(item: redView, attribute: .trailing, relatedBy: .equal, toItem: blackView, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: blackView, attribute: .leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 80).isActive = true
    }
    
    private func createYellowViewConstraints() {
        NSLayoutConstraint(item: yellowView, attribute: .trailing, relatedBy: .equal, toItem: blackView, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: yellowView, attribute: .leading, relatedBy: .equal, toItem: blackView, attribute: .leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: yellowView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView, attribute: .height, relatedBy: .equal, toItem: blackView, attribute: .height, multiplier: 0.25, constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView, attribute: .width, relatedBy: .equal, toItem: blackView, attribute: .width, multiplier: 0.85, constant: 0).isActive = true
    }
    
    private func createGreenViewConstraints() {
        NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: blackView, attribute: .trailing, multiplier: 1, constant: -15).isActive = true
        NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: blackView, attribute: .leading, multiplier: 1, constant: 15).isActive = true
        NSLayoutConstraint(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: blackView, attribute: .bottom, multiplier: 1, constant: -25).isActive = true
        NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: yellowView, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: blackView, attribute: .width, multiplier: 0.85, constant: 0).isActive = true
        NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: blackView, attribute: .height, multiplier: 0.25, constant: 0).isActive = true
    }
}
