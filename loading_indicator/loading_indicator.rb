class LoadingIndicator

  def initialize target
    @target = target
  end

  def start
    create_indicator

    @indicator.startAnimating
  end

  def stop
    @indicator.stopAnimating
    @indicator.removeFromSuperview
    @view.removeFromSuperview
    @indicator = nil
    @view = nil
  end

  def create_indicator
    @view = UIView.alloc.initWithFrame @target.view.frame
    @view.backgroundColor = UIColor.blackColor
    @view.alpha = 0.5

    @indicator = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle UIActivityIndicatorViewStyleWhiteLarge
    @indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite
    @indicator.setCenter CGPointMake(@view.bounds.size.width / 2, @view.bounds.size.height / 2)

    @view.addSubview @indicator
    @target.view.addSubview @view
  end
  private :create_indicator

end
