fs = require 'fs'
path = require 'path'
pkg = require path.join __dirname, '..', 'package.json'
require 'coffee-script/register'

class Manifest
  manifestSpacing = 2
  master = null

  constructor: (manifests)->
    # build the master manifest
    @manifests = manifests # todo: make this not sutpid

  buildMasterManifest: ()->
    m = @manifests[0]
    @buildManifest m.name, m.fields, m.translate, m.output, ()=>
      # set master manifest
      master = fs.readFileSync(
        path.join(
          'src'
          'manifests'
          'master.manifest.json'
        )
      )
      @master = JSON.parse master
      @buildAllManifests()

  buildAllManifests: ()->
    # build the other manifest files
    for m in @manifests
      if m.name != 'master'
        @buildManifest m.name, m.fields, m.translate, m.output

  buildManifest: (name, fields, translate, output, callBack)->
    fileName = path.join 'src', 'manifests', name + '.manifest.json'
    
    @output = output

    fs.writeFile fileName, @generateData(fields, translate), (err)->
      if err
        throw err
      else if callBack
        callBack()

  generateData: (fields, translate)->
    if @master
      return @transformData(
        JSON.stringify(@master, fields, 2), translate
      )
    else
      return @transformData JSON.stringify(fields, null, 2), translate

  transformData: (jsonString, translate)->
    if @translate
      for k,v of @translate
        jsonString = jsonString.replace k, v
    return jsonString

module.exports = Manifest