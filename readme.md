# Spotty

Generate random spot grid "paintings" from a fixed palette.

## Setup
- Install ruby
- Install the 'Victor' gem for writing SVG files with `gem install victor`
- Install the 'trollop' gem for command line options `gem install trollop`
- Install rsvg-convert for rendering SVGs as JPGs. Easiest on a Mac is via [Homebrew](http://brew.sh/). Once homebrew is installed, run `brew install librsvg`

## Operation
Run `ruby gen.rb` from the command line to run the script. In a few seconds, you'll see some JPG, and SVG files in the same folder.

# Customisation
Run `ruby gen.rb -h` to see command line options for customising columngs, rows, and colours.

## Tips
- The generator script will overwrite any existing JPG or SVG files in that folder so save any that you want to keep elsewhere.