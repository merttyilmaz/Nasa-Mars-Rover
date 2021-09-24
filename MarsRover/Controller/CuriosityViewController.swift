//
//  CuriosityViewController.swift
//  MarsRover
//
//  Created by Mert Yılmaz on 19.09.2021.
//

import UIKit
import Alamofire

class CuriosityViewController: UIViewController {
    
    // MARK: Storyboard Variables
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    private var photos = [Photos]()
    private var initialPhotos = [Photos]()
    private var searchFlag = true
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIVariables()
        fetchData() 
    }
    // MARK: Functions
    private func setUIVariables()  {
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: "PhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotosCollectionViewCell")
    }
    
    private func fetchData() {
        var count = 1
        let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=rmP0hLeNFBj9YHOSHrwhMhiltltjdDZDgolcA1Bf&page=\(count)"
        API.shared.fetchData(url: url) { data in
            if let data = data {
                self.photos = self.photos + data.photos
                self.initialPhotos = self.photos
                self.collectionView.reloadData()
                count += 1
            }
        }
    }
    
}

extension CuriosityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            searchFlag = true
            photos = initialPhotos
        } else {
            searchFlag = false
            var filteredPhotos = [Photos]()
            for photo in initialPhotos {
                if photo.camera.full_name.lowercased().contains(searchText.lowercased()) {
                    filteredPhotos.append(photo)
                }
            }
 
            photos = filteredPhotos
        }
        
        self.collectionView.reloadData()
    }
    
}

extension CuriosityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell {
            let data = photos[indexPath.row]
            cell.setPhoto(url: data.img_src)
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row ==  (photos.count - 2), searchFlag {
            self.fetchData()
        }
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       if let vc = storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController {
           vc.data = photos[indexPath.row]
    
           present(vc, animated: true, completion: nil)
       }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 30, height: 400)
    }
    
}
