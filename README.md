# Open North

[![Dependency Status](https://gemnasium.com/opennorth/opennorth.ca.png)](https://gemnasium.com/opennorth/opennorth.ca)

This repository contains the HTML, CSS and JS code for [opennorth.ca](http://opennorth.ca), [nordouvert.ca](http://nordouvert.ca), [blog.opennorth.ca](http://blog.opennorth.ca) and [blog.nordouvert.ca](http://blog.nordouvert.ca).

## Getting Started

If you don't already have Ruby via [RVM](https://rvm.io/) with [Bundler](http://gembundler.com/):

    curl -L https://get.rvm.io | bash -s stable --ruby
    gem install bundler

Then:

    git clone git@github.com:opennorth/opennorth.ca.git
    cd opennorth.ca
    git remote add deploy deployer@opennorth.ca:~/opennorth.ca.git
    bundle

## Usage

For all the commands below, replace `opennorth.ca` with the web site you want to work on, i.e. `nordouvert.ca`, `blog.opennorth.ca` or `blogue.nordouvert.ca`.

### Work on a web site

Run `bundle exec rake server[opennorth.ca]` and open [0.0.0.0:4000](http://0.0.0.0:4000) in a browser to view your copy of opennorth.ca. This command compiles HTML files into the `_site` directory. **Git won't track those files.** Make your changes in the `opennorth.ca` directory instead. This command also copies assets (CSS, JS, images) to the `opennorth.ca` directory. **Git won't track those files.** Make your changes in the top-level `assets` directory instead. If you make changes to files while the local server is running, refresh a page to see its latest version.

### Create a blog post

In general, you will write the blog post in Google Docs, so that others can collaborate and translate easily.

Once you're ready to publish, `rake post[blog.opennorth.ca,"My First Blog Post"]` creates a new blog post for [blog.opennorth.ca](http://blog.opennorth.ca) with the title "My First Blog Post". Remember to set `author` to your name in the header of the file, also known as [YAML Front Matter](https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter). If you want to save an unpublished draft, add `published: false`. If you want to change the post's date, set a `date` variable; otherwise, the date on which the file was created will be used.

In general, prefer [Markdown syntax](http://daringfireball.net/projects/markdown/syntax) over raw HTML. You may want to [practice or test your Markdown](http://daringfireball.net/projects/markdown/dingus). If you must use HTML, see the [HTML style guide](https://github.com/opennorth/opennorth.ca/wiki/HTML-style-guide) for instructions on what tags to use when. 

### Add an image

If you want to add an image `test.png` for a blog post:

1. Open the image in Adobe Photoshop.
1. Resize the image using Image > Image Size... (⌥⌘I) to be a maximum of 700 pixels wide. "Contrain Proportions" and "Resample Image" should be checked. In general, using the default "Bicubic" compression gives the best results.
1. Save the image with File > Save for Web & Devices... (⌥⇧⌘S). If the image is a photo, use the "JPEG Medium" (Quality 30) or "JPEG High" (Quality 60) presets. Only "Optimized" and "Convert to sRGB" should be checked. For simple graphics, you may use PNG or GIF formats. In all cases, set "Metadata" to "None".
1. Put the optimized image in `assets/img/blog`.
1. Add the optimized image to the blog post with `<img src="/img/blog/test.jpg" width="700" height="350" alt="Visually impaired readers will hear this text in place of the image" title="Optional text that will display in a tooltip">`.

### Delete a blog post

Delete the file in the `_posts` directory and deploy your changes.

### Deploy your changes

If your SSH key is authorized on the production server, just `git push deploy`.

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
    nordouvert.ca/
    opennorth.ca/
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
