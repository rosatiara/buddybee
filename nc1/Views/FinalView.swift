//
//  FinalView.swift
//  nc1
//
//  Created by Team 1 on 18/03/23.
//

import SwiftUI
import Foundation
import UIKit


struct FinalView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}

func takeScreenshot(_ sender: Any) //that is triggered when the button is pressed
{
    // Get the bounds of the screen
    let screenBounds = UIScreen.main.bounds
    
    // Create a renderer with the bounds of the screen
    let renderer = UIGraphicsImageRenderer(bounds: screenBounds)
    
    // Get the window scene to render from
    guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else {
        return
    }
    
    // Get the window to render from
    guard let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
        return
    }
    
    // Render the contents of the window to an image
    let screenshot = renderer.image { _ in
        window.drawHierarchy(in: screenBounds, afterScreenUpdates: true)
    }
    
    // Save the image to the user's photo library
    UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
}
