# Spotty

Generate random spot grid "paintings" from a fixed palette.

## Setup
- Install ruby
- Install the 'Victor' gem for writing SVG files with `gem install victor`
- Install rsvg-convert for rendering SVGs as JPGs. Easiest on a Mac is via [Homebrew](http://brew.sh/). Once homebrew is installed, run `brew install librsvg`

## Operation
Run `ruby gen.rb` from the command line to run the script. In a few seconds, you'll see some JPG, and SVG files in the same folder.

# Customisation
There are a number of options you can customise in the script.
- "row/column" values based on target aspect ratio (e.g. 10:10 for square, or 10:20 rectangle)
- "colors" string to include the desired hex color values (separated by spaces). 
- "how_many" specifies how many options to create
- "create_high_res" is a boolean specifying whether to make a high-res file or not. useful if you're just debugging and don't need a high-res each time you run it.

## Tips
- The generator script will overwrite any existing JPG or SVG files in that folder so save any that you want to keep elsewhere.