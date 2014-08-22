# Appnostic
-----

Easily transform your HTML, CSS, JS files into a web app capable of support by Windows 8, Chrome and FireFox.

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

## Brands currently supported

  - Chrome
  - FireFox
  - Ubuntu
  - Windows 8
  - Windows Phone 8

## Development
-----

### Adding support for manifests

To add a new manifest, we need only to add a manifest file, everything else will be handled automatically.

#### Manifest files

Manifest files specify which values from master.manifest.json to use. 

Manifest files must follow three rules:

  1. Must be stored in the **./manfiests** directory
  2. Must follow the naming convention **[brand].manifest.json**
  3. Must contain appnostic build parameters

#### Appnostic build parameters

These parameters are vital to the final output of Appnostic builds.

**"format": string**  
`string` can be: `json` or `xml`

**"translate": {from:to}**  
`dictionary` translates key to value in compiled manifest.

**Example**

    "appnostic": {
      "format": "json",
      "translate": {
        "developer":"author"
      }
    }

This would output a json file with the key "developer" swapped for "author"

## Notes
-----

  - [Windows Manifest File Schema](http://goo.gl/BEj7yf)
  - [Windows Phone 8 manifest file](http://goo.gl/mjmm5c)