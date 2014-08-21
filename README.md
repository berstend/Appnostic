# Appnostic
-----

Easily transform your HTML, CSS, JS files into a web app capable of support by Windows 8, Chrome and FireFox.

## Installation
-----

`npm install appnostic`

## Usage
-----

From command line:

`appnostic init` This will ask for a series of parameters which will then be added to your package.json file.

`appnostic build` Build according to appnostic parameters entered in the previous step.

### Build parameters

The following parameters are added to package.json when you run `appnostic init`

  - `apps`: *list* containing one to many strings. 
  - `html`: *string* representing the location of your HTML directory.
  - `css`: *string* representing the location of your CSS directory.
  - `js`: *string* representing the location of your JS directory.
  - `dist`: *string* representing the location of your distrobution directory.