//
//  ConfiguracionVC.swift
//  conOSinTilde
//
//  Created by Pamela on 26/05/21.
//

import UIKit

class ConfiguracionVC: UIViewController {

    @IBAction func borrarProgreso(_ sender: UIButton) {
        let alerta = UIAlertController(title: "Borrar Progreso", message: "¿Estas seguro que quieres borrar tu progreso del curso? ", preferredStyle: .alert)
        let confirmar = UIAlertAction(title: "CONFIRMAR", style: .default, handler: {
            (action: UIAlertAction!) in
            self.resetDefaults()
        })
        let cancelar = UIAlertAction(title: "CANCELAR", style: .cancel, handler: nil)
        alerta.addAction(confirmar)
        alerta.addAction(cancelar)
        
        present(alerta, animated: true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
        let alertaDone = UIAlertController(title: "Borrar Progreso", message: "Tu progreso ha sido borrado", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertaDone.addAction(ok)
        present(alertaDone, animated: true, completion:nil)
        
    }

}
