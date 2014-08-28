# Manifest
-----
Manifest is responsible for building the Manifest Template files found within
`src/manifests`

Get all required libs.

    fs = require 'fs'
    path = require 'path'
    js2xmlparser = require 'js2xmlparser'
    pkg = require path.join __dirname, '..', 'package.json'
    manifests = require './manifests'
    require 'coffee-script/register'

## Manifest class
-----


The main Manifest class.

    class Manifest

Number of spaces to use in json manifest templates.

      manifestSpacing = 2
      baseData = {}

## buildAllManifests
-----

Loop through all manifests found in manifests/index.coffee.md and generate
manifest template files.

      buildAllManifests: (translate, callback)->
        for m in manifests
          @buildCompiledManifest m.name, translate, callback

## buildCompiledManifest
-----

      buildCompiledManifest: (appName, baseData, callback)->
        @baseData = baseData
        @saveManifest manifests[appName], callback

## saveManifest
-----

Generate an individual manifest template file. Called from `buildAllManifests`

      saveManifest: (man, callback)->
        fileName = path.join(
          'dist'
          man.name
          man.name + '.manifest.' + man.output
        )

        data = @transformData @generateData(man), man

        fs.writeFile fileName, data, (err)->
          if err
            throw err
          else if callback
            callback man

## generateData
-----

Generates data according to requested format.

      generateData: (man)->

If requested output is json, stringify the data.

        if man.output == 'json'
          return JSON.stringify(man.fields, (k, v)=>
            if @baseData[k] then return @baseData[k] else return v
          , 2)

If requested output is xml, convert data to xml.

        else if man.output == 'xml'
          return js2xmlparser 'Package', man.fields

## transformData
-----

Replaces keys in json string with transform value found in manfiests data.

      transformData: (jsonString, man)->
        if man.transform
          for k,v of man.transform
            jsonString = jsonString.replace k, v
        return jsonString

## Export the module
-----

    module.exports = Manifest