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
paths = require 'paths'

require 'coffee-script/register'

paths = {
  dist:
    root: path.join 'dist'
  assets:
    root: path.join 'src'
}

gulp.task 'lint_check', ()->
  return gulp.src(
    path.join paths.assets.root, '*.coffee'
  ).pipe(
    coffeelint()
  ).pipe(
    coffeelint.reporter 'fail'
  )

gulp.task 'compile_coffee', ['lint_check'], ()->
  gulp.src(
    path.join paths.assets.root, 'Appnostic.coffee'
  ).pipe(
    coffee()
  ).pipe(
    uglify()
  ).pipe(
    gulp.dest path.join paths.dist.root, 'appnostic.min.js'
  )

gulp.task 'build', ()->
  runSequence(
    'compile_coffee'
  )

gulp.task 'deafult', ['build']