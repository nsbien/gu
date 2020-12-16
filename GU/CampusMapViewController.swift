//
//  CampusMapViewController.swift
//  GU
//
//  Created by Kyle Pavey on 12/1/20.
//

import UIKit

class CampusMapViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet var pinchGesture: UIPinchGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pinchGestureAction(_ sender: Any) {
        guard let gesture = pinchGesture.view else {
            return
        }
        gesture.transform = gesture.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
    }
    @IBAction func panGestureAction(_ sender: Any) {
        let translation = panGesture.translation(in: view)
          guard let gestureView = panGesture.view else {
            return
          }

          gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
          )
          panGesture.setTranslation(.zero, in: view)
    }
    
}
