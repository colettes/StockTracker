//
//  RecommendationsViewController.swift
//  stockTracker
//
//  Created by Dewone Westerfield and Colette Smith.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var lastDayLabel: UILabel!
    @IBOutlet weak var addDeleteButton: UIButton!
    
    var ticker: String = ""
    var fromWatch = true
    
    
    struct StockResponse: Decodable {
        var response: Stock
        
        private enum CodingKeys : String, CodingKey {
            case response = "Global Quote"
        }
    }

    struct Stock: Decodable {
        var symbol: String
        var price: String
        var volume: String
        var lastDay: String
        var changePercent: String
        
        private enum CodingKeys : String, CodingKey {
            case symbol = "01. symbol"
            case price = "05. price"
            case volume = "06. volume"
            case lastDay = "07. latest trading day"
            case changePercent = "10. change percent"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if fromWatch {
            addDeleteButton.setTitle("Delete", for: .normal)
            addDeleteButton.layer.cornerRadius = 10
        } else {
            addDeleteButton.setTitle("Add", for: .normal)
            addDeleteButton.layer.cornerRadius = 10
        }
    }
    
    override func viewWillAppear (_ animated: Bool){
        getStock(withTicker: ticker)

    }
    
    @IBAction func addDeleteClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == "Add" {
            if !watchlist.contains(ticker) {
                watchlist.append(ticker)
            } else {
                self.showToast(message: "Already on watchlist.", font: .systemFont(ofSize: 16.0))
            }
        } else {
            if let index = watchlist.firstIndex(of: ticker) {
                watchlist.remove(at: index)
            } else {
                self.showToast(message: "Already deleted from watchlist.", font: .systemFont(ofSize: 16.0))
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func getStock(withTicker ticker: String) {
        let API_KEY = "XT4DAZ4187ZLHIQO"
        guard let url = URL(string: "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=\(ticker)&apikey=\(API_KEY)") else {
            fatalError("URL guard statement failed")
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                guard let stock = try? JSONDecoder().decode(StockResponse.self, from: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self.PriceLabel.text = "$" + stock.response.price
                    self.PriceLabel.sizeToFit()
                    self.nameLabel.text = stock.response.symbol
                    self.nameLabel.sizeToFit()
                    self.volumeLabel.text = stock.response.volume
                    self.volumeLabel.sizeToFit()
                    self.changeLabel.text = stock.response.changePercent
                    self.changeLabel.sizeToFit()
                    self.lastDayLabel.text = stock.response.lastDay
                    self.lastDayLabel.sizeToFit()
                }
            }
        }.resume()
    }
    
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 10, y: self.view.frame.size.height-175, width: 150, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.5
        toastLabel.layer.cornerRadius = 20;
        toastLabel.layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        toastLabel.layer.borderWidth = 2;
        toastLabel.numberOfLines = 2;
        toastLabel.sizeToFit()
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

