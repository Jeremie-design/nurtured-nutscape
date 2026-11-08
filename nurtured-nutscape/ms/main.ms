init = function()
//JB
my_sound = audio.playSound("jungle", 1, 1, 0, 500)

Quick.init()
  
gamestart = false 
Quick.gravity = 100
Quick.friction = 10
Quick.ground = -1000
time = 0
/*every 1 seconds do
    time += 1
  time by JB
 end */

//Quick.background ="map2"
con = false 

  winner = 0
  gameover = 0
 //JB
 
  //map set up
  //EG
  map2 = Quick.addMap("map2",0,0,370,2000)
  map2.solid = 0
 //EG and JB
  map = Quick.addMap("map",0,0,370,2000)
  map2 = Quick.addMap("map4",0,0,370,2000)
  map2.solid = 0
  //hero steup
  //EG
  hero = Quick.addSprite("hero", -50,-800,30,30)
  //nest = Quick.addSprite("nest", 100,150,30,30)
  /* nut = map.extractSprites("key")
  /* nut = map.extractSprites("key")
  nut[0].solid = 0
  nut[0].fall = 0

  
 //den = Quick.addSprite("squirrel_burrow_0_nuts", 150,-800,30,30)
 //den
 //enemies = map.extractSprites("enemy")da
 /*for enemy in enemies 
   enemy.solid = 0
   enemy.fall = 0
   enemy.friction = 0
   enemy.vx = 10
  end */
  
  //den setup 
  //JK, EG, and JB
  den = map.extractSprites("den")
  den[0].solid = 0
  den[0].fall = 0
  
//nuts grabing setup 
//JK, EG, and JB
  nuts = map.extractSprites("nut")
  for nut in nuts
    nut.solid = 0
    nut.fall = 0
    nut.grabbed = 0
  end
  // camera stuff
 //JK
  plus = 50
  
  // sound stuff
  // my_sound = audio.playSound("jungle")
  //my_sound.setVolume(0.5)
  
  //nut counter 
  collected = 0
  grabbedNut = 0
   total = nuts.length
   
  
end


update = function()
  Quick.update() 
  
  // Nuts grab setup 
  //JK
  for i=0 to nuts.length-1
    if Quick.spriteCollision(nuts[i],hero) and keyboard.E then
      hero.grab = true
      nuts[i].grabbed = true
      grabbedNut = i
    end
    if nuts[i].grabbed == true and Quick.spriteCollision(nuts[i],den[0]) then
      collected += 1
      nuts[i].display = 0
      nuts.removeAt(i)	
      hero.grab = false
      score = score + 1
      screen.drawText("score: " + score, -50, -800, 30, "black")
    end 
  end
if hero.grab then
   nuts[grabbedNut].x = hero.x - 10
   nuts[grabbedNut].y = hero.y + 5
end

  
 
 //mute game setup 
 //JB
  if keyboard.press.M then
    my_sound.setVolume(0)
  end
  if keyboard.press.N then
    my_sound.setVolume(1)
  end
 
  //controls setup 
  //JB
if con == true then 
  if keyboard.SPACE then
    gamestart = false
  end
end 
if con == false then
   if keyboard.SPACE then
    gamestart = true
    audio.playMusic( "jungle", 1, 1 )
   end
end

    if keyboard.BACKSPACE then 
     con = false 
    end
  
   if keyboard.C then
     con = true
   end
     
   //camrea setup
   //JK
if not gameover and gamestart then 
  if not winner then 
  time = time + 1/60
  end
  Quick.camera.move(-6,hero.y + plus)
  if position_y > 119 then 
    plus = 0
  else
    plus = 77
  end 
   
  /*if hero.y <= -700 then
     gameover = false
  end*/
  position_y = hero.y + 945.01
  
  //print(position_y)
 

  if not gameover and not winner then 
   
    if gameover and keyboard.press.B then
    gameover = false 
    init()
    end

    //hero movement 
    //EG, JB, and JK
    if keyboard.LEFT then
      hero.vx = -200
      hero.name = "hero_run" 
      
    elsif keyboard.RIGHT then 
      hero.vx = 200 
        hero.name = "hero_run2"  
        else 
          hero.vx = 0 
          hero.name = "hero_left"
        
    end 
        
          
    end 
       //JB
      if keyboard.press.SPACE and hero.grounded then 
      hero.vy = 1350
      hero.name = "hero_jump"
     end  
     if hero.grounded == false then 
       hero.name = "hero_falling"
       end
if hero.grounded == false and keyboard.RIGHT then
  hero.name = "hero_falling_right"
