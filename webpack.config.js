const path = require('path')

module.exports = {
  entry: {
    app: [
      './src/index.js'
    ]
  },

  output: {
    path: path.resolve(__dirname + '/dist'),
    filename: '[name].js'
  },

  module: {
    loaders: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack'
      },
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file?name=[name].[ext]'
      },
      {
        test: /\.(css|scss)$/,
        loaders: [
          'style',
          'css',
          'sass'
        ]
      }
    ],

    noParse: /\.elm$/
  },

  devServer: {
    inline: true,
    stats: {
      colors: true
    }
  }
}
