# bootstrap.stylus (v2.2.2)

Twitter's [Bootstrap](https://github.com/twitter/bootstrap) for [Stylus](https://github.com/learnboost/stylus).


## Installation

Bootstrap uses [nib](https://github.com/visionmedia/nib) for transparent CSS3 support and helpful mixins, but you simply need to `.use()` `bootstrap`, which in turn exposes `@import "bootstrap"`.

```js
var stylus = require('stylus')
  , bootstrap = require('bootstrap')
  , fs = require('fs');

var styl = fs.readFileSync(__dirname + '/example.styl', 'utf8');

var css = stylus(styl)
  .use(bootstrap())
  .set('filename', 'example.styl')
  .set('compress', true)
  .render(function(err, css){
    if (err) throw err;
    console.log(css);
  });
```

Then you can __@import__ all or portions of the library:

## Versioning

For transparency and insight into our release cycle, and for striving to maintain backward compatibility, Bootstrap will be maintained under the Semantic Versioning guidelines as much as possible.

Releases will be numbered with the following format:

`<major>.<minor>.<patch>`

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor and patch)
* New additions without breaking backward compatibility bumps the minor (and resets the patch)
* Bug fixes and misc changes bumps the patch

For more information on SemVer, please visit http://semver.org/.

## Developers

We have included a makefile with convenience methods for working with the Bootstrap library.

+ **dependencies**
Our makefile depends on you having recess, connect, uglify.js, and jshint installed. To install, just run the following command in npm:

```
$ npm install recess connect uglify-js jshint -g
```

+ **build** - `make`
Runs the recess compiler to rebuild the `/less` files and compiles the docs pages. Requires recess and uglify-js. <a href="http://twitter.github.com/bootstrap/extend.html#compiling">Read more in our docs &raquo;</a>

+ **watch** - `make watch`
This is a convenience method for watching just Less files and automatically building them whenever you save. Requires the Watchr gem.


```css
// everything
@import 'bootstrap'

// only config and forms
@import 'bootstrap/config'
@import 'bootstrap/forms'
```
## Contributing

Please submit all pull requests against `*-wip` branches. If your pull request contains JavaScript patches or features, you must include relevant unit tests. All HTML and CSS should conform to the [Code Guide](http://github.com/mdo/code-guide), maintained by [Mark Otto](http://github.com/mdo).

Thanks!



## Authors

**Mark Otto**

+ http://twitter.com/mdo
+ http://github.com/mdo

**Jacob Thornton**

## Configuration

You can variables before the configuration is __@import__ed:

```css
radius = 5px
@import 'bootstrap'
```

Copyright and License
---------------------

Copyright 2011 Twitter, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
