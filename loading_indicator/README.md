# LoadingIndicator

simple UIActivityIndicatorView wrapper for RubyMotion

## Usage

````ruby
def your_loading_action

  @indicator = LoadingIndicator.new ViewController # self or UIViewController, etc
  @indicator.start
  your.async_method do
    @indicator.stop

    # ....
  end
end
````
