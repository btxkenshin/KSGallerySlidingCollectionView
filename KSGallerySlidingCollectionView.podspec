Pod::Spec.new do |s|
  s.name         = 'KSGallerySlidingCollectionView'
  s.version      = '0.0.1'
  s.summary      = 'A collection view menu in the style of UltraVisual'
  s.author 		= { "btxkenshin" => "mobilejiajia@gmail.com" }
  s.homepage     = 'https://github.com/btxkenshin/KSGallerySlidingCollectionView'
  s.source = {
    :git => 'https://github.com/btxkenshin/KSGallerySlidingCollectionView.git',
    :tag => '0.0.1'
  }
  s.source_files = 'KSGallerySlidingCollectionView/*.{h,m}'
  s.license      = 'MIT'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
end