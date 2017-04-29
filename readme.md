# Spotty

Generate random spot grid "paintings" from a fixed palette.

## Setup
- Install ruby
- Install the 'Victor' gem for writing SVG files with `gem install victor`
- Install rsvg-convert for rendering SVGs as JPGs. Easiest on a Mac is via [Homebrew](http://brew.sh/). Once homebrew is installed, run `brew install librsvg`

## Operation
Open `gen.rb` and modify the following variables
- "row/column" values based on target aspect ratio (e.g. 10:10 for square, or 10:20 rectangle)
- "colors" string to include the desired hex color values (separated by spaces). 

Save the file and run `ruby gen.rb` from the command line. After a few seconds, you'll 

## Tips

- The generator script will overwrite any existing JPG or SVG files in that folder so save any that you want to keep elsewhere.
- You can also modify the "spacing" parameter to change the spacing between spots.