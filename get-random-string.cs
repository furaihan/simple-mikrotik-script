#This script is inspired by TSOKOTSA's script published in the Mikrotik forum
local hour [:pick [/system clock get time] 0 2]
local hourx
local minute [:pick [/system clock get time] 3 5]
local minutex
local second [:pick [/system clock get time] 6 8]
local secondx
local hundred ("1$second")
local hundred2 ("1$minute")
local hundred3 ("1$hour")
if (([:pick $hour 1] = [:pick $hour 0]) or ([:pick $minute 1] = [:pick $minute 0]) or ([:pick $second 1] = [:pick $second 0])) do={
	set hourx (([:pick $hour 1].[:pick $hour 0]) + 1)
	set minutex (([:pick $minute 1].[:pick $minute 0]) + 1)
	set secondx (([:pick $second 1].[:pick $second 0]) + 8)
} else={
	set hourx ([:pick $hour 1].[:pick $hour 0])
	set minutex ([:pick $minute 1].[:pick $minute 0])
	set secondx ([:pick $second 1].[:pick $second 0])
}
if ($hundred2 = $hundred) do={set hundred2 ($hundred2 + $hour + 1)}
if (($hundred3 = $hundred) or ($hundred3 = $hundred2)) do={ set hundred3 ($hundred3 + $second)}
if ($minute + $second - $hour < 5) do={
	set second ($second + 25)
	set minute ($minute + 60)
} else={
	nothing
}
local string ("H","3","N","J","L","g","R","b","O","i","9","U","F","G","G","7","k","M","q","F","u","5","w","v","o","O","Q","V","r","6","9","l","u","n","Q","l","M","C","9","j","a","s","Y","h","K","S","N","T","d","H","i","f","E","f","q","0","7","0","w","s","X","h","9","b","X","b","n","n","R","E","z","q","r","w","7","Z","N","5","d","2","P","4","q","V","o","T","b","H","X","I","f","K","6","b","x","y","t","B","E","c","S","m","f","A","9","J","V","H","s","W","l","m","V","Z","p","u","c","r","1","Q","A","Z","2","h","E","P","t","M","c","K","V","B","g","z","J","x","k","y","q","W","K","p","i","R","Z","R","7","A","5","Y","a","A","o","H","X","4","6","9","R","Z","A","d","c","i","L","K","5","T","g","f","W","M","Y","S","J","v","V","t","N","O","F","T","v","6","y","u","p","0","H","W","Y","i","G","I","X","A","W","P","u","l","9","t","1","s","Q","a","e","I","N","E","5","K","O","l","E","m","3","L","P","2","4","s","O","y","Y","V","l","3","y","T","D","b","3","6","N","F","x","4","7")

global RandomString
set RandomString ([:pick $string $second].[:pick $string $secondx].[:pick $string ($minute + $second - $hour)].[:pick $string ($minute + $hour + $secondx)].[:pick $string [:tonum $hundred]].[:pick $string [:tonum ($hundred2 + $second)]].[:pick $string [:tonum $hundred3]].[:pick $string ($minute + $hourx + $second)].[:pick $string ($hourx + $hour + $second)].[:pick $string ($secondx + $second)])
put message="Here are your random strings: $RandomString"
put message=([/system clock get time]." - ".[/system clock get date])