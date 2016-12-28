//
//  AddPlaceViewController.swift
//  Places
//
//  Created by Maria Susana Moline Venanzi on 12/22/16.
//  Copyright © 2016 Uberbliss. All rights reserved.
//


import UIKit

class AddPlaceViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate{

    
    @IBOutlet weak var imageView: UIImageView!
   
    @IBOutlet var textFieldName: UITextField!
    
    @IBOutlet var textFieldTipo: UITextField!
    
    @IBOutlet var textFieldDireccion: UITextField!
    
    @IBOutlet var textFieldTelefone: UITextField!
    
    @IBOutlet var textFieldWeb: UITextField!
    
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    
    var rating : String?
    
    var place : Place?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.textFieldName.delegate = self
        
        self.textFieldTipo.delegate = self
        
        self.textFieldDireccion.delegate = self
        
        self.textFieldTelefone.delegate = self
        
        self.textFieldWeb.delegate = self
        
        
        
        
    }
    
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
   
        if let name = self.textFieldName.text,
                let tipo = self.textFieldTipo.text,
                let direccion = self.textFieldDireccion.text,
                let telefone = self.textFieldTelefone.text,
                let Web  = self.textFieldWeb.text,
                let theImage = self.imageView.image,
                let rating = self.rating {
        
                self.place = Place(name: name, type: tipo, location: direccion, image: theImage, telefone: telefone, website: Web)
                self.place!.rating = rating
            print(self.place!.name)
  
          self.performSegue(withIdentifier: "unwindToMainViewController", sender: self)
            
            
        } else {
            let allertController = UIAlertController(title: "me hace falta datos", message: "revisa que lo tengas todo configurado", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            allertController.addAction(okAction)
            self.present(allertController, animated: true ,completion: nil)
            
            
        }
        
        
        
        
    }
        
    
    let defaultColor = UIColor(red: 182.0/255.0, green: 196.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    let selectedColor = UIColor.red
    
    
    

    
    @IBAction func ratingPressed(_ sender: UIButton) {
   
        switch sender.tag {
        case 1:
            self.rating = "dislike"
            self.button1.backgroundColor = selectedColor
            self.button2.backgroundColor = defaultColor
            self.button3.backgroundColor = defaultColor
        case 2:
            
            self.rating = "good"
            self.button1.backgroundColor = defaultColor
            self.button2.backgroundColor = selectedColor
            self.button3.backgroundColor = defaultColor
        case 3:
            
            self.rating = "great"
            self.button1.backgroundColor = defaultColor
            self.button2.backgroundColor = defaultColor
            self.button3.backgroundColor = selectedColor
        default:
            break
        }
    
    }
    
    

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated:true, completion: nil)
            }
            
            
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    
    
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.clipsToBounds = true
        
        let leadingConstrain = NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self.imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstrain.isActive = true
        
        let trailingConstrain = NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self.imageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstrain.isActive = true
        
        
        let topConstrain = NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self.imageView.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstrain.isActive = true
        
        
        let bottomConstrain = NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self.imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstrain.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    
   

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
        return true
    
    }
    

}
