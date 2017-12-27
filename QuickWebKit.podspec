Pod::Spec.new do |s|
    s.name             = "QuickWebKit"
    s.version          = "1.0.0"
    s.summary          = "A great & strong plugin based WebViewController. 一款基于插件的 WebView 视图控制器，您可以基于它设计您的浏览器插件，然后像积木一样来组装它们。"
    s.description      = <<-DESC
    A great & strong plugin based WebViewController. 一款基于插件的 WebView 视图控制器，您可以基于它设计您的浏览器插件，然后像积木一样来组装它们。
    DESC
    s.homepage         = "http://www.lessney.com"
    s.license          = 'MIT'
    s.author           = {"pcjbird" => "pcjbird@hotmail.com"}
    s.source           = {:git => "https://github.com/pcjbird/QuickWebViewController.git", :tag => s.version.to_s}
    s.social_media_url = 'https://github.com/pcjbird/QuickWebViewController'
    s.requires_arc     = true
#s.documentation_url = ''
#s.screenshot       = ''

    s.platform         = :ios, '8.0'
    s.frameworks       = 'Foundation', 'UIKit', 'CoreGraphics', 'WebKit', 'JavaScriptCore' ,'QuartzCore'
#s.preserve_paths   = ''
    s.source_files     = 'QuickWebKit/QuickWebKit.h'

    s.dependency 'SmartJSWebView'

    s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }

    s.subspec 'QuickWebViewController' do |ss|
        ss.source_files = 'QuickWebKit/QuickWebKit.h', 'QuickWebKit/QuickWebKitDefines', 'QuickWebKit/QuickWebUtil', 'QuickWebKit/QuickWebCore'
        ss.public_header_files = 'QuickWebKit/QuickWebKit.h', 'QuickWebKit/QuickWebCore/*.{h}'
        ss.resource_bundles = {
            'QuickWebKit' => ['QuickWebResources/QuickWebViewControllerResource/*.*'],
        }
    end

    s.subspec 'QuickWebToastPlugin' do |ss|
        ss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebToastPlugin'
        ss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebToastPlugin/*.{h}'
        ss.dependency 'QuickWebKit/QuickWebViewController'
        ss.dependency 'Toast'
    end

    s.subspec 'QuickWebProviderPlugin' do |ss|
        ss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebProviderPlugin'
        ss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebProviderPlugin/QuickWebProviderPlugin.h'
        ss.dependency 'QuickWebKit/QuickWebViewController'
        ss.resource_bundles = {
        'QuickWebProviderPlugin' => ['QuickWebResources/QuickWebProviderPluginResource/*.*'],
        }
    end

    s.subspec 'QuickWebJSBridgePlugin' do |ss|
        ss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin'
        ss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/*.{h}'
        ss.dependency 'QuickWebKit/QuickWebViewController'
        ss.dependency 'Toast'
        ss.resource_bundles = {
            'QuickWebJSBridgePlugin' => ['QuickWebResources/QuickWebJSBridgePluginResource/*.*'],
        }

        ss.subspec 'QuickWebJSBridgeSystemProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeSystemProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeSystemProxy.{h}'
            sss.dependency 'QuickWebKit/QuickWebViewController'
        end

        ss.subspec 'QuickWebJSBridgeAccountProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeAccountProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeAccountProxy.{h}'
            sss.dependency 'QuickWebKit/QuickWebViewController'
        end

        ss.subspec 'QuickWebJSBridgeContactProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeContactProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeContactProxy.{h}'
            sss.frameworks = 'AddressBookUI', 'AddressBook', 'ContactsUI'
            sss.dependency 'QuickWebKit/QuickWebViewController'
        end

        ss.subspec 'QuickWebJSBridgeNavBarProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeNavBarProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeNavBarProxy.{h}'
            sss.dependency 'QuickWebKit/QuickWebViewController'
        end

        ss.subspec 'QuickWebJSBridgeShareProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeShareProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/CoreProxies/QuickWebJSBridgeShareProxy.{h}'
            sss.dependency 'QuickWebKit/QuickWebViewController'
        end

        ss.subspec 'QuickWebJSBridgeImagePlayProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/ExtProxies/QuickWebJSBridgeImagePlayProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/ExtProxies/QuickWebJSBridgeImagePlayProxy.{h}'
            sss.dependency 'QuickWebKit/QuickWebViewController'
            sss.dependency 'IDMPhotoBrowser'
        end

        ss.subspec 'QuickWebJSBridgeVideoPlayProxy' do |sss|
            sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/ExtProxies/QuickWebJSBridgeVideoPlayProxy.{h,m}'
            sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/ExtProxies/QuickWebJSBridgeVideoPlayProxy.{h}'
            sss.dependency 'QuickWebKit/QuickWebViewController'
            sss.dependency 'ZFPlayer'
        end

        ss.subspec 'QuickWebJSBridgePushMessageProxy' do |sss|
        sss.source_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/ExtProxies/QuickWebJSBridgePushMessageProxy.{h,m}'
        sss.public_header_files = 'QuickWebKit/QuickWebPlugins/QuickWebJSBridgePlugin/Proxies/ExtProxies/QuickWebJSBridgePushMessageProxy.{h}'
        sss.dependency 'QuickWebKit/QuickWebViewController'
        end
    end

end