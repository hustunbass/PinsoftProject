//
//  MainViewController.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 28.01.2021.
//

import UIKit
import Alamofire
import SDWebImage
import Firebase


class MainViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var service = Service()
    var filmResult = [SearchResult]()
    var loading = HLBarIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "filmCell")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadingSpinner()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,let index = tableView.indexPathForSelectedRow{
            destination.titleFilm = self.filmResult[index.row].title
            destination.modalPresentationStyle = .custom
        }
    }
    
    func getFilm(title:String?){
        service.fetchSearchData(title: title!) { (result) in
            if (result != nil) {
                self.filmResult = result!
                self.loadingSpinner()
                self.tableView.reloadData()
            }
            else{
                let alert = UIAlertController(title: "Film not found", message: "Please.Try again.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func loadingSpinner(){
         let indicatorView = HLBarIndicatorView(frame: CGRect(x: 0, y: 40, width: UIScreen.main.bounds.width, height: 80))
         indicatorView.indicatorType = .barScaleFromRight
         indicatorView.center = self.view.center
         indicatorView.barColor = .systemYellow
         self.loading.startAnimating()
         DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loading.pauseAnimating()
            indicatorView.isHidden = true
         }
         self.view.addSubview(indicatorView)
    }
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as! FilmCell
        cell.filmPhoto.sd_setImage(with: URL(string: filmResult[indexPath.row].poster!))
        cell.filmTitle.text = "Title : \(filmResult[indexPath.row].title!)"
        cell.filmYear.text = "Year : \(filmResult[indexPath.row].year!)"
        cell.filmRating.text = "IMDB ID : \(filmResult[indexPath.row].imdbID!)"
        if let type = filmResult[indexPath.row].type?.uppercased(){
        cell.filmLanguage.text = "Type : \(type)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
        cell.layer.transform = rotationTransform
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let textFieldInsideUISearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideUISearchBar?.textColor = UIColor.white
        textFieldInsideUISearchBar?.font = textFieldInsideUISearchBar?.font?.withSize(16)
        let labelInsideUISearchBar = textFieldInsideUISearchBar!.value(forKey: "placeholderLabel") as? UILabel
        labelInsideUISearchBar?.textColor = UIColor.white
        labelInsideUISearchBar?.font = labelInsideUISearchBar?.font?.withSize(16)
        getFilm(title: searchText)
        
        self.filmResult = searchText.isEmpty ? filmResult: filmResult.filter({ (model) -> Bool in
            return model.title?.range(of: searchText,options: .caseInsensitive,range: nil,locale: nil) != nil
        })
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
        filmResult.removeAll()
        self.tableView.reloadData()
    }
}
