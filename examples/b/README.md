# Appnostic Example B
-----

Demonstrates building Chrome and FireFox *Hello, World* apps with Appnostic using Gulp.

**Example**

    var appnostic = require('gulp-appnostic');
    
    gulp.task 'appnostic', function() {
      appnostic().pipe(
        gulp.dest(
          "/dist"
        );
      );
    }