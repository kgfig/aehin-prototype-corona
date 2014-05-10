-- Make this an accordion / list view
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

-- Import globals and other data for this module
local globals = require "globals"
local schedule = require "schedule"

-- Forward reference to objects
local list

local LEFT_PADDING = 10

--Create a composer scene for this module
local scene = composer.newScene()

local function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local groupContentHeight = row.contentHeight
	local isCategory = row.isCategory
	local rowText = row.params.rowTitle
	local rowTitle

	if isCategory then
		rowTitle = display.newText( row, row.params.rowTitle, 0, 0, native.systemFontBold, 14 )
	else 
		rowTitle = display.newText( row, row.params.rowTitle, 0, 0, native.systemFont, 14)
	end

	rowTitle.x = LEFT_PADDING
	rowTitle.anchorX = 0
	rowTitle.y = groupContentHeight * 0.5
	rowTitle:setFillColor( 0, 0, 0)
end

local function onRowTouch( event )
	local phase = event.phase
	local row = event.row

	-- do nothing
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
		onRowRender = onRowRender
	}

	for dayIndex, day in pairs( schedule ) do
		list:insertRow({
			rowHeight = globals.dimensions.rowHeight,
			isCategory = true,
			rowColor = { default=globals.colors.rgb.darkGray, over=globals.colors.rgb.darkGray },
			params = {rowTitle = day.title .. " (" .. day.date .. ") " }
		})

		for eventId, schedEvent in pairs( day.events ) do
			list:insertRow({
				rowHeight = globals.dimensions.rowHeight,
				isCategory = false,
				params = {rowTitle = schedEvent.time .. "   " .. schedEvent.eventName }
			})
		end
	end

	sceneGroup:insert( list )
end

--Add the createScene listener
scene:addEventListener( "create", scene )

return scene
