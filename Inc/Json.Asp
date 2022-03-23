<%
'json处理
Function parseJSON(str)
	dim scriptCtrl
    If Not IsObject(scriptCtrl) Then

        Set scriptCtrl = Server.CreateObject("MSScriptControl.ScriptControl")

        scriptCtrl.Language = "JScript"

        scriptCtrl.AddCode "Array.prototype.get = function(x) { return this[x]; }; var result = null;"

    End If

    scriptCtrl.ExecuteStatement "result = " & str & ";"

    Set parseJSON = scriptCtrl.CodeObject.result

End Function

'字典转Json
function dictionaryToJson(obj)
	dim s,c,key
	For Each s In obj
		key=s'phpno
		s=obj(key)'phpno 
		if c<>"" then
			c=c & ","
		end if
		c=c & key & ":"""& JsEncode__(s) &""""
	next
	c="[{"& c &"}]"
	dictionaryToJson=c
end function

%>