//
//  RealmImageManager.swift
//  memmo
//
//  Created by najin on 2023/02/24.
//

import Foundation
import UIKit

// 이미지 저장
func saveImageToDocumentDirectory(imageName: String, image: UIImage?) {
    // 1. 이미지를 저장할 경로를 설정해줘야함 - 도큐먼트 폴더,File 관련된건 Filemanager가 관리함(싱글톤 패턴)
    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
    
    // 2. 이미지 파일 이름 & 최종 경로 설정
    let imageURL = documentDirectory.appendingPathComponent(imageName)
    
    // 3. 이미지 압축(image.pngData())
    // 압축할거면 jpegData로~(0~1 사이 값)
    guard let image = image, let data = image.pngData() else {
        return
    }
    
    // 4. 이미지 저장: 동일한 경로에 이미지를 저장하게 될 경우, 덮어쓰기하는 경우
    // 4-1. 이미지 경로 여부 확인
    if FileManager.default.fileExists(atPath: imageURL.path) {
        // 4-2. 이미지가 존재한다면 기존 경로에 있는 이미지 삭제
        do {
            try FileManager.default.removeItem(at: imageURL)
        } catch {
        }
    }
    
    // 5. 이미지를 도큐먼트에 저장
    // 파일을 저장하는 등의 행위는 조심스러워야하기 때문에 do try catch 문을 사용하는 편임
    do {
        try data.write(to: imageURL)
    } catch {
    }
}

// 이미지 불러오기
func loadImageFromDocumentDirectory(imageName: String) -> UIImage {
        
    // 1. 도큐먼트 폴더 경로가져오기
    let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
    let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
    let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
    
    if let directoryPath = path.first {
    // 2. 이미지 URL 찾기
        let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
        // 3. UIImage로 불러오기
        return UIImage(contentsOfFile: imageURL.path) ?? UIImage(named: "profile")!
    }
    
    return UIImage(named: "profile")!
}

// 이미지 삭제하기
func deleteImageFromDocumentDirectory(imageName: String) {
    guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}

    let imageURL = documentDirectory.appendingPathComponent(imageName)

    if FileManager.default.fileExists(atPath: imageURL.path) {
        do {
            try FileManager.default.removeItem(at: imageURL)
        } catch {
        }
    }
}
