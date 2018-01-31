function create_actor (image_file, pos_x, pos_y, scale_x, scale_y, fixed_rotation, body_type)
  image = love.graphics.newImage(image_file)
  body = love.physics.newBody(world, pos_x, pos_y, body_type)
  shape = love.physics.newRectangleShape(
    image:getWidth() * scale_x,
    image:getHeight() * scale_y
  )
  body:setFixedRotation(fixed_rotation)
  return {
    image = image,
    scale_x = scale_x,
    scale_y = scale_y,
    body = body,
    shape = shape,
    fixture = love.physics.newFixture(body, shape)
  }
end

function draw_actor (actor)
  love.graphics.draw(
    actor.image,
    actor.body:getX(),
    actor.body:getY(),
    actor.body:getAngle(),
    actor.scale_x,
    actor.scale_y
  )
end

function update_man(man_actor, dt)
  speed = 100
  if love.keyboard.isDown('a') then
    man_actor.body:setLinearVelocity(-speed, 0)
  elseif love.keyboard.isDown('d') then
    man_actor.body:setLinearVelocity(speed, 0)
  end
end

world = love.physics.newWorld(0, 470)

man = create_actor('art/man1.png', 100, 100, 0.1, 0.1, false, 'dynamic')
man.body:setAngle(50)

floor = create_actor('art/tiles/metalfloor.png', 100, 400, 0.5, 0.5)

function love.conf(t)
  t.window.borderless = true
end

function love.update()
  dt = love.timer.getDelta()
  update_man(man, dt)
  -- if(love.keyboard.isDown('w') && man_body.getContactList())
  world:update(dt)
end

function love.draw()
  love.graphics.print(tostring(love.timer.getFPS()), 10, 10)
  draw_actor(man)
  draw_actor(floor)
end
