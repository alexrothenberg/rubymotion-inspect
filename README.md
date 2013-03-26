# RubyMotion Inspect

## What is it?

*RubyMotion Inspect* is the official app for the RubyMotion Inspect annual
conference.

## Getting started

Obviously you will need a working copy of [RubyMotion](http://rubymotion.com)
(1.34 at the time of writing this) and Xcode with command-line tools installed.
You'll also need to setup [Cocoapods](http://cocoapods.org/) and Bundler on
your machine.

Once you have all this, simply run `bundle` the first time then `rake` to build
and launch the simulator (see RubyMotion docs for more informations).

## Testing with motion-calabash

Calabash-RubyMotion Sample from Inspect2013 conference

To try

    gem install motion-calabash
    rake build

Run acceptance tests

    rake calabash:run

(make sure the iOS Simulator isn't hidden behind some other window).

To run on a USB-connected device, make sure the device is enabled for development, and you have an appropriate provisioning profile. For example, I have

    Motion::Project::App.setup do |app|
      app.name = 'Beers'
      app.frameworks += ['CoreLocation', 'MapKit', 'AddressBook']
      app.codesign_certificate = "iPhone Developer: Karl Krukow (6GF49ATP5N)"
      app.deployment_target = "5.0"
      app.provisioning_profile="/Users/krukow/ios_profiles/6EFC102C-1911-48B2-B0AF-5DB3923210E3.mobileprovision"
    end

Then run

    rake calabash:run device

Be sure to check out the documentation for [motion-calabash](https://github.com/calabash/motion-calabash).


## Authors

### Hugues Lismonde

* http://epic.net
* http://twitter.com/hlidotbe
* http://github.com/hlidotbe

### Laurent Sansonetti

* http://hipbyte.com
* http://twitter.com/lrz
* http://github.com/lrz

## Contributing

Fork, Clone, Commit, Push, Pull-Request

## License

See LICENSE
