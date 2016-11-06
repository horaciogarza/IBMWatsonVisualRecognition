//
//  ViewController.swift
//  WatsonVisualRecognition
//
//  Created by Horacio Garza on 11/4/16.
//  Copyright © 2016 HGarz Studios. All rights reserved.
//

import UIKit
import Alamofire
import VisualRecognitionV3
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let apiKey = "e9b2d83b02a794c8c61219fd956725815d55110a"
        let version = "2016-11-05" // use today's date for the most recent version
        let visualRecognition = VisualRecognition(apiKey: apiKey, version: version)
        
        let url = "https://staticdelivery.nexusmods.com/mods/110/images/74627-0-1459502036.jpg"
        
        //This part has a strange functionality, Xcode can't identify the type of object classifiedImages (maybe an XCode bug)
//        let success = { classifiedImages in
//            
//            
//            print(classifiedImages)
//            
//            
//            
//            
//        }
//        
//        visualRecognition.classify(image: url, success: success)
        
        
        /*let failure = { (error: Error) in print(error) }
        
        visualRecognition.classify(image: url, failure: failure) { classifiedImages in
            print(classifiedImages)
            
        }*/
        var results : String = "Resultados de la imagen\n\n"
        
        visualRecognition.classify(image: url) { [unowned self] (classifiedImages) in
            
            /*for classification in classifiedImages.images{
                print(classification.classifiers)
            }*/
            
            for classification in classifiedImages.images[0].classifiers[0].classes{
                results = results + "Clasificacion: \(classification.classification) \n Probabilidad: \(classification.score) \n\n"
            }
            
            //lo cambias al main para que se pueda mostrar, si no truena.
            DispatchQueue.main.async {
                self.textView.text = results
            }
            
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

