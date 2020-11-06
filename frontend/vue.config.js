module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://localhost:8086',
        changeOrigin: true,
        pathRewrite: {
          '^api': '/api'
        }
      },
      '/token': {
        target: 'http://localhost:8086',
        changeOrigin: true,
        pathRewrite: {
          '^token': '/token'
        }
      },
    }
  }
}
