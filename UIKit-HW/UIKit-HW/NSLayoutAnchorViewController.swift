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
        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        createBlackViewConstraints()
        createRedViewConstraints()
        createYellowViewConstraints()
        createGreenViewConstraints()
    }
    
    private func createBlackViewConstraints() {
        
    }
    
    private func createRedViewConstraints() {
        
    }
    
    private func createYellowViewConstraints() {
        
    }
    
    private func createGreenViewConstraints() {
        
    }
}
