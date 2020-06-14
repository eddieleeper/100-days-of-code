
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.new
    @window.frame = UIScreen.mainScreen.bounds

    tab_bar = UITabBarController.new
    tab_bar.viewControllers = [MapController.new, LocationController.new]
    tab_bar.selectedIndex = 0
    ui_navigation_controller = UINavigationController.new
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tab_bar)
    @window.rootViewController.wantsFullScreenLayout = true

    @window.makeKeyAndVisible
    true
  end
end
