global telegram do={
	:local noParam $1
	:if ($noParam = "help") do-={
		
	}
	:local botToken ("xxxxxxxx:xxxxXXXxxxXxXXXxxxXXxXXxXx")
	:local chatId 00000000
	:local url ("https://api.telegram.org/bot$botToken/")
	:local getid do={
		:local cur 0
		:local lkey [:len $key]
		:local res ""
		:local p
		
		:if ([:len $block]>0) do={
			:set p [:find $text $block $cur]
			:if ([:type $p]="nil") do={
				:return $res
			}
			:set cur ($p+[:len $block]+2)
		}
		
		:set p [:find $text $key $cur]
		:if ([:type $p] != "nil") do={
			:set cur ($p+lkey+2)
			:set p [:find $text "," $cur]
			:if ([:type $p]!="nil") do={
				if ([:pick $text $cur]="\"") do={:set res [:pick $text ($cur+1) ($p-1)]} else={:set res [:pick $text $cur $p]}
			}
		}
		:return $res
	}
	:local logAndPut do={
		:if ([:len $msg] > 0) do={
			:log warning message=$msg
			:put message=$msg
		}
	}
	:if ([:typeof $chatId] != "str") do={:set chatId ([:tostr $chatId])}
	:if (($type = "message") or ($type = "audio") or ($type = "editMessage") or (($type = "image") or ($type = "photo") or ($type = "picture")) ) do={
		:if ($type = "message") do={
			:set url ($url."sendMessage\?chat_id=$chatId&text=$text")
			:if ([:len $mode] > 0) do={set url ($url."&parse_mode=$mode")}
			:put $url
			/tool fetch url="$url" keep-result=no
		}
		:if ($type = "audio") do={
			:set url ($url."sendAudio\?chat_id=$chatId&audio=$mediaUrl")
			:if ([:len $text] > 0) do={:set url ($url."&caption=$text")}
			:if ([:len $mode] > 0) do={:set url ($url."&parse_mode=$mode")}
			:put $url
			/tool fetch url="$url" keep-result=no
		}
		:if (($type = "image") or ($type = "photo") or ($type = "picture")) do={
			:set url ($url."sendPhoto\?chat_id=$chatId&photo=$mediaUrl")
			:if ([:len $text] > 0) do={:set url ($url."&caption=$text")}
			:if ([:len $mode] > 0) do={:set url ($url."&parse_mode=$mode")}
			:put $url
			/tool fetch url="$url" keep-result=no
		}
		:if ($type = "editMessage") do={
			:local toBeEdited [:toarray $edit]
			:put $toBeEdited
			:set url ($url."sendMessage\?chat_id=$chatId&text=$text")
			:put $url
			:local send ([/tool fetch mode=https http-method=get url=$url as-value output=user ]->"data")
			:local msgid [$getid key="message_id" text=$send]
			:if ([:len $delay] > 0) do={:delay $delay;}
			:foreach index in=$toBeEdited do={
				:local editurl ("https://api.telegram.org/bot$botToken/editMessageText\?chat_id=$chatId&message_id=$msgid&text=$index")
				:put $editurl
				/tool fetch url=$editurl
				:if ([:len $delay] > 0) do={:delay $delay;}
			}
		}
	}
	:if (([:len $type] < 1) and ([:len $text] > 0)) do={
		:set url ($url."sendMessage\?chat_id=$chatId&text=$text")
		:if ([:len $mode] > 0) do={set url ($url."&parse_mode=$mode")}
		:put $url
		/tool fetch url="$url" keep-result=no
	}
}