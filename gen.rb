require 'victor'

#Robin's palette
colors = %w"#1B1725 #B8C5D6 #503D3F #481620 #324A5F"

background = "#fff"
diam = 20
spacing = diam #spacing equal to diameter

#change these depending on aspect ratio (e.g. square, or 2:1 rectangle)
rows = 10
cols = 20

#how many options do you want? (default: 3)
how_many = 3

#-----careful down here....
rad = diam/2
width = (cols * diam) + ((cols-1) * diam)
height = (rows * diam) + ((rows-1) * diam)


#make 3 versions to choose from
how_many.times do |i|
  
  #initialis a new SVG instance
  svg = Victor::SVG.new width: width, height: height, style: { background: background }

  #start filling it with shapes
  svg.build do   
    #solid backtround 
    rect x: 0, y: 0, width: width, height: height, fill: background
    
    #loop through the rows
    rows.times do |row|
      #loop through the columns
      cols.times do |col|
        #center X is single radius, + current column * (circle diam + circle spacing)
        x = rad + (col * (diam+spacing))
        #ditto for center Y
        y = rad + (row * (diam+spacing))
        
        #now create the circle using a random color from our palette
        circle cx: x, cy: y, r: rad, fill: colors.sample
      end
    end
  end

  #construct a name using the current iteration counter (e.g. "option_1")
  name = "option_#{i+1}"
  
  #save the svg
  svg.save name
  
  puts "Rendering & saving #{name} files"
  
  #create a lo-res and high-res JPG from the SVG named after the option number
  `rsvg-convert -w 1000 #{name}.svg > #{name}.jpg`
  `rsvg-convert -w 10000 #{name}.svg > #{name}_hires.jpg`
end
