# Frontend Helpers #

HARD DEPENDENCY: HAML & SASS
I do plan on making it work for both ERB & HAML but currently all my projects use both, so I haven't found the time to add this option.

This is a collection of Rails 3.1 Helpers that I have compiled together into one nice neat special little gem... it'll handle doing things such as a few HTML5 helpers, Meta tag creation, Facebook Open Graph Tag Creation, javascript integration for, Google Analytics, Chartbeat, Inspectlet, Mixpanel, Woopra, Kissmetrics, Quantcast, and Olark, as well I've packaged in a few of my favorite/most used javascript libraries for building amazing web apps, and last but not least, added a great `reset.css.sass` file that goes really nicely with my `variables.css.sass` file, for a basic clean view.

Try it on your next project, I'm sure you'll like it.

## Getting Started ##

First in your Rails 3.1 Project start by adding this to your Gemfile:

    gem "frontend-helpers"

Then run `bundle install` to install the gem from RubyGems

## Next Steps ##

If you plan on using the gem for the Rails Helpers, keep reading if you'd only like to use it for the access to the javascript assets & css assets you can skip ahead...

Anyways for the helpers your going to need to generate a few files first to do so run:

    $ rails g frontend:install

This should come up and tell you that it's copying `config/settings.yml`, `config/services.yml` & `app/assets/stylesheets/variables.css.sass`

Then you can start editing them:


### HTML5 ###

before you use the HTML5 HTML tag as Paul Irish wrote for the HTML5 Boilerplate `application_controller.rb` add:

    include FrontendHelpers::Html5Helper

Then in your application.html.haml instead of using `%html` use

    - html_tag class: 'no-js' do


### Settings.yml ###

Before you start adding your content to the `settings.yml` you should probably start by including the helper in your `application_controller.rb` add:

    include FrontendHelpers::MetatagHelper

Next where ever you want the metatags to appear use:

    - meta_tags

In the `settings.yml` you'll find a list of tags that can be filled out with your applications information all of these tags will get replicated into meta tags, if you choose not to use one you can either leave it blank or remove it.

Of course just because they are set in this file does not mean you can't change them per page this is how you would do that....

Say for instance you set the key `title`

    :title: "Chris Hein's Site"

And on the homepage you liked that, but maybe on the about page you would like it to say `About Chris Hein` with this plugin that's really simple, in your action for your about page simple add an instance variable as so:

    @meta_title = "About Chris Hein"

This will overwrite the current title with whatever you'd like. This is the list of available tags and how to overwrite them:

    title: @meta_title,
    keywords: @meta_keywords,
    description: @meta_description,
    author: @meta_author,
    email: @meta_email,
    copyright: @meta_copyright,
    generator: @meta_generator,
    rating: @meta_rating,
    language: @meta_language,
    distribution: @meta_distribution,
    robots: @robots,
    :"fb:app_id" => @meta_fb_app_id,
    :"og:title" => @meta_og_title,
    :"og:description" => @meta_og_description,
    :"og:url" => request.url,
    :"og:site_name" => @meta_og_site_name,
    :"og:type" => @meta_og_type,
    :"og:image" => @meta_og_image,
    :"og:locality" => @meta_og_locality,
    :"og:region" => @meta_og_region,
    :"og:country_name" => @meta_og_country_name,
    :"og:phone_number" => @meta_og_phone_number


### Services.yml ###

Before you start adding your content to the `services.yml` you should probably start by including the helper in your `application_controller.rb` add:

    include FrontendHelpers::ServicesHelper

Next where ever you want the services javascript to appear (I'd recommend using it at the end of the body) use:

    - webservice [:google, :olark, :chartbeat, :inspectlet, :mixpanel, :woopra, :kissmetrics, :quantcast]

This example shows all of the services that can be included although you will not see any of them unless you have added the necessary information in the `services.yml` you can remove any of them from the array if need be.

Inside the `services.yml` you will find all of variables that should be set to use each one of the services. All of them are pretty self explanatory and the keys can be gotten from each service.


### Assets ###

As far as the assets I've added a few of my favorite and most used javascript libraries, those are:

#### CHANGED!!! ####

I've removed backbone from this repo, in favor of using the [backbone-rails gem](https://github.com/codebrew/backbone-rails) it gives you really nice generators and a few other really nice things.

* [jQuery Fancybox](http://fancybox.net)
* [DD Belated PNG](http://www.dillerdesign.com/experiment/DD_belatedPNG/)
* [jQuery Asynchronous Plugin](http://mess.genezys.net/jquery/jquery.async.php)
* [jQuery Cookie plugin](https://github.com/carhartl/jquery-cookie)
* [jQuery Easing plugin](http://gsgd.co.uk/sandbox/jquery/easing/)
* [jQuery Lifestream](https://github.com/christianv/jquery-lifestream)
* [jQuery Slides plugin](http://slidesjs.com)
* [jQuery Tablesorter plugin](http://tablesorter.com)
* [jQuery Validation](http://bassistance.de/jquery-plugins/jquery-plugin-validation/)
* [Log Helper](http://html5boilerplate.com)
* [Modernizr](http://www.modernizr.com/)
* [Shortcut JS](http://www.openjs.com/scripts/events/keyboard_shortcuts/)
* [SWF Object](http://code.google.com/p/swfobject/)
* [Tempo](http://tempojs.com/)

All of these can be added to your manifest file for Sprockets like this

    //= require fancybox
    //= require ie
    //= require jquery.async
    //= require jquery.cookie
    //= require jquery.easing
    //= require jquery.lifestream
    //= require jquery.slides
    //= require jquery.tablesorter
    //= require jquery.validate
    //= require log
    //= require modernizr
    //= require shortcut
    //= require swfobject
    //= require tempo

Not only did I add a bunch of wonderfully awesome javascript libs I also added a css reset that can be used, as well as a base variables... Although with sprockets currently you cannot include files with persistent variables, so I would highly recommend using SASS's built in `@import` to include files to do so include both files like so rename `application.css` to `application.css.sass` then add:

    @import "variables.css.sass"
    @import "reset.css.sass"
    @import "fancybox.css.scss"


### Email Template ###

I've done my fair share of email template work... and I know it's not fun, but I have to say Sean Powell has done a great job compiling a great starting platform for constructing your HTML emails, so I've taken his code and added it as a base layout call `email.html.haml` so you can just include it when you are sending off you emails using `layout: "email"`

* [HTML Email Boilerplate](http://htmlemailboilerplate.com/)
* [HTML Email Boilerplate Github](https://github.com/seanpowell/Email-Boilerplate)


## Thanks ##

I hope you enjoy using this Rubygem, if you have any questions, issues, or feature requests please make them in the issues section, I'll be continually adding to this so please keep checking in on the progress.


## Contributing to Frontend Helpers ##

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright ##

Copyright (c) 2011 Christopher Hein. See LICENSE.txt for
further details.

All javascript libraries are still copyrighted to their respective owners, this is just a way to easy add them to any project without having to deal with the files themselves.
