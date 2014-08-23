manifests = [
  {
    name: 'master'
    output: 'json'
    fields: {
      'name':''
      'description':''
      'default_locale':''
      'permissions':''
      'version':''
      'developer':''
      'icons':''
      'activities':''
      'apache_path':''
      'chrome':''
      'csp':''
      'fullscreen':''
      'installs_allowed_from':''
      'launch_path':''
      'locales':''
      'messages':''
      'orientation':''
      'origin':''
      'precompile':''
      'redirects':''
      'type':''
    }
    translate: null
  }
  {
    name: 'firefox'
    output: 'json'
    fields: [
      'name'
      'description'
      'default_locale'
      'permissions'
      'version'
      'developer'
      'icons'
      'activities'
      'apache_path'
      'chrome'
      'csp'
      'fullscreen'
      'installs_allowed_from'
      'launch_path'
      'locales'
      'messages'
      'orientation'
      'origin'
      'precompile'
      'redirects'
      'type'
    ]
    translate: null
  }
]

module.exports = manifests