require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = package['name']
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = "https://github.com/mehmetsahindev/react-native-pinger"
  s.license      = package['license']
  s.author       = package['author']
  s.source       = { :git => "https://github.com/mehmetsahindev/react-native-pinger", :tag => "#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"
  s.ios.deployment_target = '8.0'
  s.dependency 'React'
end