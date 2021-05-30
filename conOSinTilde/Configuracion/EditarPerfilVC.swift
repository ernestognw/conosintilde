//
//  EditarPerfilVC.swift
//  conOSinTilde
//
//  Created by Pamela on 25/05/21.
//

import UIKit

class EditarPerfilVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    let defaults = UserDefaults.standard
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var imgFoto: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        actualizaInterfaz()

    }
    
    func actualizaInterfaz() {
        let defaults = UserDefaults.standard
        
        if let usuario = defaults.value(forKey: "nombreUsuario") as? String {
            tfUsuario.text = usuario
        }
        
        if defaults.value(forKey: "imagenUsuario") != nil {
            var data = defaults.object(forKey: "imagenUsuario") as! Data
            var uiImage: UIImage? { UIImage(data: data) }
            imgFoto.image = uiImage
            
        } else {
            imgFoto.image = UIImage(named: "default")
        }
    }
    
    @IBAction func agregarFotoUsuario(_ sender: UITapGestureRecognizer){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func guardarConfiguracion(_ sender: UIButton) {
        guardarDatos()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitarKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        guardarDatos()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guardarDatos()
    }
    
    func guardarDatos(){
        if let usuario = tfUsuario.text {
            defaults.setValue(usuario, forKey: "nombreUsuario")
            
        }
    }

    
    //MARK: - Métodos de delegado UIImage Picker Controller
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let foto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgFoto.image = foto
        var dataImage = foto.pngData()
        UserDefaults().set(dataImage, forKey: "imagenUsuario")
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}
