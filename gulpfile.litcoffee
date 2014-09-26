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
    jeditor = require 'gulp-json-editor'
    runSequence = require 'run-sequence'
    clean = require 'gulp-clean'
    license = require 'gulp-license'
    shell = require 'gulp-shell'
    pkg = require path.join __dirname, 'package.json'
    manifest = require './src/Manifest'

Define the paths.

    paths =
      manifests:
        root: path.join 'src', 'manifests'
      dist:
        root: path.join 'dist'
        manifests: path.join 'dist', 'manifests'
      assets:
        root: path.join 'src'

## Tasks
-----

These are the tasks available to gulp.

### default
-----

Calls `build`

    gulp.task 'default', ['build']

### build
-----

Build Appnostic.

    gulp.task 'build', ['compile_coffee']

### compile_coffee
-----

Run `lint_check` then compile coffeescript into js files.

    gulp.task 'compile_coffee', ['lint_check'], ()->
      gulp.src path.join paths.assets.root, '*coffee'
      .pipe coffee()
      .pipe uglify()
      .pipe gulp.dest path.join paths.dist.root

### lint_check
-----

Performs lint check on coffeescript files.

    gulp.task 'lint_check', ()->
      return gulp.src path.join paths.assets.root, '**', '*coffee'
      .pipe coffeelint()
      .pipe coffeelint.reporter 'fail'

## Demo tasks
-----

### build_demo
-----

Build demo app.

Runs deafult gulp task found in
[demo gulpfile.](examples/a/HelloWorld/gulpfile.litcoffee)

    gulp.task 'build_demo', ()->
      gulp.src path.join(__dirname, 'examples', 'a', 'HelloWorld'), {read:false}
      .pipe shell [ 'cd <%= file.path %>; gulp' ]