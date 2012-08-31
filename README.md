# Open North

[![Dependency Status](https://gemnasium.com/opennorth/opennorth.ca.png)](https://gemnasium.com/opennorth/opennorth.ca)

The HTML, CSS and JS code for [opennorth.ca](http://opennorth.ca) and [nordouvert.ca](http://nordouvert.ca) and the Posterous themes for [blog.opennorth.ca](http://blog.opennorth.ca) and [blog.nordouvert.ca](http://blog.nordouvert.ca).

## Structure

    _plugins/       Jekyll plugins
    _site/          compiled assets and HTML files
    assets/         icons and robots.txt
      css/          CSS files
      img/          image files
      js/           JS files
    bin/            the custom jekyll script
    jekyll/         Jekyll files
      _config.yml   configuration file
      _includes/    shared templates
      _layouts/     page layouts
    opennorth.ca/   HTML files (English)
    nordouvert.ca/  HTML files (French)
    posterous/      Posterous custom themes
    snippets/       miscellaneous code snippets

The [Jekyll wiki](https://github.com/mojombo/jekyll/wiki) has more information on the meaning of the special underscore files and directories in the `jekyll` directory.

## Development

You will need Ruby via [RVM](https://rvm.io/). Run `gem install bundler` and `bundle` to install dependencies.

### Rake tasks

Usually, you will run `bundle exec rake server[opennorth.ca]` or `bundle exec rake server[nordouvert.ca]` so that you can view the site in a browser. If you make changes to HTML files while the server is running, refresh a page to see its latest version. Note that these two Rake tasks copy assets and Jekyll files to the `opennorth.ca` and `nordouvert.ca` directories. **Git won't track these files.** Make your changes in the `assets` and `jekyll` directories.

The production environment uses clean URLs without the `.html` extension, so all internal links in the HTML files omit the `.html` extension. We use a custom `jekyll` script to enable clean URLs in the development environment.

`rake clean` removes ignored files, which include the `_site` directory and the assets and Jekyll files copied to the `opennorth.ca` and `nordouvert.ca` directories. `rake deploy` is used in deployment, and `rake prepare` is a utility task.

`rake -T` lists all Rake tasks.

### Posterous themes

Posterous doesn't allow conditional HTML classes, and deletes `placeholder` and `required` attributes. `DOCTYPE` must be all-caps.

### Troubleshooting

If you see the error `zsh: no matches found: prepare[...]`, run:

    echo "alias bundle='noglob bundle'" >> ~/.zshrc
    echo "alias rake='noglob rake'" >> ~/.zshrc

Then restart your shell.

## Deployment

If you have a user account on the production server, just `git push deploy`.

### One-time setup

To deploy the site through a Git post-receive hook ([as documented by Jekyll](https://github.com/mojombo/jekyll/wiki/Deployment)), first install the prerequisites for RVM on the server:

    sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

Then, become the `deployer` user and run:

```bash
curl -L https://get.rvm.io | bash -s stable --ruby
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
mkdir opennorth.ca.git opennorth.ca
cd opennorth.ca.git
git --bare init
cp hooks/post-receive.sample hooks/post-receive
```

Change the first line of `hooks/post-receive` to `#!/bin/bash` and add the lines:

```bash
PATH=$PATH:$HOME/.rvm/bin
TMP_GIT_CLONE=$HOME/tmp/opennorth.ca
git clone $HOME/opennorth.ca.git $TMP_GIT_CLONE
cd $TMP_GIT_CLONE
source $HOME/.rvm/scripts/rvm
bundle
bundle exec rake deploy[opennorth.ca,/srv/www/opennorth.ca/public]
bundle exec rake deploy[nordouvert.ca,/srv/www/nordouvert.ca/public]
rm -Rf $TMP_GIT_CLONE
```

Locally, add a remote repository:

    git remote add deploy deployer@opennorth.ca:~/opennorth.ca.git

Now you can:

    git push deploy master
