#
# Be sure to run `pod lib lint SSRNetwork.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSRNetwork'
  s.version          = '0.1.1'
  s.summary          = 'Useful network for handle data based on Alamofire.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Useful network for handle data based on Alamofire which can handle standard server data."

  s.homepage         = 'https://github.com/mistdon/SSRNetwork'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'wonderland.don@gmail.com'
  s.source           = { :git => 'https://github.com/mistdon/SSRNetwork.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
  s.ios.deployment_target = '9.0'
  s.swift_versions = '5.0'
  s.source_files = 'SSRNetwork/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SSRNetwork' => ['SSRNetwork/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'Alamofire', '~> 4.8.1'

end
