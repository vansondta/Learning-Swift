//
//  ViewController.swift
//  SnapChat
//
//  Created by TheLightLove on 17/05/2021.
//

import UIKit
import AVFoundation
import AVKit
import MobileCoreServices

class ViewController: UIViewController {
    /// capture session
    var session = AVCaptureSession()
    /// photo out put
    let output = AVCapturePhotoOutput()
    /// video preview
    let previewLayer = AVCaptureVideoPreviewLayer()
    /// shutter button
    private let shutterButton:UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
        shutterButton.center = CGPoint(x: view.frame.width/2, y: view.frame.height - 50)
    }
    
    func actionSheet() {
        let alert = UIAlertController(title: "Choose type get data", message: "", preferredStyle: .actionSheet)
        let actionVideo = UIAlertAction(title: "Take video", style: .default, handler: {[weak self] _ in
            self?.takeVideo()
        })
        
        let photoLibrary = UIAlertAction(title: "Take photo", style: .default, handler: {[weak self] _ in
            self?.takePhoto()
        })
        
        let takePhoto = UIAlertAction(title: "Photo library", style: .default, handler: {[weak self] _ in
            self?.photoLibrary()
        })
        
        let actiondoc = UIAlertAction(title: "Document", style: .default, handler: {[weak self] _ in
            self?.takeDoc()
        })
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionVideo)
        alert.addAction(photoLibrary)
        alert.addAction(takePhoto)
        alert.addAction(actiondoc)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    func customTakePhoto() {
        checkCameraPemission()
        view.layer.addSublayer(previewLayer)
        view.addSubview(shutterButton)
        shutterButton.addTarget(self, action: #selector(didTapTakePhoto), for: .touchUpInside)
    }
    
    @IBAction func chooseImageAction(_ sender: Any) {
        actionSheet()
    }
    
    private func checkCameraPemission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            // request
            AVCaptureDevice.requestAccess(for: .video) { [weak self](granted) in
                guard granted else {
                    return
                }
                DispatchQueue.main.async {
                    self?.setUpCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setUpCamera()
        default:
            break
        }
    }
    
    private func setUpCamera() {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                session.startRunning()
                self.session = session
            } catch {
                print(error)
            }
        }
    }
    
    @objc private func didTapTakePhoto() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }

}

extension ViewController {
    func takePhoto() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    func photoLibrary() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func takeVideo() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.mediaTypes = [kUTTypeMovie as String]
        vc.delegate = self
        vc.allowsEditing = false
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)

    }
    
    func takeDoc() {
        
    }
}

extension ViewController:AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        let image = UIImage(data: data)
        session.stopRunning()
        
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage else {
            return
        }
        imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
