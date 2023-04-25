import ScadeKit

extension MainPageAdapter {
  var collectionView: SCDWidgetsCollectionView {
    return self.page?.getWidgetByName("collectionView") as! SCDWidgetsCollectionView
  }
}