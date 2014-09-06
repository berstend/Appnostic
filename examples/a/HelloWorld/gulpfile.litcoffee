# Gulpfile
-----

Instructions for Gulp.

## Setup
-----

Allow this file to run.
   
    require 'coffee-script/register'

Require some libs.

    fs = require 'fs'
    gulp = require 'gulp'
    path = require 'path'
    coffee = require 'gulp-coffee'
    coffeelint = require 'gulp-coffeelint'
    less = require 'gulp-less'
    uglify = require 'gulp-uglify'
    minifyCSS = require 'gulp-minify-css'
    rename = require 'gulp-rename'
    runSequence = require 'run-sequence'
    appnostic = require 'Appnostic'
    pkg = require path.join __dirname, 'package.json'

Define the paths.

    paths =
      assets:
        coffee: path.join 'assets', 'coffee'
        less: path.join 'assets', 'less'
        html: path.join 'assets', 'html'
        images: path.join 'assets', 'images'
      dist:
        js: path.join 'dist', 'js'
        css: path.join 'dist', 'css'
        html: path.join 'dist', 'html'
        images: path.join 'dist', 'images'

## Tasks
-----

### default
-----

Compile.

    gulp.task 'default', ['compile']


### compile
-----

    gulp.task 'compile', ()->
      runSequence [
        'compile_coffee'
        'compile_less'
        'copy_templates'
        'copy_images'
        'appnostic'
      ]

### appnostic
-----

Compile specified apps.

    gulp.task 'appnostic', ()->
      a = new appnostic pkg

### lint_check
-----

Performs lint check on coffeescript files.

    gulp.task 'lint_check', ()->
      return gulp.src(
        path.join paths.assets.coffee, '**', '*coffee'
      ).pipe(
        coffeelint()
      ).pipe(
        coffeelint.reporter 'fail'
      )

### compile_coffee
-----

Run `lint_check` then compile coffeescript into js files.

    gulp.task 'compile_coffee', ['lint_check'], ()->
      gulp.src(
        path.join paths.assets.coffee, '*coffee'
      ).pipe(
        coffee()
      ).pipe(
        uglify()
      ).pipe(
        gulp.dest paths.dist.js
      )

### compile_less
-----

Compile less files.

    gulp.task 'compile_less', () ->
      return gulp.src(
        path.join paths.assets.less, '*.less'
      ).pipe(
        less()
      ).pipe(
        minifyCSS()
      ).pipe(
        rename 'helloworld.min.css'
      ).pipe(
        gulp.dest paths.dist.css
      )

### copy_templates
-----

Copy templates.

    gulp.task 'copy_templates', ()->
      # Copy index file
      return gulp.src(
        path.join paths.assets.html, '*.html'
      ).pipe(
        gulp.dest paths.dist.html
      )

### copy_images
-----

Copy images.

    gulp.task 'copy_images', ()->
      # Copy index file
      return gulp.src(
        path.join paths.assets.images, '*'
      ).pipe(
        gulp.dest paths.dist.images
      )