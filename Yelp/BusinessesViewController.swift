//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FiltersViewControllerDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var businesses: [Business]!
    
    var searchBar = UISearchBar()
    
    var preferences = Preferences()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferences.deals = false
        preferences.sort = .Distance
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120 // only used for scroll height dimension
        
        searchBar.text = "Restaurants"
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        
        navigationItem.titleView = searchBar
        
        search(nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessCell", forIndexPath: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row]
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        
        filtersViewController.delegate = self
        filtersViewController.preferences = preferences
    }

    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters preferences: Preferences?) {
        
        if let prefs = preferences {
            self.preferences = prefs
        }
        search(searchBar.text)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search(searchBar.text)
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = "Restaurants"
        search(searchBar.text)
        searchBar.endEditing(true)
    }
    
    func search(term: String?) {
        Business.searchWithTerm(term ?? "Restaurants", sort: preferences.sort, categories: preferences.categories, deals: preferences.deals, radius: preferences.radius) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
}
