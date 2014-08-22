fs = require 'fs'
path = require 'path'
man = require './manifests'
require 'coffee-script/register'

class Manifest
  manifestSpacing = 2

  constructor: (name, fields, translate, output)->
    console.log 'Creating manifest for ' + name
    @fileName = path.join 'manifests', name + '.manifest.json'
    @fields = fields
    @translate = translate
    @output = output
    
    master = fs.readFileSync(
      path.join(
        'manifests'
        'master.manifest.json'
      )
    )
    @master = JSON.parse master
    @saveManifest()

  saveManifest: ()->
    fs.writeFile @fileName, @generateData(), (err)->
      throw err if err

  generateData: ()->
    return @transformData(JSON.stringify @master, @fields, @manifestSpacing)

  transformData: (jsonString)->
    if @translate
      for k,v of @translate
        jsonString = jsonString.replace k, v
    return jsonString

# create manifests
for b in man
  if b
    m = new Manifest b.name, b.fields, b.translate, b.output