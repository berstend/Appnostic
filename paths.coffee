fs = require 'fs'

# create rooth paths
paths =
  manfiests:
    root: path.join 'manifests'
  dist:
    root: path.join 'dist'

# get all manifest files
manRoot = paths.manifests.root
manifests = fs.readdir manRoot, (err, files)->
  # insert manifests into paths
  for f in files
    paths.manifests[f.split('.')[0]] = path.join manRoot, f

for b in brands
  paths.manifests[b] = path.join paths.manifests.root, b+'manifest.json'

module.exports = paths