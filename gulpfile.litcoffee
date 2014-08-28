# Gulpfile
-----

Instructions for Gulp.

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
    pkg = require path.join __dirname, 'package.json'
    require 'coffee-script/register'
    manifest = require './src/Manifest'

Set up some paths

    paths =
      manifests:
        root: path.join 'src', 'manifests'
      dist:
        root: path.join 'dist'
        manifests: path.join 'dist', 'manifests'
      assets:
        root: path.join 'src'

## lint_check
-----

Performs lint check on coffeescript files.

    gulp.task 'lint_check', ()->
      return gulp.src(
        path.join paths.assets.root, '**', '*coffee'
      ).pipe(
        coffeelint()
      ).pipe(
        coffeelint.reporter 'fail'
      )

## compile_coffee
-----

Run `lint_check` then compile coffeescript into js files.

    gulp.task 'compile_coffee', ['lint_check'], ()->
      gulp.src(
        path.join paths.assets.root, '*coffee'
      ).pipe(
        coffee()
      ).pipe(
        uglify()
      ).pipe(
        gulp.dest path.join paths.dist.root
      )


## build
-----

Run `build_manifests` then build Appnostic.

    gulp.task 'build', ()->
      runSequence(
        'clean_manifests'
        'build_manifests'
        'compile_coffee'
      )


## clean_manifests
-----

Remove the manifest templates

    gulp.task 'clean_manifests', ()->

Remove manifest files.

      return gulp.src(
        path.join(paths.manifests.root, '*.manifest.*'), {read:false}
      ).pipe clean()

## build_manifests
-----

Run `clean_manifests` then build the manifest templates

    gulp.task 'build_manifests', ()->
      m = new manifest
      m.buildAllManifests()

## default
-----

Calls `build`

    gulp.task 'default', ['build']