//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by deniz aslantas on 11.11.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var gbfLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func getRatesClicked(_ sender: Any) {
    }
    
 
                
    // 1) Request & Session
          // 2) Response & Data
          // 3) Parsing & JSON Serialization
          
          
          // 1.
          let url = URL(string: "https://api.apilayer.com/fixer/latest?apikey=KIv3BgdlPeEBQkTnIXRn4deVn8fTSsLC")
                        
          
          let session = URLSession.shared
          
          //Closure
          
          let task = session.dataTask(with: url!) { (data, response, error) in
              if error != nil {
                  let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                  let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                  alert.addAction(okButton)
                  self().present(alert, animated: true, completion: nil)
              } else {
                  // 2.
                  if data != nil {
                      do {
                      let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                          
                          //ASYNC
                          
                          DispatchQueue.main.async {
                              if let rates = jsonResponse["rates"] as? [String : Any] {
                                  //print(rates)
                                  
                                  if let usd = rates["USD"] as? Double {
                                      self.usdLabel.text = "USD: \(usd)"
                                  }
                                  
                                  if let cad = rates["CAD"] as? Double {
                                      self.cadLabel.text = "CAD: \(cad)"
                                  }
                                  
                                  if let chf = rates["CHF"] as? Double {
                                      self.chfLabel.text = "CHF: \(chf)"
                                  }
                                  
                                  if let try = rates["TRY"] as? Double {
                                      self.tryLabel.text = "TRY: \(try)"
                                  }
                                  
                                  if let gbf = rates["GBF"] as? Double {
                                      self.gbfLabel.text = "GBF: \(gbf)"
                                  }
                                  
                                  if let jpy = rates["JPY"] as? Double {
                                      self.tryLabel.text = "JPY: \(jpy)"
                                  }
                                  
                                  
                              }
                          }
                          
                          
                      } catch {
                         print("error")
                      }
                      
                  }
                  
                  
              }
          }
          
    task.resume()
          
          
      }
      


