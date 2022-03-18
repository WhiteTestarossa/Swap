//
//  NewItemTableViewController.swift
//  Swap
//
//  Created by Daniel Belokursky on 18.03.22.
//

import UIKit

class NewItemTableViewController: UITableViewController {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.tag = 1
            nameTextField.delegate = self
        }
    }
    @IBOutlet weak var locationTextField: UITextField! {
        didSet {
            locationTextField.tag = 2
            locationTextField.delegate = self
        }
    }
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.tag = 3
            descriptionTextView.layer.cornerRadius = 10.0
            descriptionTextView.layer.masksToBounds = true
        }
    }
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Title
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationItem.title = "New Item"
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: Choosing photo
        if indexPath.row == 0 {
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose photo source", preferredStyle: .actionSheet)
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { _ in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    self.present(imagePicker, animated: true, completion: nil)
                }
            })
            
            let photoLibraryAction = UIAlertAction(title: "Library", style: .default) { _ in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.allowsEditing = false
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            // TODO: FOR iPAD
            present(photoSourceRequestController, animated: true, completion: nil)
        }
    }
}

    //MARK: - TextField Delegate Methods
extension NewItemTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = self.view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
}
