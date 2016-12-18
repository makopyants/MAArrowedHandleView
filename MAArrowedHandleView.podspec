#
# Be sure to run `pod lib lint MAArrowedHandleView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MAArrowedHandleView'
  s.version          = '1.0.0'
  s.summary          = 'An arrow handle like iOS 10 Apple Music application'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: make Swift version.
                       DESC

  s.homepage         = 'https://github.com/devthanatos/MAArrowedHandleView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Akopyants' => 'michael.akopyants@gmail.com' }
  s.source           = { :git => 'https://github.com/devthanatos/MAArrowedHandleView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.source_files = 'MAArrowedHandleView/Classes/**/*'

  s.frameworks = 'UIKit'
end
