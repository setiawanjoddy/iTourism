//
//  ProfileViewController.swift
//  iTourism
//
//  Created by Setiawan Joddy on 19/07/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    
    @IBOutlet weak var dicodingButton: UIButton!
    @IBOutlet weak var githubButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSetup()

    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dicodingButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://www.dicoding.com/users/setiawanjoddy") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func githubButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://github.com/setiawanjoddy") {
            UIApplication.shared.open(url)
        }
    }
    
    func overlaySetup() {
        overlayView.layer.cornerRadius = overlayView.frame.height / 2
        overlayView.layer.shadowOffset = .zero
        overlayView.layer.shadowColor = UIColor.black.cgColor
        overlayView.layer.shadowRadius = 10
        overlayView.layer.shadowOpacity = 0.25
    }
    
    func screenSetup() {
        overlaySetup()
        socialButtonSetup()
        
        profileNameLabel.text = "Setiawan Joddy"
        profileEmailLabel.text = "setiawanjoddy.id@gmail.com"
        backgroundImageView.image = UIImage(named: "background")
        profileImageView.image = UIImage(named: "setiawanjoddy")
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
    }
    
    func socialButtonSetup() {
        githubButton.layer.cornerRadius = 10
        dicodingButton.layer.cornerRadius = 10
    }

}
