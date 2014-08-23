# Appnostic
-----

Easily transform your HTML, CSS, JS files into a web app capable of cross-platform support.

**Supported platforms**
  - Chrome
  - FireFox

**Planned support**
  - Ubuntu
  - Windows 8
  - Windows Phone 8

## Installation
-----

`npm install appnostic`

## Usage
-----

From command line:

`appnostic init` This will ask for a series of parameters which will then be saved to a file called appnostic.json

`appnostic build` Build according to appnostic parameters entered in the previous step.

### Build parameters

The following parameters are added to package.json when you run `appnostic init`

  - `apps`: *list* containing one to many strings. 
  - `html`: *string* representing the location of your HTML directory.
  - `css`: *string* representing the location of your CSS directory.
  - `js`: *string* representing the location of your JS directory.
  - `dist`: *string* representing the location of your distrobution directory.

## Manifests
-----

Manifests are json files containing parameters which are unique to each app service.

### Mainfest templates

Manifest templates are stored in `manifests/*.json` and should be added by modifying the code found at `manifests/index.coffee`

## Development
-----

### Adding support for services

  - Create a new manifest template
  - Compile all manifest templates

#### Creating a manifest template

Edit `manifests/index.coffee` and add a new entry.

index.coffee is a coffeescript file, you will be adding a new entry to the manifests array found therein.

  **Example 1a.**

    foo =
      name: 'foo'
      output: 'json'
      fields: [
        'fieldA'
        'fieldB'
      ]
      translate:
        'name':'fieldA'
        'description':'fieldB'
  
    module.exports = [
      ...
      foo
    ]

Compiling the manifefst templates would produce a new **manifest template** called `manifests/foo.manifest.json` with the following contents:

    {
      "fieldA": "",
      "fieldB": ""
    }

#### Compiling manifest templates

`gulp build_manifests`

This destroys all json files from the manifests template directory, and re-generates them according to the rules found within `manfiests/index.coffee`

## Notes
-----

  - [Windows Manifest File Schema](http://goo.gl/BEj7yf)
  - [Windows Phone 8 manifest file](http://goo.gl/mjmm5c)