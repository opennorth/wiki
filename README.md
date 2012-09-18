# Open North

[![Dependency Status](https://gemnasium.com/opennorth/opennorth.ca.png)](https://gemnasium.com/opennorth/opennorth.ca)

The HTML, CSS and JS code for [opennorth.ca](http://opennorth.ca), [nordouvert.ca](http://nordouvert.ca), [blog.opennorth.ca](http://blog.opennorth.ca) and [blog.nordouvert.ca](http://blog.nordouvert.ca).

## Getting Started

You will need Ruby via [RVM](https://rvm.io/). Run `bundle` to install dependencies.

    curl -L https://get.rvm.io | bash -s stable --ruby
    gem install bundler
    git clone git@github.com:opennorth/opennorth.ca.git
    cd opennorth.ca
    bundle

## Usage

### Work on a web site

Run `bundle exec rake server[opennorth.ca]` to view your copy of [opennorth.ca](http://opennorth.ca) in a browser. This command compiles HTML files into the `_site` directory. **Git won't track those files.** Make your changes in the `opennorth.ca` directory instead. This command also copies assets (CSS, JS, images) to the `opennorth.ca` directory. **Git won't track those files.** Make your changes in the top-level `assets` directory instead. If you make changes to files while the local server is running, refresh a page to see its latest version.

### Create a blog post

`rake post[blog.opennorth.ca,"My First Blog Post"]` creates a new blog post for [blog.opennorth.ca](http://blog.opennorth.ca) with the title `My First Blog Post`. Remember to set `author` to your name in the [YAML Front Matter](https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter). If you want to save a draft, add `published: false`. If you want to change the post's date, set a `date` variable. See the [HTML style guide](https://github.com/opennorth/opennorth.ca/wiki/HTML-style-guide) for instructions on what tags to use when. In general, prefer [Markdown syntax](http://daringfireball.net/projects/markdown/syntax) over raw HTML. 

### Deploy your changes

If you have a user account on the production server, just `git push deploy`.

## Structure

    _plugins/              Jekyll plugins and Liquid filters
    _site/                 compiled assets and HTML files
    assets/                icons and robots.txt
      css/                 CSS files
      img/                 image files
      js/                  JS files
      _config.yml          Jekyll configuration file
    bin/                   the custom jekyll script
    blog.opennorth.ca/     HTML files
      _includes/           shared templates
      _layouts/            page layouts
      _posts/              blog posts
    blogue.nordouvert.ca/
    opennorth.ca/
    nordouvert.ca/
    snippets/              miscellaneous code snippets

The [Jekyll wiki](https://github.com/mojombo/jekyll/wiki) has more information on the meaning of the special underscore files and directories in the `jekyll` directory.

## Troubleshooting

If Jekyll is not creating new files, do a local deploy and check for errors:

    rake deploy[opennorth.ca,_site/opennorth.ca]

If you see the error `zsh: no matches found: prepare[...]`, run:

    echo "alias bundle='noglob bundle'" >> ~/.zshrc
    echo "alias rake='noglob rake'" >> ~/.zshrc

Then restart your shell.

## Miscellaneous

`rake -T` lists all Rake tasks, including:

* `rake clean` removes all compiled and copied files
* `rake deploy` is used in deployment
* `rake prepare` is a utility task

The production environment uses clean URLs without the `.html` extension, so all internal links in the HTML files omit the `.html` extension. We use a custom `jekyll` script to enable clean URLs in the development environment.
