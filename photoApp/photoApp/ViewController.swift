//
//  ViewController.swift
//  photoApp
//
//  Created by GWC on 6/21/18.
//  Copyright © 2018 GWC. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePickerController: UIImagePickerController!
    
    @IBAction func filterButton(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let image = CIImage(image: imageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale),
                               orientation: .right)
        imageView.image = newImage
    }
    @IBAction func halftoneFilter(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CICMYKHalftone")!
        let image = CIImage(image: imageView.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(25, forKey: kCIInputWidthKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale),
                               orientation: .right)
        imageView.image = newImage
        
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePickerController = UIImagePickerController() //  Handle the text  field´s user input through delegate callbacks
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
         // Dismiss the picker if the user canceled
        imagePickerController.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    //SAVE PHOTO STUFF
    @IBAction func savePhoto(_ sender: Any) {
        saveImage(imageName: "test.jpg")
    }
    func saveImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
        true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = imageView.image!
        let imageData = UIImagePNGRepresentation(image)
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    }
    
    

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

