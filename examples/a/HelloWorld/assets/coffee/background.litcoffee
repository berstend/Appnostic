    chrome.app.runtime.onLaunched.addListener ()->
      chrome.app.window.create 'window.html', {
        'bounds': {
          'width': 400,
          'height': 500
        }
      }