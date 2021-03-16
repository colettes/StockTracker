//
//  SearchResultsTableTableViewController.swift
//  stockTracker
//
//  Created by Dewone Westerfield and Colette Smith.
//

import UIKit

class SearchResultsTableTableViewController: UITableViewController{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let stockTickers = ["AMC","NOK","BB","AAPL","TSLA","SNDL","NIO","GE","F","DIS","MSFT","AMZN","GME","APHA","ZOM","AAL","PLUG","PFE","ACB","CCIV","CCL","GPRO","PLTR","DAL","OGI","NAKD","SNAP","BABA","CTRM","NFLX","MRNA","BAC","CGC","FCEL","IDEX","AMD","FB","TWTR","TLRY","NCLH","T","WKHS","SPCE","ZNGA","GM","SBUX","UAL","BA","KO","CRON","NVDA","JNJ","UBER","GNUS","TXMD","VOO","OCGN","SQ","RBLX","PSEC","SPY","NKLA","ABNB","WMT","BNGO","DKNG","ARKK","LUV","HEXO","MRO","SIRI","PYPL","RCL","RIOT","XOM","JBLU","GOOGL","NNDM","NAK","SENS","GSAT","SNE","INO","PTON","SAVE","FUBO","NKE","ZM","CPRX","IVR","RYCEY","ET","BLNK","TNXP","XPEV","NRZ","GUSH","PENN","MARA","MGM"];
    let filteredData: [String]! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stockTickers.count;
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = stockTickers[indexPath.row]
        return cell
    }
//    func searchBar(_ searchBar : UISearchBar, textDidChange searchText : String){
//        tableView.reloadData();
//    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    */
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
