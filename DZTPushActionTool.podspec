Pod::Spec.new do |spec|
  spec.name         = 'DZTPushActionTool'
  spec.version      = '1.0.1'
  spec.ios.deployment_target = '8.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/YYDD/DZTPushActionTool'
  spec.authors      = { 'YYDD' => '615689375@qq.com' }
  spec.summary      = 'iOS Tools'
  spec.requires_arc = true


#  spec.source       = { :git => 'https://github.com/YYDD/DZTPushActionTool.git',:tag => spec.version}
  spec.source       = { :git => 'https://github.com/YYDD/DZTPushActionTool.git'}
  spec.source_files = 'DZTPushActionCommon/*.{h,m}'
  spec.public_header_files = 'DZTPushActionCommon/*.{h}'


 
  spec.frameworks   = 'UIKit'


end
