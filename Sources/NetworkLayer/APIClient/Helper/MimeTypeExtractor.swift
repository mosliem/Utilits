//
//  File 2.swift
//  
//
//  Created by mohamed sliem on 20/03/2024.
//

import Foundation

class MimeTypeExtractor {

  static let shared = MimeTypeExtractor()
  private init(){}

  private let mediaMimeTypes: [String: String] = [
    "jpg": "image/jpeg",
    "jpeg": "image/jpeg",
    "png": "image/png",
    "gif": "image/gif",
    "mp3": "audio/mpeg",
    "wav": "audio/wav",
    "mp4": "video/mp4",
    "avi": "video/x-msvideo",
    "pdf": "application/pdf",
    "doc": "application/msword",
    "docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
  ]
  
  func mimeType(for fileName: String) -> String {
      guard let exten = fileName.components(separatedBy: ".").last?.lowercased() else {
          return "application/unknown"
      }
    
      return mediaMimeTypes[exten] ?? "application/unknown"
  }
}
