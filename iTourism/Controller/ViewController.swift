//
//  ViewController.swift
//  iTourism
//
//  Created by Setiawan Joddy on 18/07/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var tourismTableView: UITableView!
    
    let parser = NetworkHelper()
    var tourismPlace = [Place]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "iTourism"
        
        loadData()
        profileButtonSetup()
        
        tourismTableView.delegate = self
        tourismTableView.dataSource = self
        tourismTableView.register(UINib(nibName: "TourismTableViewCell", bundle: nil), forCellReuseIdentifier: "TourismCell")
    }
    
    func loadData() {
        parser.parse { data in
            self.tourismPlace = data
            self.tourismTableView.reloadData()
        }
    }
    
    func profileButtonSetup() {
        let containView = UIControl(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        imageView.image = UIImage(named: "setiawanjoddy")
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.masksToBounds = true
        containView.addSubview(imageView)
        containView.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
        let rightBarButton = UIBarButtonItem(customView: containView)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    @objc func profileButtonPressed() {
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tourismPlace.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TourismCell", for: indexPath) as? TourismTableViewCell {
            cell.placeNameLabel.text = tourismPlace[indexPath.row].name
            cell.placeDescriptionLabel.text = tourismPlace[indexPath.row].description
            cell.placeImageView.sd_setImage(with: URL(string: tourismPlace[indexPath.row].image), placeholderImage: UIImage(named: "placeholder"))
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detail.tourismPlace = tourismPlace[indexPath.row]
        
        self.navigationController?.pushViewController(detail, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
