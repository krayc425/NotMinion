//
//  ViewController.swift
//  NotMinion
//
//  Created by 宋 奎熹 on 2017/6/12.
//  Copyright © 2017年 宋 奎熹. All rights reserved.
//

import UIKit

let color = UIColor(colorLiteralRed: 253.0/255.0, green: 224.0/255.0, blue: 122.0/255.0, alpha: 1.0)
let font = "PingFangSC-Regular"

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var checkButton: UIButton?
    @IBOutlet var selectButton: UIButton?
    
    var cameraPicker: UIImagePickerController?
    var photoPicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.titleLabel?.text = "Not Minion"
        self.titleLabel?.backgroundColor = color
        self.titleLabel?.textColor = UIColor.black
        self.titleLabel?.font = UIFont(name: font, size: 36.0)
        
        self.selectButton?.backgroundColor = color
        self.selectButton?.setTitle("Select an image", for: UIControlState.normal)
        self.selectButton?.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.selectButton?.titleLabel?.font = UIFont(name: font, size: 18.0)
        self.selectButton?.layer.cornerRadius = 5.0
        self.selectButton?.layer.masksToBounds = true
        
        self.checkButton?.backgroundColor = color
        self.checkButton?.setTitle("Check", for: UIControlState.normal)
        self.checkButton?.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.checkButton?.titleLabel?.font = UIFont(name: font, size: 18.0)
        self.checkButton?.layer.cornerRadius = 5.0
        self.checkButton?.layer.masksToBounds = true
     
        self.initPhotoPicker()
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            self.initCameraPicker()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCameraPicker(){
        cameraPicker = UIImagePickerController()
        cameraPicker?.delegate = self
        cameraPicker?.allowsEditing = true
        cameraPicker?.sourceType = .camera
    }
    
    func initPhotoPicker(){
        photoPicker =  UIImagePickerController()
        photoPicker?.delegate = self
        photoPicker?.allowsEditing = true
        photoPicker?.sourceType = .photoLibrary
    }
    
    @IBAction func checkAction(_: Any) {
        print("Check")
    }
    
    @IBAction func selectAction(_: Any) {
        print("Select")
        let alertC = UIAlertController(title: "Select an image", message: nil, preferredStyle: .actionSheet)
        if (cameraPicker != nil){
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (a: UIAlertAction) in
                self.present(self.cameraPicker!, animated: true, completion: nil)
            })
            alertC.addAction(cameraAction)
        }
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { (a: UIAlertAction) in
            self.present(self.photoPicker!, animated: true, completion: nil)
        })
        alertC.addAction(libraryAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (a: UIAlertAction) in
            
        })
        alertC.addAction(cancelAction)
        self.present(alertC, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.dismiss(animated: true, completion: nil)
        //获得照片
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.imageView?.image = image
    }
}
