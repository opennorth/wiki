# Open North

[![Dependency Status](https://gemnasium.com/opennorth/opennorth.ca.png)](https://gemnasium.com/opennorth/opennorth.ca)

The HTML, CSS and JS code for [opennorth.ca](http://opennorth.ca) and its [blog](http://blog.opennorth.ca).

## Structure

The [Jekyll wiki](https://github.com/mojombo/jekyll/wiki) has more information on the meaning of the special underscore files and directories.

    _includes/   shared templates
    _layouts/    page layouts
    _plugins/    HAML and SASS converters
    posterous/   Posterous custom themes
    snippets/    miscellaneous code snippets
    _config.yml  Jekyll configuration file

## Development

After installing dependencies with `bundle`, run `jekyll` to generate the HTML into a `_site` directory. To view the site, run `jekyll --server` and follow the instructions.

### Posterous

Posterous doesn't allow conditional HTML classes, and deletes `placeholder` and `required` attributes. `DOCTYPE` must be all-caps.

## Deployment

If you have a user account on the production server, just `git push deploy`.

### One-time setup

To deploy the site through a Git post-receive hook ([as documented by Jekyll](https://github.com/mojombo/jekyll/wiki/Deployment)), become the `deployer` user on the server and run:

```bash
mkdir opennorth.ca.git opennorth.ca
cd opennorth.ca.git
git --bare init
cp hooks/post-receive.sample hooks/post-receive
echo "TMP_GIT_CLONE=\$HOME/tmp/opennorth.ca
git clone \$HOME/opennorth.ca.git \$TMP_GIT_CLONE
jekyll --no-auto \$TMP_GIT_CLONE \$HOME/opennorth.ca
rm -Rf \$TMP_GIT_CLONE
cp -f \$HOME/opennorth.ca/en/* /srv/www/opennorth.ca/public
cp -f \$HOME/opennorth.ca/fr/* /srv/www/nordouvert.ca/public
cp -rf \$HOME/opennorth.ca/!(en|fr) /srv/www/opennorth.ca/public
cp -rf \$HOME/opennorth.ca/!(en|fr) /srv/www/nordouvert.ca/public" >> hooks/post-receive
```

Locally, add a remote repository:

    git remote add deploy deployer@opennorth.ca:~/opennorth.ca.git
