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
    minifyCSS = require 'gulp-minify-css'
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

Compile coffeescript into js files.

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

Build Appnostic.

    gulp.task 'build', ['build_manifests'], ()->
      runSequence(
        'compile_coffee'
      )

## clean_manifests
-----

Remove the manifest templates

    gulp.task 'clean_manifests', ()->

Remove json files.

      gulp.src(
        path.join(paths.manifests.root, '*.json'), {read:false}
      ).pipe clean()

Remove xml files.

      return gulp.src(
        path.join(paths.manifests.root, '*.xml'), {read:false}
      ).pipe clean()

## clean
-----

Remove /dist

    gulp.task 'clean', ['clean_manifests'], ()->
      gulp.src(
        path.join(paths.dist.root), {read:false}
      ).pipe clean()


## build_manifests
-----

Build the manifest templates

    gulp.task 'build_manifests', ['clean_manifests'], ()->
      m = new manifest
      m.buildAllManifests()

## default
-----

Calls `build`

    gulp.task 'default', ['build']