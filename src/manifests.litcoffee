# Manifests
-----

Manifest files are app specific json or xml files that
contain specifications for your web app as requested required
by various app services.

## Manifest template data sources
-----

### Master

    master =
      name: 'master'
      output: 'json'
      fields:
        name:''
        description:''
        default_locale:''
        permissions:''
        version:''
        developer:''
        icons:''
        activities:''
        apache_path:''
        chrome:''
        csp:''
        fullscreen:''
        installs_allowed_from:''
        launch_path:''
        locales:''
        messages:''
        orientation:''
        origin:''
        precompile:''
        redirects:''
        type:''
      transform: null

### Firefox

    firefox =
      name: 'firefox'
      output: 'json'
      fields:
        name:''
        description:''
        version:''
        default_locale:''
        permissions:''
        developer:''
        icons:''
        activities:''
        apache_path:''
        chrome:''
        csp:''
        fullscreen:''
        installs_allowed_from:''
        launch_path:''
        locales:''
        messages:''
        orientation:''
        origin:''
        precompile:''
        redirects:''
        type:''
      transform: null

### Chrome

    chrome =
      name: 'chrome'
      output: 'json'
      fields:
        name:''
        description:''
        version:''
        manifest_version: 2
        default_locale:''
        icons: {}
        browser_action: {}
        page_action: {}
        author:
          name:''
          url:''
          email:''
        automation: []
        background:
          persistent: false
        background_page: []
        chrome_settings_overrides: {}
        chrome_ui_overrides:
          bookmarks_ui:
            remove_bookmark_shortcut: true
            remove_button: true
        chrome_url_overrides: {}
        commands: []
        content_pack: []
        content_scripts: [{}]
        content_security_policy: 'policyString'
        converted_from_user_script: []
        current_locale: []
        devtools_page: []
        externally_connectable:
          matches: ['*://*.example.com/*']
        file_browser_handlers: []
        homepage_url: 'http://path/to/homepage'
        import: []
        incognito: 'spanning or split'
        input_components: []
        key: 'publicKey'
        minimum_chrome_version: 'versionString'
        nacl_modules: []
        oauth2: []
        offline_enabled: true
        omnibox:
          keyword: 'aString'
        optional_permissions: []
        options_page: 'aFile.html'
        page_actions: []
        permissions: []
        platforms: []
        plugins: []
        requirements: {}
        sandbox: []
        script_badge: []
        short_name: 'Short Name'
        signature: []
        spellcheck: []
        storage:
          managed_schema: 'schema.json'
        system_indicator: []
        tts_engine: []
        update_url: 'http://path/to/updateInfo.xml'
        web_accessible_resources: []
      transform: null

### Ubuntu

    # get rid of default values
    ubuntu =
      name: 'ubuntu'
      output: 'json'
      fields:
        title: ''
        description: ''
        version: ''
        framework: 'ubuntu-sdk-14.04'
        hooks:
          example:
            apparmor: 'app.json'
            desktop: 'app.desktop'
        maintainer: 'Joe Blobbs'
        name: 'com.ubuntu.developer.joe-blobbs.example'
      transform: null

### Windows 8

    windows8 =
      name: 'windows8'
      output: 'xml'
      fields:
        '@':
          xmlns:'http://schemas.microsoft.com/appx/2010/manifest'
        Identity:
          '@':
            Name:''
            Version:''
            Publisher:''
        Properties:
          DisplayName:''
          PublisherDisplayName:''
          Logo:''
        Prerequisites:
          OSMinVersion:''
          OSMaxVersionTested:''
        Resources:[
          Resource:
            '@':
              Language:''
        ]
        Applications:
          Application:
            '@':
              Id:''
              StartPage:''
            VisualElements:
              '@':
                DisplayName:''
                Description:''
                Logo:''
                SmallLogo:''
                ForegroundText:''
                BackgroundColor:''
              SplashScreen:
                '@':
                  Image:''
      transform: null

### Create a new manifest template

  1. Add a new data source
  2. Compile all manifest templates (see [gulpfile](../gulpfile.litcoffee) for more info)

You can create a new Manfiest Template by inserting your own data here.

## Export all the data
-----

    module.exports =
      master:master
      firefox:firefox
      chrome:chrome
      ubuntu:ubuntu
      windows8:windows8