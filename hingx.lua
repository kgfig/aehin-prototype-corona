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
local utils = require "utils"

-- Import globals
local globals = require "globals"

-- Init constants
local LEFT_PADDING = 10
local imageWidth = 24
local rowHeight = 64
local rowPadding = 15

--Create a composer scene for this module
local scene = composer.newScene()

-- Forward reference to objects and data structs
local list, screenText, title, link, stories

local function onRowRender( event )
	local phase = event.phase
	local row = event.row
	local groupContentHeight = row.contentHeight
	local rowTitle, rowDate, rowAuthor

	local rowTitle = display.newText( row, row.params.story.title, 0, 0, native.systemFontBold, 16 )
	local rowDate = display.newText( row, row.params.story.pubDate, 0, 0 , native.systemFont, 12)

	rowTitle.x = 2 * LEFT_PADDING + imageWidth
	rowTitle.anchorX = 0
	rowTitle.y = rowPadding
	rowTitle:setFillColor( 0, 0, 0 )

	rowDate.x = 2 * LEFT_PADDING + imageWidth
	rowDate.anchorX = 0
	rowDate.y = rowTitle.y + rowTitle.height
	rowDate:setFillColor( 0.3, 0.3, 0.3)
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
		fileHandle = io.open( system.pathForFile(globals.files.rss.filename, globals.files.rss.path), "w")
		fileHandle:write( response )
		io.close( fileHandle )

		renderStoryList()
	end
end

function renderStoryList( event )
	feed = rss.feed( globals.files.rss.filename, globals.files.rss.path )
	stories = feed.items
	title = feed.title
	link = feed.link

	for storyId, story in pairs(stories) do
			list:insertRow( {
				isCategory = false,
				rowHeight = rowHeight,
				rowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } },
				lineColor = { 0.5, 0.5, 0.5 },
				params = {
					story = story
				}
			} )
		end

	scene.view:remove( screenText )
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
		top = globals.dimensions.navBarHeight + globals.dimensions.topPadding,
		width = display.contentWidth,
		height = display.contentHeight - globals.dimensions.navBarHeight,
		maskFile = globals.images.listMaskFile,
		onRowRender = onRowRender
	}

	sceneGroup:insert( list )
	sceneGroup:insert( screenText )

	if fileExists( globals.files.rss.filename, globals.files.rss.path) then
		print( "exists" )
		renderStoryList()
	else
		network.request( globals.urls.hingx, "GET", onNetworkResponse )
	end
end

--Add the createScene listener
scene:addEventListener( "create", scene )

return scene
