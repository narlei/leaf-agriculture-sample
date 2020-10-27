//
//  OperationMapViewController.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//
//

import Foundation
import GoogleMaps
import UIKit

class OperationMapViewController: BaseViewController {
    // MARK: Properties

    @IBOutlet var collectionViewImages: UICollectionView!

    var presenter: OperationMapPresentation?
    var mapView: GMSMapView!
    var operationFile: OperationFile?
    var arrayImages: [OperationImage]? {
        didSet {
            collectionViewImages.reloadData()
            view?.bringSubviewToFront(collectionViewImages)
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 39.726580599966866, longitude: -89.83466863632202, zoom: 15.0)
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        view.addSubview(mapView)

        // Creates a marker in the center of the map.

        collectionViewImages.delegate = self
        collectionViewImages.dataSource = self

        presenter?.loadData()
    }

    private func addOverlay(geo: OperationFile, url: URL) {
        let southWest = CLLocationCoordinate2D(latitude: geo.getMinLatitude() ?? 0, longitude: geo.getMinLongitude() ?? 0)
        let northEast = CLLocationCoordinate2D(latitude: geo.getMaxLatitude() ?? 0, longitude: geo.getMaxLongitude() ?? 0)
        let overlayBounds = GMSCoordinateBounds(coordinate: southWest, coordinate: northEast)

        

        let bounds = GMSCoordinateBounds(coordinate: southWest, coordinate: southWest)
        mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 20.0))
        mapView.animate(toZoom: 15)

        DispatchQueue.main.async {
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            let overlay = GMSGroundOverlay(bounds: overlayBounds, icon: image)
            overlay.bearing = 0
            overlay.map = self.mapView
        }
    }
}

extension OperationMapViewController: OperationMapView {
    func load(images: [OperationImage]?) {
        arrayImages = images
    }

    func set(operationFile: OperationFile?) {
        self.operationFile = operationFile
    }
}

extension OperationMapViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let arrayImages = arrayImages else { return }
        if let strUrl = arrayImages[indexPath.row].url, let url = URL(string: strUrl), let operationFile = operationFile {
            addOverlay(geo: operationFile, url: url)
        }
    }
}

extension OperationMapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayImages?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OperationMapCell", for: indexPath) as! OperationMapCell

        guard let arrayImages = arrayImages else { return cell }

        cell.setup(image: arrayImages[indexPath.row])

        return cell
    }
}
