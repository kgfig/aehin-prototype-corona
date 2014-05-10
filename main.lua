-- 
-- Abstract: Tab Bar sample app
--  
-- Version: 2.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
--
-- Demonstrates how to create a tab bar that allows the user to navigate between screens,
-- using the Widget & Composer libraries.
--
-- Supports Graphics 2.0
------------------------------------------------------------

-- Import libraries

local widget = require ( "widget" )
local composer = require ( "composer" )

-- Import globals and constants

local globals = require "globals"

-- Set defaults
display.setStatusBar( display.HiddenStatusBar ) 
display.setDefault( "background", globals.colors.single.white)

-- Forward reference to objects
local navBarTabs, tabButtons, topBar

-- Create buttons table for the tab bar

tabButtons = 
{
	{
		width = globals.dimensions.tabItemWidth, height = globals.dimensions.tabBarHeight,
		defaultFile = globals.images.tabHomeDefaultIcon,
		overFile = globals.images.tabHomeDownIcon,
		onPress = function() composer.gotoScene( globals.sceneKeys.home ); end,
		selected = true
	},
	{
		width = globals.dimensions.tabItemWidth, height = globals.dimensions.tabBarHeight,
		defaultFile = globals.images.tabProgramDefaultIcon,
		overFile = globals.images.tabProgramDownIcon,
		onPress = function() composer.gotoScene( globals.sceneKeys.program ); end,
	},
	{
		width = globals.dimensions.tabItemWidth, height = globals.dimensions.tabBarHeight,
		defaultFile = globals.images.tabCountriesDefaultIcon,
		overFile = globals.images.tabCountriesDownIcon,
		onPress = function() composer.gotoScene( globals.sceneKeys.countries ); end,
	},
	{
		width = globals.dimensions.tabItemWidth, height = globals.dimensions.tabBarHeight,
		defaultFile = globals.images.tabFeedDefaultIcon,
		overFile = globals.images.tabFeedDownIcon,
		onPress = function() composer.gotoScene( globals.sceneKeys.rssFeed ); end,
	}
}

--Create a tab-bar and place it at the bottom of the screen
navBarTabs = widget.newTabBar
{
	top = 0,
	height = globals.dimensions.navBarHeight,
	width = display.contentWidth,
	backgroundFile = globals.images.tabBarBG,
	tabSelectedLeftFile = globals.images.tabSelectedLeft,
	tabSelectedMiddleFile = globals.images.tabSelectedMiddle,
	tabSelectedRightFile = globals.images.tabSelectedRight,
	tabSelectedFrameWidth = globals.dimensions.tabSelectedFrameWidth,
	tabSelectedFrameHeight = globals.dimensions.tabSelectedFrameHeight,
	buttons = tabButtons
}

composer.gotoScene( globals.sceneKeys.home )