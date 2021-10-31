//
//  SecondScreen.swift
//  downloading data from internet (iOS)
//
//  Created by vojta on 26.02.2021.
//
import CoreImage.CIFilterBuiltins
import SwiftUI

struct QRCode: View {
    @EnvironmentObject var order: Order
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var orderString: String{
        return "\(order.type) \n \(order.quantity) \n \(order.desert) \n \(order.desertsNumber)\n\(order.name) \n \(order.city)\n\(order.street) \n \(order.zip)\n\(order.price)"
    }
    
    var body: some View {
        VStack{
            Text("QRCode of your order")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.primary)
              
            Image(uiImage: generateQRCode(from: orderString))
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .padding(.vertical)
           
        }
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRCode_Previews: PreviewProvider {
    static var previews: some View {
        QRCode()
            .environmentObject(Order())
    }
}