elsif hero.grounded == false  and keyboard.LEFT  then 
  hero.name = "hero_falling_left"
  end 
      //winner setup 
      //JK
     if collected == total then
       winner = true 
       end 
     
     /*for nut in nuts
        if  Quick.spriteCollision(nut,hero) then
          nut.x *= .5
          nut.y *= .5*/
          
 /* if hero.grounded then
       current_y = hero.y
       print("current y: " + current_y)
    else
      change_y = current_y - hero.y
       print("current: "+ current_y + ", change: "+ change_y)
     if change_y > 0  then
      print("falling")
       if keyboard.LEFT or keyboard.RIGHT then
         hero.vx = 0
         hero.name = "hero"
       end
  end 
  end*/
end
end





    //making enemies move 
    /*for e in enemies 
      if Quick.spriteCollision(e,hero) then
        gameover = true 
      end
    
      if e.vx > 0 then
        e.vx = 10
        if Quick.mapCellAt(map,e.x+10,e.y) == "wall" or not Quick.mapCellAt(map,e.x+10,e.y-10) then //if wall at the right or nothing at the right and below 
          e.vx = -10 // move left 
        end
      else 
        e.vx = -10
        if Quick.mapCellAt(map,e.x-10,e.y) == "wall" or not Quick.mapCellAt(map,e.x-10,e.y-10) then //if wall at the left or nothing at the left and below 
        e.vx = 10 //move right 
      end
    end 
  end
    
    //grabbing key
    if Quick.spriteCollision(key[0],hero) and keyboard.Z then
      hero.grab = true 
    end
 
    if hero.grab then 
      key[0].x = hero.x - 15
      key[0].y = hero.y 
    end 
 
 if Quick.spriteCollision(key[0],door[0]) then
   winner = true 
   end
 end*/
  



draw = function()
  
  Quick.draw()
  //local numTime = numToTime(time)
  

//JK
 if gamestart then
    screen.drawText("Nuts "+ collected + "/"+ total ,140,90,20,"white") //Quick.camera.x + 75, Quick.camera.y,20, "white")
    screen.drawText(floor (time),-150,90,20,'white')

 end

 //JB
  if winner then
    screen.fillRect(0,0,screen.width, screen.height, "rgb(126,277,76,.5)")
    screen.drawText("WINNER",0,50,60, "white")
    screen.drawText("Deforestation is causing",0, 0, 29, "white")
    screen.drawText("many animals to starve",0, -40, 29, "white")
    screen.drawText(floor(time),5,-75,20,'white')
     screen.drawText("Time",-30, -74, 20, "white")
  end 
  //JB
  if gameover then
    screen.fillRect(0,0,screen.width,screen.height, "rgb(255,0,0,.5)")
    screen.drawText("GAME OVER",0,0,60, "white")
    screen.drawText("Press b to restart",0,-30.25,25,"rgb(5,5,5)")
    end
    
   if not gamestart then
   //timer is paused 
   //JK and JB
 screen.drawSprite( "simple_ex_gameplay", 0, 0,  405 )
 screen.drawSprite( "cat" ,-90, 0, 100 )
   screen.drawText("Nurtured Nutscape" 0, 75, 33 "white")
    screen.drawText("Press Space to Play" 48, 50, 20 "white")
    screen.drawText("Press C for Controls " 52, 20, 20 "white")
    screen.drawText("Press M and N to " 52, -10, 20 "white")
      screen.drawText("Control the Music " 52, -25, 20 "white")
    
    if con then
      //JK and JB
    screen.clear("rgb(16,144,60)")
    screen.drawText("Use A and D to Move", 0, 80, 22, "white")
    screen.drawSprite( "a_d", 0, 50, 60, 25 )
    screen.drawText("Hit Space to Jump", -90, 20, 22, "white")
    screen.drawText("Press E to grab", 90, 20, 22, "white")
     screen.drawSprite( "e", 100, -11, 30, 25 )
      screen.drawSprite( "space", -90, -11, 80, 20 )
     screen.drawText("Hit Backspace to Go to The Main Menu", 0, -38, 22, "white")
       screen.drawSprite( "backspace", 0, -71, 80, 20 )
   end
   

   


end 
end
//JB
numToTime = function(sec)
  local hours = floor(sec / 3600)
  local minutes = floor((sec % 3600) / 60)
  local seconds = sec % 60
  
  local output = ''
  if hours > 0 then
    output=output +hours + ':'
  end
  
  if minutes >= 0 then
    if minutes < 10 then
      output=output + '0'
    end
    output=output +minutes + ':'
  end
  
  if seconds >= 0 then
    if seconds < 10 then
      output=output + '0'
    end
    output=output + seconds
  end
  
  return if sec > 0 then output else '' end
end