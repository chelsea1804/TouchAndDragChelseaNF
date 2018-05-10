-- Title: TouchAndDrag
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays images that can be draged around on the screen.

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables
local jazzySound = audio.loadSound( "Sounds/jazzy.mp3")
local jazzySoundChannel

local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local pinkGirl = display.newImageRect("Images/girl1.png", 150, 150)
local pinkGirlWidth = pinkGirl.width 
local pinkGirlHeight = pinkGirl.height

local hatGirl = display.newImageRect("Images/girl4.png", 150, 150)
local hatGirlWidth = hatGirl.width
local hatGirlHeight = hatGirl.height

local ship = display.newImageRect("Images/rocketship.png", 150, 150)
local shipWidth = ship.width
local shipHeight = ship.height

-- boolean variables to keep track of which object I touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedHatGirl = false
local alreadyTouchedShip = false


-- set the initial x and y position of myImage
pinkGirl.x = 400
pinkGirl.y = 500

hatGirl.x = 300
hatGirl.y = 200

ship.x = 200
ship.y = 100

-- Function: PinkGirlListener
-- Input: touch listener
-- Output: none 
-- Description: when the pink girl is touched, move her
local function PinkGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedHatGirl == false) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPinkGirl == true) ) then
		pinkGirl.x = touch.x
		pinkGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedPinkGirl = false
		alreadyTouchedHatGirl = false
	end
end

-- add the respective listeners to each object
pinkGirl:addEventListener("touch", PinkGirlListener)


-- Function: HatGirlListener
-- Input: touch listener
-- Output: none 
-- Description: when the hat girl is touched, move her
local function HatGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPinkGirl == false) then
			alreadyTouchedHatGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedHatGirl == true) ) then
		hatGirl.x = touch.x
		hatGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedHatGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective listeners to each object
hatGirl:addEventListener("touch", HatGirlListener)

-- Function: ShipListener
-- Input: touch listener
-- Output: none 
-- Description: when the ship is touched, move her
local function ShipListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedHatGirl == false) then
			alreadyTouchedShip = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedShip == true) ) then
		ship.x = touch.x
		ship.y = touch.y
	end

		

	if (touch.phase == "ended") then
		alreadyTouchedShip = false
		alreadyTouchedHatGirl = false
	end
end

-- add the respective listeners to each object
ship:addEventListener("touch", ShipListener)

