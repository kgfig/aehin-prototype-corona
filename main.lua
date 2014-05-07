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

display.setStatusBar( display.HiddenStatusBar ) 

local widget = require ( "widget" )
local composer = require ( "composer" )

display.setDefault( "background", 1 )

-- Create buttons table for the tab bar
local tabButtons = 
{
	{
		width = 32, height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "Home",
		onPress = function() composer.gotoScene( "home" ); end,
		selected = true
	},
	{
		width = 32, height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "Program",
		onPress = function() composer.gotoScene( "program" ); end,
	},
	{
		width = 32, height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "AEHIN",
		onPress = function() composer.gotoScene( "aehin" ); end,
	},
	{
		width = 32, height = 32,
		defaultFile = "assets/tabIcon.png",
		overFile = "assets/tabIcon-down.png",
		label = "HINGX",
		onPress = function() composer.gotoScene( "hingx" ); end,
	}
}

--Create a tab-bar and place it at the bottom of the screen
local demoTabs = widget.newTabBar
{
	top = 0,
	height = 52,
	width = display.contentWidth,
	backgroundFile = "assets/tabbar.png",
	tabSelectedLeftFile = "assets/tabBar_tabSelectedLeft.png",
	tabSelectedMiddleFile = "assets/tabBar_tabSelectedMiddle.png",
	tabSelectedRightFile = "assets/tabBar_tabSelectedRight.png",
	tabSelectedFrameWidth = 20,
	tabSelectedFrameHeight = 52,
	buttons = tabButtons
}

composer.gotoScene( "home" )