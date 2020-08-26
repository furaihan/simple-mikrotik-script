#This script is inspired by TSOKOTSA's script published in the Mikrotik forum
local hour [:pick [/system clock get time] 0 2]
local minute [:pick [/system clock get time] 3 5]
local second [:pick [/system clock get time] 6 8]
local hundred ("1$second")
local hundred2 ("1$minute")
local hundred3 ("1$hour")
if (($hundred3 = $hundred) or ($hundred3 = $hundred2)) do={ set hundred3 (hundred3 + $second)}
if ($hundred2 = $hundred) do={set hundred2 ($hundred2 + $hour + 1)}

local string ("H","3","N","J","L","g","R","b","O","i","9","U","F","G","G","7","k","M","q","F","u","5","w","v","o","O","Q","V","r","6","9","l","u","n","Q","l","M","C","9","j","a","s","Y","h","K","S","N","T","d","H","i","f","E","f","q","Z","N","5","d","2","P","4","q","V","o","T","b","H","X","I","f","K","6","b","x","y","t","B","E","c","S","m","f","A","9","J","V","H","s","W","l","m","V","Z","p","u","c","r","1","Q","A","Z","2","h","E","P","t","M","c","K","V","B","g","z","J","x","k","y","q","W","K","p","i","R","Z","R","7","A","5","Y","a","A","o","H","X","4","6","9","R","Z","A","d","c","i","L","K","5","T","g","f","W","M","Y","S","J","v","V","t","N","O","F","T","v","6","y","u","p","0","H","W","Y","i","G","I","X","A","W","P","u","l","9","t","1","s","Q","a","e","I","N","E","5","K","O","l","E","m","3","L","P")
