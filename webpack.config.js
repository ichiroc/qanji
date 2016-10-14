module.exports = {
    context: __dirname + "/app/assets/javascripts",
    entry: "./index.js",
    output: {
        path: __dirname + "/app/assets/javascripts",
        filename: "./bundle.js"
    },
    module: {
        loaders: [
            {
                test: /\.jsx?$/,
                exclude: /node_modules/,
                loader: "babel-loader",
                query: {
                    presets: ['react','es2015']
                }
            }
        ]
    },
    devtool: 'inline-source-map',
    watch: true
};
