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

man = require './src/manifests'
manifest = require './src/Manifest'

# create rooth paths
paths =
  manifests:
    root: path.join 'src', 'manifests'
  dist:
    root: path.join 'dist'
  assets:
    root: path.join 'src'

gulp.task 'lint_check', ()->
  return gulp.src(
    path.join paths.assets.root, '**', '*.coffee.md'
  ).pipe(
    coffeelint()
  ).pipe(
    coffeelint.reporter 'fail'
  )

gulp.task 'compile_coffee', ['lint_check'], ()->
  gulp.src(
    path.join paths.assets.root, '*.coffee.md'
  ).pipe(
    coffee()
  ).pipe(
    uglify()
  ).pipe(
    gulp.dest path.join paths.dist.root
  )

# Build Appnostic
gulp.task 'build', ['build_manifests'], ()->
  runSequence(
    'compile_coffee'
  )

# Remove the manifest templates
gulp.task 'clean_manifests', ()->
  return gulp.src(
    path.join(paths.manifests.root, '*.json'), {read:false}
  ).pipe clean()

# Build the manifest templates
gulp.task 'build_manifests', ['clean_manifests'], ()->
  m = new manifest man
  m.buildAllManifests()

gulp.task 'default', ['build']