module.exports = {
  devServer: {
    proxy: {
      '/api': {
        target: 'http://localhost:8086',
        changeOrigin: true,
        pathRewrite: {
          '^api': '/api'
        }
      }
    }
  }
}
