-- Make this as a scroll view

-- 
-- Abstract: Tab Bar sample app, example content screen
--  
-- Version: 2.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
--
-- This file is used to display the corresponding screen content when the user clicks the tab bar. 

-- Initialize libraries

local composer = require ( "composer" )
local widget = require ( "widget" )

-- Initialize globals and constants
local globals = require "globals" 

-- Forward reference to objects
local scrollView, screenText

--Create a composer scene for this module
local scene = composer.newScene()

-- Cteate scroll view listener function
local function scrollViewListener( event )
	local phase = event.phase
	local direction = event.direction

	if direction == "up" or direction == "down" then
		if "began" == phase then
			print( "began" )
		elseif "moved" == phase then
			print( "moved" )
		elseif "ended" == phase then
			print( "ended" )
		end
	end

	if event.limitReached then
		if "up" == direction then
			print( "Reached top limit" )
		elseif "down" == direction then
			print( "Reached bottom limit" )
		end
	end

	return true
end

--Create the scene
function scene:create( event )
	local sceneGroup = self.view

	-- Create scrollview with listener
	scrollView = widget.newScrollView
	{
		left = 0,
		top = 0,
		width = display.contentWidth,
		height = display.contentHeight,
		bottomPadding = 50,
		id = "homeScrollView",
		horizontalScrollDisabled = true,
		verticalScrollDisabled = false,
		listener = scrollViewListener
	}
	
	--Create a text object that displays the current scene name and insert it into the scene's view
	screenText = display.newText( globals.textTemplates.intro, display.contentCenterX, 0, display.contentWidth - 30, 0, native.systemFontBold, 14 )
	screenText:setFillColor( 0 )
	screenText.anchorY = 0

	screenText.y = 52 + 15-- tab height + 10

	-- Add text object to scroll view
	scrollView:insert( screenText )

	-- Add scroll view to scene group
	sceneGroup:insert( scrollView )
end


--Add the createScene listener
scene:addEventListener( "create", scene )

return scene
