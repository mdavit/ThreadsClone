//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by Davit Margaryan on 11.11.23.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
