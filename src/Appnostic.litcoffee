# Appnostic
-----

Appnostic generates cross platform webapps from your existing web app project
files.

Import some libs

    fs = require 'fs'
    path = require 'path'
    mkdirp = require 'mkdirp'
    manifest = require './Manifest'

## Appnostic
-----

The main Appnostic class.

    class Appnostic


## constructor
-----

Takes an appnostic.json manifest file as an argument.

      constructor: (pkg)->
        @pkg = pkg
        @M = new manifest
        @compile_apps()

## compile_apps
-----

Compile apps according to settings in manifest file.

      compile_apps: ()->
        for app in @pkg.appnostic.apps
          if app is 'chrome'
            @compile_chrome()

## compile_chrome
-----

Compile chrome app.

      compile_chrome: ()->
        @init_app_dist 'chrome'

## init_app_dist
-----

Initialize an app distro.

      init_app_dist: ( appName )->
        @create_dir appName
        @create_dist_manifest appName

## create_dir
-----

Create app directory.

      create_dir: ( appName )->
        mkdirp path.join(@pkg.appnostic.dist, appName), (err)->
          if err then console.log err


## create_dist_manifest
-----

Create the distributed app manifest file.

      create_dist_manifest: ( appName )->
        @M.buildCompiledManifest appName, @pkg

## Export the module
-----

    module.exports = Appnostic