-- List view

-- 
-- Abstract: Tab Bar sample app, example content screen
--  
-- Version: 2.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
--
-- This file is used to display the corresponding screen content when the user clicks the tab bar. 

local composer = require ( "composer" )
local widget = require( "widget" )

-- Import globals
local globals = require "globals"

-- Local variables
local LEFT_PADDING = 10
local halfW = display.contentCenterX
local halfH = display.contentCenterY


-- Forward reference to objects
local list

--Create a composer scene for this module
local scene = composer.newScene()

local function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local groupContentHeight = row.contentHeight
	
	print( row.index )
	local rowTitle = display.newText( row, globals.countries[row.index], 0, 0, native.systemFontBold, 14 )
	rowTitle.x = LEFT_PADDING
	rowTitle.anchorX = 0
	rowTitle.y = groupContentHeight  * 0.5
	rowTitle:setFillColor( 0, 0, 0 )
end

local function onRowTouch( event )
	local phase = event.phase
	local row = event.row

	if "tap" == phase then
		print( " Selected " .. globals.countries[row.index])
	end
end

--Create the scene
function scene:create( event )
	local sceneGroup = self.view
	
	list = widget.newTableView
	{
		top = globals.dimensions.navBarHeight,
		width = display.contentWidth,
		height = display.contentHeight - globals.dimensions.navBarHeight,
		maskFile = globals.images.listMaskFile,
		onRowRender = onRowRender,
		hideBackground = true
	}

	for i = 1, #globals.countries do
		list:insertRow{
			rowHeight = globals.dimensions.rowHeight
		}
	end

	sceneGroup:insert( list )
end

--Add the createScene listener
scene:addEventListener( "create", scene )

return scene
