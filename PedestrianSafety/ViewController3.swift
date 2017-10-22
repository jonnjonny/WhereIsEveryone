//
//  ViewController3.swift
//  PedestrianSafety
//
//  Created by Jonathan Leung on 2017-10-22.
//  Copyright © 2017 jonathan. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    private var embeddedViewController: ViewController2!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController2,
            segue.identifier == "embedSegue" {
            self.embeddedViewController = vc
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        timeLabel.text = String(Int(sender.value+8))
        let currentTime = Date().timeIntervalSince1970
        let urlString = "http://10.10.4.46:5000/traffic/" + String(Int((currentTime*1000)+600000) + Int(sender.value*60000*60))
        print(urlString)
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [String:String]
                    DispatchQueue.main.async {
                        // now update UI on main thread
                        for key in self.embeddedViewController.labels.keys
                        {
                            let pedestrianCount = Int(parsedData[key]!)!
                            let color: UIColor!
                            if pedestrianCount < 15
                            {
                                color = UIColor.red
                            }
                            else if(pedestrianCount>=15 && pedestrianCount < 50)
                            {
                                color = UIColor.yellow
                            }
                            else
                            {
                                color = UIColor.green
                            }
                            let customIcon = UIImage.circle(diameter: 50.0, color: color)
                            let customIconView = UIImageView(image: customIcon)
                            let label = UILabel()
                            label.frame = CGRect(x: (customIconView.bounds.size.width/2)-14,y: 15, width: customIconView.bounds.size.width, height: customIconView.bounds.size.height)
                            label.textAlignment = .center
                            label.text = parsedData[key]
                            label.sizeToFit()
                            label.textColor = UIColor.black
                            self.embeddedViewController.labels[key] = label
                            customIconView.addSubview(label)
                            self.embeddedViewController.markers[key]?.iconView = customIconView
                        }
                        /*self.labels["30-1077-2-E"]?.text = parsedData["30-1077-2-E"]
                         self.labels["30-1081-2-S"]?.text = parsedData["30-1081-2-S"]
                         self.labels["30-1081-1-E"]?.text = parsedData["30-1081-1-E"]
                         self.labels["30-1050-2-S"]?.text = parsedData["30-1050-2-S"]
                         self.labels["30-1037-1-W"]?.text = parsedData["30-1037-1-W"]
                         self.labels["30-1040-2-S"]?.text = parsedData["30-1040-2-S"]
                         self.labels["30-1042-2-S"]?.text = parsedData["30-1042-2-S"]
                         self.labels["30-1042-1-E"]?.text = parsedData["30-1042-1-E"]
                         self.labels["30-1047-2-S"]?.text = parsedData["30-1047-2-S"]
                         self.labels["30-1082-2-S"]?.text = parsedData["30-1082-2-S"]
                         self.labels["30-1082-1-E"]?.text = parsedData["30-1082-1-E"]
                         self.labels["30-1041-2-N"]?.text = parsedData["30-1041-2-N"]
                         self.labels["30-1030-2-W"]?.text = parsedData["30-1030-2-W"]
                         self.labels["30-1039-2-S"]?.text = parsedData["30-1039-2-S"]
                         self.labels["30-1052-2-E"]?.text = parsedData["30-1052-2-E"]
                         self.labels["30-1054-2-N"]?.text = parsedData["30-1054-2-N"]
                         self.labels["30-1046-2-E"]?.text = parsedData["30-1046-2-E"]
                         self.labels["30-1046-1-N"]?.text = parsedData["30-1046-1-N"]
                         self.labels["30-1065-2-E"]?.text = parsedData["30-1065-2-E"]
                         self.labels["30-1065-1-N"]?.text = parsedData["30-1065-1-N"]
                         self.labels["30-1018-2-W"]?.text = parsedData["30-1018-2-W"]
                         self.labels["30-1018-1-S"]?.text = parsedData["30-1018-1-S"]
                         self.labels["30-1070-2-E"]?.text = parsedData["30-1070-2-E"]
                         self.labels["30-1073-2-S"]?.text = parsedData["30-1073-2-S"]
                         self.labels["30-1071-2-S"]?.text = parsedData["30-1071-2-S"]
                         self.labels["30-1064-1-S"]?.text = parsedData["30-1064-1-S"]
                         self.labels["30-1063-2-W"]?.text = parsedData["30-1063-2-W"]
                         self.labels["30-1074-2-W"]?.text = parsedData["30-1074-2-W"]
                         self.labels["30-1074-1-S"]?.text = parsedData["30-1074-1-S"]
                         self.labels["30-1017-2-S"]?.text = parsedData["30-1017-2-S"]
                         self.labels["30-1066-2-W"]?.text = parsedData["30-1066-2-W"]
                         self.labels["30-1077-2-E"]?.text = parsedData["30-1077-2-E"]
                         self.labels["30-276"]?.text = parsedData["30-276"]
                         self.labels["30-225"]?.text = parsedData["30-225"]
                         self.labels["30-229"]?.text = parsedData["30-229"]
                         self.labels["30-233"]?.text = parsedData["30-233"]*/
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

