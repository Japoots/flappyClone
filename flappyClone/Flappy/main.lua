function love.load()
  paused = true
  background= love.graphics.newImage("sprites/bg.png")
  bgPosX = 0
  startScreen = love.graphics.newImage("sprites/start.png")
  ground = love.graphics.newImage("sprites/ground.png")
  groundPosX = 0
  flappy = love.graphics.newImage("sprites/flappy.png")
  flappyPosY = 250
  flappy2 = love.graphics.newImage("sprites/flappy2.png")
  pipe = love.graphics.newImage("sprites/pipe.png")
  pipeDown = love.graphics.newImage("sprites/pipeDown.png")
  pipePosX = 400  
  pipePosY = 400
end

function love.draw()
  love.graphics.draw(background, bgPosX,0)
  love.graphics.draw(flappy, 125, flappyPosY) 
  love.graphics.draw(pipe, pipePosX, pipePosY)
  love.graphics.draw(pipeDown, pipePosX, pipePosY - 680)
  love.graphics.draw(ground, groundPosX, 529)
  love.update()
end 



function love.keyreleased(key)
  if key == "escape" then
    paused = false
  end
  
end
function love.keypressed(key)
  if not paused then
    if key == "space" then
    flappyPosY = flappyPosY- 10
    end
  end
end


  
function love.update()
  if paused == true then
  love.graphics.draw(startScreen, 0,0)
  end
  jumping = false
  bgPosX = bgPosX - 0.1
  if bgPosX < -360 then
  love.graphics.draw(background, bgPosX, 1)
  bgPosX = 0
  end
  groundPosX = groundPosX - 1.0
  if groundPosX < -360 then
  love.graphics.draw(ground, 1, groundPosX)
  groundPosX = 0
  end
  if not paused then
  if love.keyboard.isDown('space') then
  jump()
  end
  pipePosX = pipePosX - 1.0
  if pipePosX < -80 then
  love.graphics.draw(pipe, pipePosX, pipePosY)
  love.graphics.draw(pipeDown, pipePosX, pipePosY)
  pipePosX = 380
  pipePosY = love.math.random(250,510)
end
if jumping == false then
  flappyPosY = flappyPosY + 1  
end

  hitTestBot = CheckCollision(pipePosX, pipePosY, 60, 300, 125, flappyPosY, 38, 27)  
  if(hitTestBot) then
    love.load()
  end
  hitTestUp = CheckCollision(pipePosX, pipePosY - 380, 60, 300, 125, flappyPosY, 38, 27)
  if(hitTestUp) then
    love.load()
  end 
end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function jump()
    flappyPosY = flappyPosY - 2
    love.graphics.draw(flappy2, 125, flappyPosY)
end


end  