//
//  SelectImageController.swift
//  GreenStep
//
//  Created by JIN on 7/25/25.
//

import UIKit

class  UploadImageController: UIViewController {
    
    // MARK: - Properties
    
    private var postImage: UIImage?
    
    let viewModel = UploadPostViewModel()
    
    private lazy var libraryButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
        let image  = UIImage(systemName: "photo", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.cornerRadius = 8
        button.tintColor = .gray
        button.addTarget(self, action: #selector(handleLibraryButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var cameraButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 15, weight: .regular)
        let image  = UIImage(systemName: "camera.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 25
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleCarmeraButton), for: .touchUpInside)
        return button
    }()
    
    let textViewPlaceHolder = "기록을 남겨보세요."
    
    private lazy var textArea: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.textColor = .black
        textView.text = textViewPlaceHolder
        textView.textColor = .lightGray
        textView.delegate = self
        return textView
    }()
    
    
    private lazy var uploladImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleUploadButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
   
    }
    
    // MARK: -Action
    
    @objc private func didTapTextView(_ sender: Any) {
          view.endEditing(true)
      }
    
    @objc private func handleLibraryButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    @objc private func handleCarmeraButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    @objc private func handleUploadButton() {
        let rawText = textArea.text ?? ""
        let title: String
        
          if rawText == textViewPlaceHolder {
              title = ""
          } else {
              title = rawText.trimmingCharacters(in: .whitespacesAndNewlines)
          }
        self.navigationController?.popViewController(animated: true)
        viewModel.uploadPost(title: title, image: postImage)
    }
    

}

// MARK: - TextViewDelegate

extension UploadImageController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("편집시작")
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }
}

// MARK: - UI & Layout

extension UploadImageController {
    func setUp() {
        view.backgroundColor = .systemBackground
        setImageButtons()
        setUploadButton()
        setTextArea()
        setTabViewGesture()

    }
    
    func setTabViewGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func setImageButtons() {
        view.addSubview(cameraButton)
        cameraButton.setDimensions(height: 50, width: 75)
        cameraButton.centerX(inView: view)
        cameraButton.anchor(top: view.topAnchor, paddingTop: 120)
        view.addSubview(libraryButton)
        libraryButton.centerX(inView: view)
        libraryButton.setDimensions(height: 200, width: 340)
        libraryButton.anchor(top: cameraButton.bottomAnchor, paddingTop: 20)
    }
    
    func setTextArea() {
        view.addSubview(textArea)
        textArea.setDimensions(height: 200, width: 340)
        textArea.centerX(inView: view)
        textArea.anchor(bottom: view.bottomAnchor, paddingBottom: 255)
    }
    
    func setUploadButton() {
        view.addSubview(uploladImageButton)
        uploladImageButton.setDimensions(height: 45, width: 320)
        uploladImageButton.centerX(inView: view)
        uploladImageButton.anchor(bottom: view.bottomAnchor, paddingBottom: 200)

    }

}

//MARK: - Delegate

extension UploadImageController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        postImage = selectedImage
                
        libraryButton.clipsToBounds = true
        libraryButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


#Preview {
    UploadImageController()
}
