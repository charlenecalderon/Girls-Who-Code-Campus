//
//  GalleryViewController.swift
//  photoApp
//
//  Created by GWC on 6/21/18.
//  Copyright © 2018 GWC. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var galleryView: UIImageView!
    
    
    func getImage(imageName: String){
        print("get Image function called")
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
            true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            galleryView.image = UIImage(contentsOfFile: imagePath)
        } else {
            print("Oh no! No Image!")
        }
        galleryView.image = UIImage(contentsOfFile: imagePath)
        let image = UIImage(contentsOfFile: imagePath)
        let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .right)
        galleryView.image = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!, orientation: .right)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "test.jpg")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
