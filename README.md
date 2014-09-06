#![Appnostic](src/logo.png)
-----

**WARNING APPNOSTIC IS UNDER THE EARLY STAGES OF DEVELOPMENT. A MINOR RELEASE IS ON THE WAY, BUT UNTIL THEN, THIS LIB DOESN'T WORK.**
-----

Easily add cross-platform support to your standard web app project.

**Supported platforms**
  - Chrome
  - FireFox

**Planned support**
  - Ubuntu
  - Windows 8
  - Windows Phone 8

## Installation
-----

`npm install git://github.com/curlee/Appnostic.git`

## Development
-----

### Installation
-----

`npm start`

This will install all dev requirements and call the deafult gulp task.

Fork this repo and choose an existing issue or feature to work on. Do a
pull request to get your changes merged back into the main branch.

All main files are written in coffeescript literate, so documentation is
built-in and viewable by navigating to litcoffee files within github.

For more information see
  - `gulpfile.litcoffee`
  - `src/Manifest.litcoffee`
  - `src/Appnostic.litcoffee`

## Future
-----

### Planned Usage
-----

Appnostic allows you to create cross-platform web apps from your existing
HTML, CSS, JS and image files.

#### From command line

`appnostic init` This will ask for a series of parameters which will then be
saved to a file called appnostic.json

`appnostic build` Build according to appnostic parameters entered in the
previous step.

#### Build parameters

The following parameters are added to package.json when you run `appnostic init`

  - `apps`: *list* containing one to many strings. 
  - `html`: *string* representing the location of your HTML directory.
  - `css`: *string* representing the location of your CSS directory.
  - `js`: *string* representing the location of your JS directory.
  - `dist`: *string* representing the location of your distribution directory.

## Notes
-----

### Windows 8 / Windows Phone 8

Any development surrounding these brands is highly experimental and prone to
error.

Visual Studio is the officially recommended solution for app development that is
compatable with Windows 8 devices. An open source solution wrapped in a thick
membraine of proprietary software. Yet another monoappistic move by Microsoft

[Windows Dev documentation](http://dev.windows.com/en-us/)