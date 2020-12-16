const url = 'http://pig-gateway:9999'
let publicPath = './'
module.exports = {
  publicPath: publicPath,
  lintOnSave: true,
  productionSourceMap: true,
  css: {
    // 忽略 CSS order 顺序警告
    extract: { ignoreOrder: true }
  },
  devServer: {
    proxy: {
      '/': {
        target: url,
        ws: true,
        pathRewrite: {
          '^/': '/'
        }
      }
    }
  }
}
