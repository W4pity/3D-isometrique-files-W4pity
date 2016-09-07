--beginning

sizeBlock = 64 
centerX, centerY = 800/2,600/2
images = {}
--image[0] for nothing, a hole
images[1] = love.graphics.newImage("images/grassSemi.png")
images[2] = love.graphics.newImage("images/rock.png")
images[3] = love.graphics.newImage("images/statue.png")
images[4] = love.graphics.newImage("images/water.png")
images[5] = love.graphics.newImage("images/fond.png")

function love.load(arg)
  --set graphics parameters
  love.window.setMode(800,600,  {fullscreen=false, vsync=true, minwidth=800, minheight=600})
  love.graphics.setBackgroundColor(3,123,170,0)
  --the map                   10                  20
  Map = {}--1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3
  Map[1] = {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[2] = {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[3] = {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[4] = {4,4,4,4,4,4,0,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[5] = {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[6] = {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[7]=  {4,4,4,4,4,4,4,4,1,2,2,2,1,1,1,4,4,4,4,4,4,4,4}
  Map[8]=  {4,4,4,4,4,4,4,4,1,2,1,2,1,1,1,4,4,4,4,4,4,4,4}
  Map[9]=  {4,4,4,4,4,4,4,4,1,2,2,2,1,1,1,4,4,4,4,4,4,4,4}
  Map[10]= {4,4,4,4,4,4,4,4,1,1,1,1,1,3,1,4,4,4,4,4,4,4,4}
  Map[11]= {4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4}
  Map[12]= {4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4}
  Map[12]= {4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4}
  Map[13]= {4,4,4,4,4,4,4,4,1,1,1,4,1,1,1,4,4,4,4,4,4,4,4}
  Map[14]= {4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4}
  Map[15]= {4,4,4,4,4,4,4,4,1,1,1,1,1,1,1,4,4,4,4,4,4,4,4}
  Map[16]= {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[17]= {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[18]= {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[19]= {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[20]= {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4}
  Map[21]= {4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,3}
end

function love.draw()
  local i, j
  for i=1, 21 do --lines
    for j=1, 23 do  --columns
      if Map[i][j] ~= 0 then -- if it's not a hole
        local x = (j-i)*sizeBlock/2
        local y = (j+i)*sizeBlock/4
        if i== 8 and j == 11 then -- a special block
          love.graphics.draw(images[Map[i][j]], x + centerX, centerY+ y-10) 
          
        elseif Map[i][j] == 3 then --if it's a statue
          love.graphics.draw(images[Map[i][j]], x + centerX, centerY+ y- 98) 
          
        elseif Map[i][j] == 4 then --if it's water
          love.graphics.draw(images[Map[i][j]], x + centerX, centerY+ y+20) 
          
        else -- classics block
          love.graphics.draw(images[Map[i][j]], x + centerX, centerY+ y)        
        end
        love.graphics.draw(images[5], 0,0) --firstground
      end
    end
  end
end

function love.update(dt)

  if love.keyboard.isDown("right") then
    centerX = centerX - 5
  end
  if love.keyboard.isDown("left") then
    centerX = centerX + 5
  end
  if love.keyboard.isDown("up") then
    centerY = centerY + 5
  end
  if love.keyboard.isDown("down") then
    centerY = centerY - 5
  end

end

