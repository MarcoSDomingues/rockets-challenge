//
//  UIImageView+Nuke.swift
//  Rockets
//
//  Created by Marco Domingues on 10/06/2021.
//

import Nuke
import UIKit
import Foundation

extension UIImageView {
    
    open func loadImage(withURL url: URL, placeholderImage: UIImage? = nil) {
        let request = ImageViewLoader.shared.makeRequest(with: url)
        var options = ImageLoadingOptions(transition: .fadeIn(duration: 0.25))
        options.pipeline = ImageViewLoader.shared.pipeline
        options.placeholder = placeholderImage
        Nuke.loadImage(with: request, options: options, into: self)
    }
    
}

private class ImageViewLoader {
    
    let pipeline: ImagePipeline
    static let shared = ImageViewLoader()

    private init() {
        pipeline = ImagePipeline {
            let config = URLSessionConfiguration.default
            $0.dataLoader = DataLoader(configuration: config)
            $0.dataCache = try? DataCache(name: "md.rockets")
        }
    }
    
    func makeRequest(with url: URL) -> ImageRequest {
        return ImageRequest(url: url)
    }
    
}
