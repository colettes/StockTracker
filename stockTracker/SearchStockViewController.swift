//
//  SearchStockViewController.swift
//  stockTracker
//
//  Created by Dewone Westerfield and Colette Smith.
//

import UIKit

class SearchStockViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    //@IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var table: UITableView!
    @IBOutlet var field : UITextField!
    var filtered = false;
    
    let stockTickers = ["AMC","NOK","BB","AAPL","TSLA","SNDL","NIO","GE","F","DIS","MSFT","AMZN","GME","APHA","ZOM","AAL","PLUG","PFE","ACB","CCIV","CCL","GPRO","PLTR","DAL","OGI","NAKD","SNAP","BABA","CTRM","NFLX","MRNA","BAC","CGC","FCEL","IDEX","AMD","FB","TWTR","TLRY","NCLH","T","WKHS","SPCE","ZNGA","GM","SBUX","UAL","BA","KO","CRON","NVDA","JNJ","UBER","GNUS","TXMD","VOO","OCGN","SQ","RBLX","PSEC","SPY","NKLA","ABNB","WMT","BNGO","DKNG","ARKK","LUV","HEXO","MRO","SIRI","PYPL","RCL","RIOT","XOM","JBLU","GOOGL","NNDM","NAK","SENS","GSAT","SNE","INO","PTON","SAVE","FUBO","NKE","ZM","CPRX","IVR","RYCEY","ET","BLNK","TNXP","XPEV","NRZ","GUSH","PENN","MARA","MGM"];
    var filteredData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self;
        table.dataSource = self;
        field.delegate = self;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        if !filteredData.isEmpty{
            return filteredData.count;
        }
        else{
            return filtered ? 0 : stockTickers.count;
        }
        
    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return stockTickers.count;
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        if(!filteredData.isEmpty){
            cell.textLabel?.text = filteredData[indexPath.row]
        }
        else{
            cell.textLabel?.text = stockTickers[indexPath.row];
        }
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text{
            filterText(text+string)
        }
        return true;
    }
    func filterText(_ query : String){
        filteredData.removeAll()
        for string in stockTickers{
            if(string.starts(with: query.uppercased())){
                filteredData.append(string)
            }
        }
        table.reloadData();
        if filteredData.isEmpty{
            filtered = true;
        }
    }

    @IBAction func searchEnded(_ sender: UITextField) {
        if let query = sender.text {
            filterText(query)
        }
        sender.resignFirstResponder()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       guard let detailViewController = segue.destination as? DetailViewController else { return }
        guard let cell = sender as? UITableViewCell else { return }
        guard let indexPath = self.table.indexPath(for: cell) else { return }
        if (!filteredData.isEmpty) {
            detailViewController.ticker = filteredData[indexPath.row]
            
        } else {
            detailViewController.ticker = stockTickers[indexPath.row]
        }
        
        detailViewController.fromWatch = false
//        if let detailViewController = segue.description as? DetailViewController{
//            if let indexPath = self.table.indexPathForSelectedRow{
//                detailViewController.ticker = stockTickers[indexPath.row];
//            }
//        }
    }

}
