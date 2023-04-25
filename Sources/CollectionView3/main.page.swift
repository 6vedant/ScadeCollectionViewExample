import ScadeKit
import ScadeUI

extension SCDWidgetsCollectionView {

  public func elementProvider<T>(_ clousure: @escaping (T, SCDWidgetsContainer) -> Void) {
    self.elementProvider = SCDWidgetsElementProvider(clousure)
  }
}

class MainPageAdapter: SCDLatticePageAdapter {

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    if let cv = self.page?.getWidgetByName("collectionView") as? SCDWidgetsCollectionView {
      cv.elementProvider { (text: String, element) in
        element["image", as: SCDWidgetsImage.self]?.url = "Assets/\(text)"
        element["label", as: SCDWidgetsLabel.self]?.text = text

      }
      // cv.columns = 5
      cv.rows = 6
      cv.items = [
        "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
        "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
        "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
        "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg",
      ]
    }

    //    if let cv1 = self.page?.getWidgetByName("collectionView1") as? SCDWidgetsCollectionView {
    //      cv1.elementProvider { (text: String, element) in
    //        element["label1", as: SCDWidgetsLabel.self]?.text = text
    //      }
    //      //cv1.columns = 3
    //      //cv.rows = 6
    //      cv1.items = (1...100).map(String.init)

  }
}
