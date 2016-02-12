//
//  ScreenshotViewController.swift
//  TestScreenshot
//
//  Created by Nikolay Buryak on 2/12/16.
//  Copyright © 2016 Nikolay Buryak. All rights reserved.
//

import UIKit
import MapKit

class ScreenshotViewController: UIViewController {

    @IBOutlet private var mapView: MKMapView!
    @IBOutlet private var imageView: UIImageView!

    @IBAction func makeScreenshot() {
        let options = MKMapSnapshotOptions()
        options.region = mapView.region
        options.scale = UIScreen.mainScreen().scale
        options.size = mapView.frame.size

        let snapShotter = MKMapSnapshotter(options: options)

        snapShotter.startWithCompletionHandler { (snapshot: MKMapSnapshot?, error: NSError?) -> Void in
            let image = snapshot?.image
            self.imageView.image = image
        }
    }
}