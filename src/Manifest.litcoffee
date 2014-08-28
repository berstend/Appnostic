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

## buildAllManifests
-----

Loop through all manifests found in manifests/index.coffee.md and generate
manifest template files.

      buildAllManifests: ()->
        for m in manifests
          @buildManifest m.name, m.fields, m.translate, m.output

## buildManifest
-----

Generate an individual manifest template file. Called from `buildAllManifests`

      buildManifest: (name, fields, translate, output, callBack)->
        fileName = path.join 'dist', 'manifests', name + '.manifest.' + output
        
        @output = output

Save the file to disc.

        fs.writeFile fileName, @generateData(fields, translate, output), (err)->
          if err
            throw err
          else if callBack
            callBack()

## generateData
-----

Generates data according to requested format.

      generateData: (fields, translate, output)->

If requested output is json, stringify the data.

        if output == 'json'
          return JSON.stringify(fields, null, 2)

If requested output is xml, convert data to xml.

        else if output == 'xml'
          return js2xmlparser 'Package', fields

## transformData
-----

      transformData: (jsonString, translate)->
        if @translate
          for k,v of @translate
            fields[k]
            jsonString = jsonString.replace k, v
        return jsonString

## Export the module
-----

    module.exports = Manifest