//
//  ViewController.swift
//  ShoppingAssistant
//
//  Created by Shobhit on 14/08/18.
//  Copyright © 2018 Shobhit. All rights reserved.
//

import UIKit
import AVKit
import Photos
import CoreML
import Vision

enum AttachmentType: String{
    case camera, video, photoLibrary
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let mlModel = AppleDevice()
//    let mlModle = RiceSoupClassifier()
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius = 5
        searchButton.layer.borderColor = UIColor.black.cgColor
        searchButton.layer.borderWidth = 1
        
        imageView.layer.cornerRadius = 5
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 1.0
        imageView.clipsToBounds = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getProductDataButtonTapped(_ sender: Any) {
//
//        let prodListVC = storyboard?.instantiateViewController(withIdentifier: "ProductsListViewControllerId") as! ProductsListViewController
//
//        navigationController?.show(prodListVC, sender: self)
        showAttachmentActionSheet()
    }
    
    func showAttachmentActionSheet() {
        let actionSheet = UIAlertController(title: "Choose media type", message: "This will be used to identify the image", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .camera)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .photoLibrary)
        }))
        
        //        actionSheet.addAction(UIAlertAction(title: Constants.video, style: .default, handler: { (action) -> Void in
        //            self.authorisationStatus(attachmentTypeEnum: .video, vc: self.currentVC!)
        //
        //        }))
        
        //        actionSheet.addAction(UIAlertAction(title: Constants.file, style: .default, handler: { (action) -> Void in
        //            self.documentPicker()
        //        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    func authorisationStatus(attachmentTypeEnum: AttachmentType){
        
        if attachmentTypeEnum ==  AttachmentType.camera{
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            switch status{
            case .authorized: // The user has previously granted access to the camera.
                openCamera()
                
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.openCamera()
                    }
                }
                //denied - The user has previously denied access.
                //restricted - The user can't grant access due to restrictions.
                //        case .denied, .restricted:
                //            addAlertForSettings(attachmentTypeEnum)
                return
                
            default:
                break
            }
        }
            
        else if attachmentTypeEnum == AttachmentType.photoLibrary {
            let status = PHPhotoLibrary.authorizationStatus()
            switch status{
            case .authorized:
                if attachmentTypeEnum == AttachmentType.photoLibrary{
                    photoLibrary()
                }
                
//                            if attachmentTypeEnum == AttachmentType.video{
//                                videoLibrary()
//                            }

                        case .notDetermined:
                            PHPhotoLibrary.requestAuthorization({ (status) in
                                if status == PHAuthorizationStatus.authorized{
                                    // photo library access given
                                    self.photoLibrary()
                                }
                                
                        })
            default:
                break
            }
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            present(myPickerController, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            descriptionLabel.isHidden = false
            descriptionLabel.text = "Thinking"
            
            // Set the image view
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            
            // Get the model
            guard let model = try? VNCoreMLModel(for: AppleDevice().model) else {
                fatalError("Unable to load model")
            }
            
            // Create vision request
            let request = VNCoreMLRequest(model: model) {[weak self] request, error in
                guard let results = request.results as? [VNClassificationObservation],
                    let topResult = results.first
                    else {
                        fatalError("Unexpected results")
                }
                
                // Update the main UI thread with our result
                DispatchQueue.main.async {[weak self] in
                    self?.showAlertForProductFound(result: topResult.identifier, confidence: Int(topResult.confidence * 100))
//                    self?.descriptionLabel.text = "\(topResult.identifier) with \(Int(topResult.confidence * 100))% confidence"
                    self?.descriptionLabel.text = "\(topResult.identifier)"
                }
            }
            
            guard let ciImage = CIImage(image: pickedImage)
                else { fatalError("Cannot read picked image")}
            
            // Run the classifier
            let handler = VNImageRequestHandler(ciImage: ciImage)
            DispatchQueue.global().async {
                do {
                    try handler.perform([request])
                } catch {
                    print(error)
                }
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func showAlertForProductFound(result: String, confidence: Int) {
        // create the alert
        let alert = UIAlertController(title: result, message: "Is it the product you are searching for?", preferredStyle: .alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Yes, Proceed", style: .default, handler: {(action:UIAlertAction!) in
            self.getProdDetails(prodName: result)
        }))
        
        alert.addAction(UIAlertAction(title: "No, Rescan", style: .cancel, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func getProdDetails(prodName: String) {
        let prodListVC = storyboard?.instantiateViewController(withIdentifier: "ProductsListViewControllerId") as! ProductsListViewController
        prodListVC.prodName = prodName
        navigationController?.show(prodListVC, sender: self)
    }
}

