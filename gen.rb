#check out the readme, yo.

require 'victor'

#Robin's palette
colors = %w"#1B1725 #B8C5D6 #503D3F #481620 #324A5F"

background = "#fff"
width = 5000.00

#change these depending on aspect ratio (e.g. square, or 2:1 rectangle)
cols = 20
rows = 10

#how many options do you want? (default: 3)
how_many = 3


#-----careful down here....
height = width * rows / cols
spacing_count = cols - 1
diam = width / (cols + spacing_count) #works because space = diameter
spacing = diam #spacing equal to diameter
rad = diam/2

#make several versions to choose from
how_many.times do |i|
  
  #initialis a new SVG instance
  svg = Victor::SVG.new width: width, height: height, style: { background: background }

  #start filling it with shapes
  svg.build do   
    
    #solid background 
    rect x: 0, y: 0, width: width, height: height, fill: background
    
    #loop through the rows
    rows.times do |row|
      #loop through the columns
      cols.times do |col|
        #center X is single radius, + current column * (circle diam + circle spacing)
        x = rad + (col * (diam + spacing))
        #ditto for center Y
        y = rad + (row * (diam + spacing))
        #now create the circle using a random color from our palette
        circle cx: x, cy: y, r: rad, fill: colors.sample
      end
    end
  end

  #construct a name using the current iteration counter (e.g. "option_1")
  name = "option_#{i+1}"
  
  #save the svg
  svg.save name
  
  #helpful output
  puts "Rendering & saving #{name} files"
  
  #create a lo-res and high-res JPG from the SVG named after the option number
  `rsvg-convert -w 1000 #{name}.svg > #{name}.jpg`
  `rsvg-convert -w 10000 #{name}.svg > #{name}_hires.jpg`
end
