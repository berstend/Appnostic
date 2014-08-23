fs = require 'fs'
path = require 'path'
js2xmlparser = require 'js2xmlparser'
pkg = require path.join __dirname, '..', 'package.json'
require 'coffee-script/register'

class Manifest
  manifestSpacing = 2
  master = null

  constructor: (manifests)->
    # build the master manifest
    @manifests = manifests # todo: make this not sutpid

  buildAllManifests: ()->
    # build the other manifest files
    for m in @manifests
      @buildManifest m.name, m.fields, m.translate, m.output

  buildManifest: (name, fields, translate, output, callBack)->
    fileName = path.join 'src', 'manifests', name + '.manifest.' + output
    
    @output = output

    fs.writeFile fileName, @generateData(fields, translate, output), (err)->
      if err
        throw err
      else if callBack
        callBack()

  generateData: (fields, translate, output)->
    if output == 'json'
      #return @transformData JSON.stringify(fields, null, 2), translate
      return JSON.stringify(fields, null, 2)
    else if output == 'xml'
      return js2xmlparser 'Package', fields
      #return @transformData js2xmlparser 'Package', fields

  transformData: (jsonString, translate)->
    if @translate
      for k,v of @translate
        fields[k]
        jsonString = jsonString.replace k, v
    return jsonString

module.exports = Manifest