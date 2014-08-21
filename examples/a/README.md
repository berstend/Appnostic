# Appnostic Example A
-----

Demonstrates building Chrome and FireFox *Hello, World* apps with Appnostic from code.

**Example**
  
    var appnostic = require('appnostic');
    var pkg = require(path.join(__dirname, 'package.json'));

    pkg['appnostic'] = {
      "apps":[
        "chrome",
        "firefox"
      ],
      "html":"/tmp/html",
      "css":"/tmp/css",
      "js":"/tmp/js"
      "dist":"/dist"
    }

    appnostic.compile(pkg);