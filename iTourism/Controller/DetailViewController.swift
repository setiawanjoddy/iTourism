//
//  DetailViewController.swift
//  iTourism
//
//  Created by Setiawan Joddy on 18/07/21.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailPlaceMapView: MKMapView!
    @IBOutlet weak var detailPlaceImageView: UIImageView!
    @IBOutlet weak var detailPlaceNameLabel: UILabel!
    @IBOutlet weak var detailPlaceAddressLabel: UILabel!
    @IBOutlet weak var detailPlaceDescriptionLabel: UILabel!
    @IBOutlet weak var overlayView: UIView!
    
    var tourismPlace: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        detailPlaceImageView.layer.cornerRadius = detailPlaceImageView.frame.height / 2
        overlaySetup()
        
        if let result = tourismPlace {
            detailPlaceNameLabel.text = result.name
            detailPlaceAddressLabel.text = "📍 \(result.address)"
            detailPlaceDescriptionLabel.text = result.description
            detailPlaceImageView.sd_setImage(with: URL(string: result.image), placeholderImage: UIImage(named: "placeholder2"))
            
            let latitude = result.latitude
            let longitude = result.longitude
            
            let region = MKCoordinateRegion.init(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = result.name
            
            detailPlaceMapView.setRegion(region, animated: true)
            detailPlaceMapView.addAnnotation(annotation)
        }

    }

    func overlaySetup() {
        overlayView.layer.cornerRadius = overlayView.frame.height / 2
        overlayView.layer.shadowOffset = .zero
        overlayView.layer.shadowColor = UIColor.black.cgColor
        overlayView.layer.shadowRadius = 10
        overlayView.layer.shadowOpacity = 0.25
    }

}
