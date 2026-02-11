module.exports = {
  content: [
    "./app/views/**/*.{erb,html}",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/assets/stylesheets/**/*.css",
    "./app/assets/tailwind/**/*.css"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Space Grotesk", "ui-sans-serif", "system-ui"],
        serif: ["Newsreader", "ui-serif", "Georgia"]
      }
    }
  },
  plugins: []
}
