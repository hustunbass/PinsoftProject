//
//  FilmCell.swift
//  PinsoftProject
//
//  Created by Hakan Üstünbaş on 28.01.2021.
//

import UIKit

class FilmCell: UITableViewCell {

    @IBOutlet weak var filmPhoto: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmYear: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    @IBOutlet weak var filmLanguage: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(){
        
        filmPhoto.layer.cornerRadius = filmPhoto.frame.height/2
        filmPhoto.clipsToBounds = true
        backView.layer.cornerRadius = 15
        backView.layer.shadowPath = UIBezierPath(rect: backView.bounds).cgPath
        backView.layer.shadowRadius = 5
        backView.layer.shadowOffset = .zero
        backView.layer.shadowOpacity = 1
        
    }
    
}
