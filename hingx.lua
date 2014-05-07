-- dito na lang results ng feed

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
local rss = require "rss"

-- Import globals
local globals = require "globals"

--Create a composer scene for this module
local scene = composer.newScene()

-- Forward reference to objects and data structs
local list, screenText, title, link, stories

local function onRowRender( event )
	local phase = event.phase
	local row = event.row

	local groupContentHeight = row.contentHeight
	print( globals.countries[row.index] )
	local rowTitle = display.newText( row, row.params.story.title, 0, 0, native.systemFontBold, 12 )

	rowTitle.x = LEFT_PADDING
	rowTitle.anchorX = 0

	rowTitle.y = groupContentHeight  * 0.5
	rowTitle:setFillColor( 0, 0, 0 )
end

local function onRowTouch( event )
	local phase = event.phase
	
end

-- Network listener
local function onNetworkResponse( event )
	local response = event.response
	local feed, fileHandle, fileIOError

	if event.isError then
		print( "Cannot fetch items from server" )
	else
		print( "response" )
		fileHandle = io.open( system.pathForFile(globals.files.rss.filename, globals.files.rss.path), "w")
		fileHandle:write( response )
		io.close( fileHandle )

		feed = rss.feed( globals.files.rss.filename, globals.files.rss.path )
		stories = feed.items
		title = feed.title
		link = feed.link

		print( "Number of stories " .. #stories )
		print(title)
		print(link)

		for storyId, story in pairs(stories) do
			list:insertRow( {
				isCategory = false,
				rowHeight = 52,
				rowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } },
				lineColor = { 0.5, 0.5, 0.5 },
				params = {
					story = story
				}
			} )
		end

		scene.view:remove( screenText )
	end
end

--Create the scene
function scene:create( event )
	local sceneGroup = self.view
	
	--Create a text object that displays the current scene name and insert it into the scene's view
	screenText = display.newText( "Loading data from " .. globals.urls.hingx , display.contentCenterX, display.contentCenterY, native.systemFontBold, 14 )
	screenText:setFillColor( 0 )

	-- Create list object
	list = widget.newTableView
	{
		top = 52,
		left = 20,
		width = display.contentWidth - 40,
		height = display.contentHeight - 52,
		maskFile = globals.images.listMaskFile,
		onRowRender = onRowRender,
		onRowTouch = onRowTouch
	}

	sceneGroup:insert( list )
	sceneGroup:insert( screenText )
end

function scene:show( event )
	local phase = event.phase
	local sceneGroup = self.view
	-- show loading screen while getting request

	if phase == "will" then
		network.request( globals.urls.hingx, "GET", onNetworkResponse )
	elseif phase == "did" then
		
	end
end

--Add the createScene listener
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene
