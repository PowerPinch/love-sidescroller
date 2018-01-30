man = love.graphics.newImage('art/man1.png')
metal_floor = love.graphics.newImage('art/tiles/metalfloor.png')

world = love.physics.newWorld(0, 9.81)

man_body = love.physics.newBody(world, 100, 100, 'dynamic')
man_shape = love.physics.newRectangleShape(20.8, 33.6)
man_fixture = love.physics.newFixture(man_body, man_shape)

function love.update()
  dt = love.timer.getDelta()
  world:update(dt)
end

function love.draw()
  love.graphics.print(tostring(love.timer.getFPS( )), 10, 10)
  love.graphics.draw(man, man_body:getX(), man_body:getY(), 0, 0.1, 0.1)
end
