//
//  ViewController.swift
//  Places
//   Rafa Aguirre
//  Created by Maria Susana Moline Venanzi on 12/10/16.
//  Copyright © 2016 Uberbliss. All rights reserved.
//

import UIKit

class ViewController: UITableViewController { /*UIViewController, UITableViewDataSource, UITableViewDelegate*/
    
    var places : [Place] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
      
        var place = Place(name: "Alexanderplatz", type: "Plaza", location: "Alexanderstraße 4 10178 Berlin Deutschland", image: #imageLiteral(resourceName: "alexanderplatz"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
    

        place = Place(name: "Atonium" , type: "Plaza", location: "Atomiumsquare 1020 Brussels Belgium", image: #imageLiteral(resourceName: "atomium"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        
        
        place = Place(name: "Big Ben" , type: "Reloj", location: "London SW1A 0AA England", image: #imageLiteral(resourceName: "bigben"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        
        
        place = Place(name: "Cristo Redentor" , type: "Monumento", location: "Cristo Redentor Joao Pessoa - PB Brasil", image: #imageLiteral(resourceName: "cristoredentor"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        
        
        place = Place(name: "Torre Eifel" , type: "Monumento", location: "5 Avenue Anatole France 75007 Paris France", image: #imageLiteral(resourceName: "torreeiffel"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        

        place = Place(name: "Muraya China" , type: "Monumento", location: "Great Wall Mitiamyu, Beijing China", image: #imageLiteral(resourceName: "murallachina"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        
        
        place = Place(name: "torre Piza" , type: "Monumento", location: "Leaning Tower of Pisa 56126 Pisa, Province of Pisa Italy", image: #imageLiteral(resourceName: "torrepisa"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        
        place = Place(name: "Catedral de Mayorca" , type: "Catedral", location: "La Seu Plaza de la Seu 5 07001 Palma Baleares España", image: #imageLiteral(resourceName: "mallorca"), telefone: "555" , website: "www.sdsdf.com")
        places.append(place)
        
        
}



    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    //MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place = places[indexPath.row]
        let cellID = "PlaceCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
        
        cell.thumbnailImageView.image = place.image
        cell.nameLabel.text = place.name
        cell.timeLabel.text = place.type
        cell.ingredientsLabel.text = place.location
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.places.remove(at: indexPath.row)
            
        }
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let place = self.places[indexPath.row]
            
            
            let shareDefaultText = "Estoy visitando \(place.name) en la App del curso de iOS 10 con Juan Gabriel"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, place.image], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.places.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        
        return [shareAction, deleteAction]
    }
    
    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedPlace = self.places[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.place = selectedPlace
            }
        }
    }
    
    
    
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {
        
       
        if segue.identifier == "unwindToMainViewController" {
            
           if let addplaceVC = segue.source as? AddPlaceViewController {
            if let newPlace = addplaceVC.place {
                self.places.append(newPlace)
                self.tableView.reloadData()
            }
        }
        
 
    }
    

}
}




