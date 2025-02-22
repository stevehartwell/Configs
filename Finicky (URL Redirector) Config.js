// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: 'Firefox',
  options: {
    // Hide the finicky icon from the top bar. Default: false
    hideIcon: false,
    // Check for update on startup. Default: true
    checkForUpdate: true,
    // Change the internal list of url shortener services. Default: undefined
    // urlShorteners: (list) => [...list, 'custom.urlshortener.com'],
    // Log every request with basic information to console. Default: false
    logRequests: true,
  },
  // rewrite: [
  //   {
  //     match: 'example.org/*',
  //     url: 'http://example.com',
  //   },
  // ],
  handlers: [
    {
      match: (arg) => {
        /* https://www.amazon.com */
        const duzzit = arg.url.host.endsWith('amazon.com')
        if (duzzit) finicky.log(`shopping: ${arg}`);
        return duzzit;
      },
      browser: 'Shopping.app',
    },
  ],
};
