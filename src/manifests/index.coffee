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
  translate: null

firefox =
  name: 'firefox'
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
  translate: null

chrome =
  name: 'chrome'
  output: 'json'
  fields:
    manifest_version: 2
    name:''
    description:''
    version:''
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
  translate: null

module.exports = [
  master,
  firefox,
  chrome
]