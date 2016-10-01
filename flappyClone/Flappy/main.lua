
function love.load()
  background= love.graphics.newImage("sprites/bg.png")
  backgroundQuad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2) 
  ground = love.graphics.newImage("sprites/ground.png") 
  flappy = love.graphics.newImage("sprites/flappy.png")
  flappyPosY = 200
  pipe = love.graphics.newImage("sprites/pipe.png")
  pipePosX = 300
  
  
end



function love.draw()
  love.graphics.draw(background, backgroundQuad, 0, 0)
  love.graphics.draw(flappy, 125, flappyPosY)
  love.graphics.draw(ground, 0, 550)
  love.graphics.draw(pipe, pipePosX, 400)
  if pipePosX < -80 then
  pipePosX = 380
  pipePosY = math.random(100,200)
  love.graphics.draw(pipe, pipePosX, pipePosY)
  end
  game_screen() 
end


function love.mousereleased(x, y, button)
   if button == 1 then
      jump()
   end
end

function game_screen()
  pipePosX = pipePosX - 1.5
  flappyPosY = flappyPosY + 2.5
  hitTest = CheckCollision(pipePosX, 500, 60, 150, 125, flappyPosY, 45, 45)
  
  if(hitTest) then
    -- Do collision stuff
  end
  
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function jump()
  flappyPosY = flappyPosY  - 55
end