#check out the readme, yo.

require 'victor'
require 'trollop'

opts = Trollop::options do
    #opt :monkey, "Use monkey mode"                    # flag --monkey, default false
    #opt :name, "Monkey name", :type => :string        # string --name <s>, default nil
    #opt :num_limbs, "Number of limbs", :default => 4  # integer --num-limbs <i>, default to 4

    opt :palette, "colour string with hex values separated by space", :default=>"#1B1725 #B8C5D6 #503D3F #481620 #324A5F", :type=>:string
    opt :debug, "Debug - produce only one lo-res file each time"
    #opt :size, "height x width (e.g. 500x200)"    
    opt :columns, "Number of columns", :default=>10
    opt :rows , "Number of rows", :default=>10
  end

#Add your palette colours here"
colors = opts[:palette].split("\s")

background = "#fff"

#change these depending on aspect ratio (e.g. square, or 2:1 rectangle)
cols = opts[:columns]
rows = opts[:rows]

if(opts[:debug])
  #how many options do you want? (default: 3)
  how_many = 1
  #speed up debugging if you don't need a high-res file
  create_high_res = false
else
  how_many = 3
  create_high_res = true
end

#-----careful down here....
width = 1000.0 #note the extra .0 to make this a float and prevent rounding errors
height = width * rows / cols
spacing_count = cols - 1
diam = width / (cols + spacing_count) #works because space = diameter
horiz_space = diam #spacing equal to diameter

#remaining height / number of space rows
vert_space = (height - (rows * diam)) / (rows - 1) 
rad = diam / 2

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
        x = rad + (col * (diam + horiz_space))
        #ditto for center Y
        y = rad + (row * (diam + vert_space))
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
  `rsvg-convert -w 10000 #{name}.svg > #{name}_hires.jpg` if create_high_res
end
