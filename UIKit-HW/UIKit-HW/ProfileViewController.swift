//
//  ProfileViewController.swift
//  UIKit-HW
//
//  Created by Daniil on 27.09.2022.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let profilePhotoImageView = UIImageView()
    let changeProfilePhotoButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Add ImageView for profile photo
        profilePhotoImageView.frame = CGRect(x: 130, y: 80, width: 130, height: 130)
        profilePhotoImageView.backgroundColor = .white
        profilePhotoImageView.layer.cornerRadius = 50
        view.addSubview(profilePhotoImageView)
        // MARK: - Button to change PP
        changeProfilePhotoButton.frame = CGRect(x: 75, y: 230, width: 250, height: 20)
        changeProfilePhotoButton.setTitle("Изменить фото профиля", for: .normal)
        changeProfilePhotoButton.addTarget(self, action: #selector(selectProfilePhoto), for: .touchUpInside)
        view.addSubview(changeProfilePhotoButton)
    }
    // MARK: - Methods to change PP
    @objc func selectProfilePhoto() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profilePhotoImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
}
