function love.load()
  paused= true
  background= love.graphics.newImage("sprites/bg.png")
  backgroundQuad = love.graphics.newQuad(1,1,720/2,1280/2,720/2,1280/2)
  ground = love.graphics.newImage("sprites/ground.png")
  groundPosX = 0
  flappy = love.graphics.newImage("sprites/flappy.png")
  flappyPosY = 200
  pipe = love.graphics.newImage("sprites/pipe.png")
  pipeDown = love.graphics.newImage("sprites/pipeDown.png")
  pipePosX = 400
  pipePosY = 400
end

function love.draw()
  love.graphics.draw(background, backgroundQuad, 0, 0)
  love.graphics.draw(flappy, 125, flappyPosY)
  love.graphics.draw(ground, groundPosX, 550)
  love.graphics.draw(pipe, pipePosX, pipePosY)
  love.graphics.draw(pipeDown, pipePosX, pipePosY - 400)
  love.update()
end



function love.keyreleased(key)
  if key == "escape" then
    paused = false
  end
  if not paused then 
   if key == "space" then
      jump()
    end
   end
end

  
function love.update()
  jumping = true
  groundPosX = groundPosX - 1.0
  if groundPosX < -360 then
  love.graphics.draw(ground, 1, groundPosX)
  groundPosX = 0
  end
  if not paused then 
  pipePosX = pipePosX - 1.0
  if pipePosX < -80 then
  love.graphics.draw(pipe, pipePosX, pipePosY)
  pipePosX = 380
  pipePosY = love.math.random(250,550)
end
if jumping == false then
  flappyPosY = flappyPosY + 2.5
end
  hitTest = CheckCollision(pipePosX, pipePosY, 60, 150, 125, flappyPosY, 38, 27)  
  if(hitTest) then
    paused = true
  end
  end
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function jump()
  jumping = true
  flappyPosY = flappyPosY  -  20
end