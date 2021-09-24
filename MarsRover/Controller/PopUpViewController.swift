//
//  PopUpViewController.swift
//  MarsRover
//
//  Created by Mert Yılmaz on 22.09.2021.
//

import UIKit

class PopUpViewController: UIViewController {
    
    // MARK: Storyboard Variables
    @IBOutlet weak private var popUpImage: UIImageView!
    @IBOutlet weak private var photoTaken: UILabel!
    @IBOutlet weak private var roverName: UILabel!
    @IBOutlet weak private var cameraName: UILabel!
    @IBOutlet weak private var roverStatus: UILabel!
    @IBOutlet weak private var launchDate: UILabel!
    @IBOutlet weak private var landingDate: UILabel!
    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var continueButton: UIButton!
    
    var data: Photos?

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setVariables()
    }
    
    // MARK: Functions
    private func setupUI() {
        containerView.layer.cornerRadius = 6
        continueButton.layer.cornerRadius = 6
    }
    
    private func setVariables() {
        if let data = self.data {
            popUpImage.setPicture(pictureUrl: data.img_src)
            photoTaken.text = "This image was taken on \(data.earth_date)"
            roverName.text = "This rovers name is \(data.rover.name)"
            cameraName.text = "This cameras' name is \(data.camera.full_name)"
            roverStatus.text = "This rovers status is \(data.rover.status)"
            launchDate.text = "This rovers launch date is \(data.rover.launch_date)"
            landingDate.text = "This rovers landing date  is \(data.rover.landing_date)"
        }
    }
    
    @IBAction func dismissPopup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
