//
//  DetailViewController.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 29.01.2021.
//

import UIKit
import Firebase

class DetailViewController: UIViewController{
    
    
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmYear: UILabel!
    @IBOutlet weak var filmActor: UILabel!
    @IBOutlet weak var filmGenre: UILabel!
    @IBOutlet weak var filmProductions: UILabel!
    @IBOutlet weak var imdbRatings: UILabel!
    @IBOutlet weak var filmDirector: UILabel!
    
    var service = Service()
    var filmDetail : FilmRequest?
    var titleFilm :String?
    
    @IBOutlet weak var backview2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getDetail(title: titleFilm)
    }

    func configureUI(){
        backview.layer.shadowRadius = 1
        backview2.layer.shadowRadius = 1
    }
    
    func initDetail(){
        posterImage.sd_setImage(with: URL(string: (self.filmDetail?.poster)!))
        filmTitle.text = "Title : " + (self.filmDetail?.title)!
        filmYear.text = "Year : " + (self.filmDetail?.year)!
        filmActor.text = "Actor : " + (self.filmDetail?.actors)!
        filmGenre.text = "Genre : " + (self.filmDetail?.genre)!
        filmProductions.text = "Production : " +  (self.filmDetail?.production)!
        imdbRatings.text = "IMDB Rating : " + (self.filmDetail?.imdbRating)!
        filmDirector.text = "Director : " + (self.filmDetail?.director)!
    }

    func getDetail(title:String?){
        //show progress
        service.fetchFilmDetail(title: title!) { (result) in
        //            hide progress
            if (result != nil) {
                self.filmDetail = result!
                self.logEvent()
                self.initDetail()
            }
        }
    }
    
    func logEvent(){
        Analytics.logEvent("film_detail", parameters: ["film_title":self.filmDetail?.title! ?? "N/A"])
        Analytics.logEvent("film_detail", parameters: ["film_year":self.filmDetail?.year! ?? "N/A"])
        Analytics.logEvent("film_detail", parameters: ["film_actor":self.filmDetail?.actors! ?? "N/A"])
        Analytics.logEvent("film_detail", parameters: ["film_genre":self.filmDetail?.genre! ?? "N/A"])
        Analytics.logEvent("film_detail", parameters: ["film_product":self.filmDetail?.production! ?? "N/A"])
        Analytics.logEvent("film_detail", parameters: ["film_rating":self.filmDetail?.imdbRating! ?? "N/A"])
        Analytics.logEvent("film_detail", parameters: ["film_director":self.filmDetail?.director! ?? "N/A"])
    }
}
