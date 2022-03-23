<%
'######################################################################
'引用别人20150724  这种引用虽然快，但最好是以后自己来写
'######################################################################
'Dim obj : Set obj = New Cls_AB_JSON
'call rw(obj.toJSON)

'call rw(getPostToJson())

'处理字符串到json 20170827  handleStrToJson("aa=11,bb=22,c=33") {"aa":"11","bb":"22","c":"33"}
function handleStrToJson(byval content)
	dim c,splstr,splxx,aspD,s,name,value
	set aspD = createObject("Scripting.Dictionary")
	c=replace(content,"\""","[|-双引号-|]")
	c=replace(content,"\=","[|-等号-|]")
	c=replace(content,"\,","[|-逗号-|]")
	splstr=split(c,",")
	for each s in splstr
		if instr(s,"=")>0 then
			splxx=split(s,"=")
			name=replace(splxx(0),"[|-双引号-|]","""")
			name=replace(name,"[|-等号-|]","=")
			name=replace(name,"[|-逗号-|]",",")
			value=replace(splxx(1),"[|-双引号-|]","""")
			value=replace(value,"[|-等号-|]","=")
			value=replace(value,"[|-逗号-|]",",")
			aspD.add name, value
		end if
	next
	
	handleStrToJson=json_encode(aspD)
end function

'转json
function  json_encode(o)
	Dim obj : Set obj = New Cls_AB_JSON
	 json_encode=obj.toJSON(o)
end function
Class Cls_AB_JSON
	Public Collection, Count, QuotedVars, Kind, StrEncode
	Private s_charset

	Private Sub Class_Initialize
		 '这时面删除了一些东西
	End Sub

	Private Sub Class_Terminate
		Set Collection = Nothing
	End Sub

	Public Property Let CharSet(ByVal s)
		s_charset = Ucase(s)
	End Property
	Public Property Get CharSet()
		CharSet = s_charset
	End Property

	'@ *****************************************************************************************
	'@ 属  性:  AB.Json.Kind 属性 (可读/可写)
	'@ 返  回:  Integer (整数) 返回0，表示是Json对象；返回1，表示是数组。
	'@ 作  用:  设置新建Json对象的类型，此属性可读可写
	'@ 			此属性可以设置和获取新建Json对象的类型，0表示是Json对象；1表示是数组。
	'@ 			如果是使用 AB.Json.New 方法建立的AspBox Json对象，则不用再指定此属性。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ 无
	'@ *****************************************************************************************

	'@ *****************************************************************************************
	'@ 属  性:  AB.Json.QuotedVars 属性 (可读/可写)
	'@ 语  法:  AB.Json.QuotedVars [ = boolean]
	'@ 返  回:  Boolean (布尔值) 当前设置的输出JSON字符串是否使用引号包含变量名称
	'@ 作  用:  设置是否在输出的JSON字符串的名称中使用引号，此属性可读可写
	'@ 			如果设置了此属性为真(True)，则输出的JSON字符串中的名称将包含引号，否则不包含引号。此属性默认为真(True)。
	'==DESC=====================================================================================
	'@ 参数 boolean: 为 True 则表示输出JSON字符串中名称用引号包含，为 False 则表示不用引号。默认为 True
	'==DEMO=====================================================================================
	'@ 在不设置此属性或者设置此属性为真(True)的情况下，输出的JSON字符串为以下格式：
	'@ {"name":"Ray", "country":"China", "city":"Leshan"}
	'@ 如果设置了此属性为假(False)，则输出的JSON字符串为以下格式：
	'@ {name:"Ray", country:"China", city:"Leshan"}
	'@ *****************************************************************************************

	'@ *****************************************************************************************
	'@ 属  性:  AB.Json.StrEncode 属性 (可读/可写)
	'@ 语  法:  AB.Json.StrEncode [ = boolean]
	'@ 返  回:  Boolean (布尔值) 当前是否设置输出的Json字符串要编码中文
	'@ 作  用:  设置输出的Json字符串是否编码中文，此属性可读可写
	'@ 			此属性可以设置输出的Json字符串是否编码中文等多字节字符。
	'@ 			如果用于javascript，为了避免产生乱码，通常是要编码的；
	'@ 			但如果用于特殊的场合，比如用于传入Flash中的ActionScript，则需要不编码中文字符。
	'@ 			此属性默认为真(True)，即要编码多字节字符。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ 无
	'@ *****************************************************************************************

	Public Function [New](ByVal k)
		Set [New] = New Cls_AB_JSON
		Select Case LCase(k)
			Case "0", "object" [New].Kind = 0
			Case "1", "array"  [New].Kind = 1
		End Select
	End Function

	Private Property Get Counter
		Counter = Count
		Count = Count + 1
	End Property

	'@ *****************************************************************************************
	'@ 属  性:  AB.Json.Pair 属性 (可读/可写)
	'@ 属  性:  AB.Json.Pair(name)[ = value] 别名 AB.Json(name) [ = value]
	'@ 返  回:  Object (ASP对象) 或 String (字符串) 返回相应对值中储存的值
	'@ 作  用:  设置Json对象中的对值，此属性可读可写
	'@ 			此属性是Json类的主要方法，即是对Json数据赋值的属性，
	'@ 			赋值时的值可以是字符串，也可以是另一个AspBox Json对象。
	'@ 			此属性在实际编写的过程中可以省略为 AB.Json(name) 。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ Dim jso : Set jso = ab.json.jsObject()
	'@ jso("a") = "x" : jso("b") = "y" : jso("c") = "z"
	'@ PrintCn jso.JsString '输出结果：{"a":"x","b":"y","c":"z"}
	'@ PrintCn jso.Pair("b") '输出结果：y
	'@ jso.Pair("b") = "-"
	'@ PrintCn jso.JsString '输出结果：{"a":"x","b":"-","c":"z"}
	'@ *****************************************************************************************

	Public Property Let Pair(Byval p, Byval v)
		If IsNull(p) Then p = Counter
		If vartype(v) = 9 Then
			If TypeName(v) = "Cls_AB_JSON" Then
				Set Collection(p) = v
			Else
				Collection(p) = v
			End If
		Else
			Collection(p) = v
		End If
	End Property

	Public Default Property Get Pair(Byval p)
		If IsNull(p) Then p = Count - 1
		If IsObject(Collection(p)) Then
			Set Pair = Collection(p)
		Else
			Pair = Collection(p)
		End If
	End Property

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.Clean 方法
	'@ 返  回:  无返回值
	'@ 作  用:  删除Json对象的全部对值，调用此方法可以删除AspBox Json对象中的全部对值。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ Dim jso : Set jso = ab.json.jsObject()
	'@ jso("a") = "x" : jso("b") = "y" : jso("c") = "z"
	'@ PrintCn jso.JsString '输出结果：{"a":"x","b":"y","c":"z"}
	'@ jso.Clean
	'@ PrintCn jso.JsString '输出结果：{}
	'@ *****************************************************************************************

	Public Sub Clean
		Collection.RemoveAll
	End Sub

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.Remove name
	'@ 返  回:  无返回值
	'@ 作  用:  删除Json对值中的一项，调用此方法可以删除AspBox Json对象中的某一项对值。
	'==DESC=====================================================================================
	'@ 参数 name : 删除Json对象中的某一项对值
	'==DEMO=====================================================================================
	'@ Dim jso : Set jso = ab.json.jsObject()
	'@ jso("a") = "x" : jso("b") = "y" : jso("c") = "z"
	'@ PrintCn jso.JsString '输出结果：{"a":"x","b":"y","c":"z"}
	'@ jso.Remove "b"
	'@ PrintCn jso.JsString '输出结果：{"a":"x","c":"z"}
	'@ *****************************************************************************************

	Public Sub Remove(Byval name)
		If Collection.Exists(name) Then Collection.Remove name
	End Sub

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.toJson Object
	'@ 别  名:  AB.Json.Stringify Object
	'@ 返  回:  String (字符串) 可直接用于Json对值中的值的字符串
	'@ 作  用:  将目标转化为Json对值中的值，
	'@ 			调用此方法可以把各种类型的数据转化为可直接用于Json对值中的值的字符串，
	'@ 			目标可以是字符串、数组、字典对象、Rs记录集等。
	'==DESC=====================================================================================
	'@ 参数 o : 可以是字符串，数组，对象
	'==DEMO=====================================================================================
	'@ Dim a(1,1) '数组
	'@ a(0,0) = "zero - zero"
	'@ a(0,1) = "zero - one"
	'@ a(1,0) = "one - zero"
	'@ a(1,1) = "one - one"
	'@ PrintCn AB.Json.toJSON(a) '输出结果：[["zero - zero","zero - one"],["one - zero","one - one"]]
	'@ Dim o_json : Set o_json = AB.Json.New(0) '可操作Json对象
	'@ o_json("name") = "Booty Music" : o_json("artist") = "Deepside"
	'@ PrintCn AB.Json.toJSON(o_json) '输出结果：{"name":"Booty Music","artist":"Deepside"}
	'@ 'Rem 高级语法:
	'@ PrintCn AB.Json.toJSON(AB.Dict) '输出Dictionary字典对象
	'@ PrintCn AB.Json.toJSON(AB.db.ExeC("SELECT id,name FROM [Table] WHERE id<=2")) '输出Rs记录集对象
	'@ -----------------------
	'@ Dim temp
	'@ temp = NULL '## NUll : null
	'@ temp = Date '## Date : "2012-2-4"
	'@ temp = "id=6" '## String : "id=6"
	'@ temp = Empty '## Empty : ""
	'@ temp = "" '## String : ""
	'@ temp = cdbl(1.2888) '## Double,Integer... : 1.2888
	'@ temp = array(1,2,"a",array("x","y")) '## Array :
	'@ temp = True  '## Boolean : true/false
	'@ Rem '## ==Object==
	'@ Set temp = Nothing '## Nothing : {}
	'@ Set temp = AB.Dict '## Dictionary : {"name":"Lajox","msg":"Hello World"}
	'@ Set temp = AB.db.ExeC("SELECT id,name FROM [LB_C_Media] WHERE id<=2") '## RecordSet : [{"id":1,"name":"The Dawn"},{"id":2,"name":"lubov"}]
	'@ Rem '## --
	'@ Dim dict_1 : Set dict_1 = new(ab.dictName)
	'@ Dim dict_2 : Set dict_2 = new(ab.dictName)
	'@ dict_1("id") = 1 : dict_1("name") = "The Dawn"
	'@ dict_2("id") = 2 : dict_2("name") = "lubov"
	'@ temp = Array(dict_1, dict_2) '## 综合型 : [t,{"id":1,"name":"The Dawn"},{"id":2,"name":"lubov"}]
	'@ PrintCn AB.Json.toJSON(temp)
	'@ '---------------------
	'@ ab.use "sc"
	'@ Dim sc : Set sc = ab.sc.new
	'@ sc.Lang = "js"
	'@ sc.Add "function jsobj(){ var person = {name: {a:'zhangsan'}, pass: '123', fn: function(){alert(this.name.a+':'+this.pass);} }; return person; }"
	'@ sc.Add "function jsarr(){ return [1,5,8,9]; }"
	'@ Dim x : set x = sc.eval("jsobj()")
	'@ Dim y : set y = sc.eval("jsarr()")
	'@ ab.trace(x)
	'@ ab.trace(y)
	'@ PrintCn x.pass '输出：123
	'@ ab.use "json"
	'@ PrintCn AB.Json.toJSON(x) '输出：{"name":{"a":"zhangsan"},"pass":"123"}
	'@ PrintCn AB.Json.toJSON(y) '输出：[1,5,8,9]
	'@ Dim str : str = "{name:'alonely', age:24, email:['test1@163.com','weed2@gmail.com'], family:{parents:['父亲','母亲']}}"
	'@ Dim z : set z = AB.Json.toObject(str)
	'@ PrintCn z.email.[0] '输出：test1@163.com
	'@ PrintCn z.family.parents.[0] '输出：父亲
	'@ *****************************************************************************************

	Public Function toJSON(Byval o)
		'On Error Resume Next
		Dim s,i,j : i = 0 : j = 0
		Dim bFI, bFJ, oCount, jsLib, jso
		Dim tempJsDir : tempJsDir = "/" '目录：“AspBox/jsLib/core/”
		Dim tempJsonJs : tempJsonJs = "json2.js"			'这个是没用的，不知道它干嘛用的
		Dim tempJsonJsPath : tempJsonJsPath = tempJsDir&tempJsonJs '文件路径：“AspBox/jsLib/core/json2.js”
		'call echo(ubound(a),VarType(o))
		Select Case VarType(o)
			Case 1 'Null
				toJSON = "null"
			Case 7 'Date
				toJSON = """" & JsEncode__(CStr(o)) & """"
			Case 8 'String 
				Select Case TypeName(o)
					Case "IRequest", "IRequestDictionary" 'Request.QueryString/Request.Form/Request.Cookies
						If o = Request.QueryString Or o = Request.Form Or o = Request.Cookies Then
							bFI = True
							toJSON = toJSON & "{"
							For Each i In o
								If bFI Then bFI = False Else toJSON = toJSON & ","
								toJSON = toJSON & IIF(QuotedVars, """" & IIF(StrEncode,JSEncode(i),JSEncode__(i)) & """", JsEncode__(i)) & ":" & toJSON(o(i))
							Next
							toJSON = toJSON & "}"
						End If
					Case "JScriptTypeInfo"
						If isFile(tempJsonJsPath) Then
							AB.Use "jsLib"
							Set jsLib = AB.jsLib.New
							jsLib.BasePath = tempJsDir
							jsLib.Inc(tempJsonJs)
							Set jso = jsLib.Object
							toJSON = jso.toString(o)
							Set jso = Nothing
							Set jsLib = Nothing
						Else
							toJSON = o
						End If
					Case Else
						If o="" Then
							toJSON = """"""
						Else 
							toJSON = """" & IIF(StrEncode,JSEncode(o),JSEncode__(o)) & """"
						End If
				End Select
			Case 9 'Object
				Select Case TypeName(o)
					Case "Nothing","Empty"
						toJSON = "{}"
					Case "Recordset"
						If o.State = 0 Then '此记录集对象已关闭
							toJSON = "[]"
						Else
							If IsNul(o) Then '此记录集对象为空记录集，没有数据
								toJSON = "[]"
							Else
								On Error Resume Next
								Set o = o.Clone
								On Error Goto 0
								If o.RecordCount = 1 Then '单条记录集,记录字段名,字段值
									bFI = True
									toJSON = toJSON & "[{"
									For j = 0 To o.Fields.Count-1
										If bFI Then bFI = False Else toJSON = toJSON & ","
										If QuotedVars Then
											toJSON = toJSON & """" & IIF(StrEncode,JSEncode(lcase(o.Fields(j).Name)),JSEncode__(lcase(o.Fields(j).Name))) & """:" & toJSON(o.Fields(j).Value)
										Else
											toJSON = toJSON & IIF(StrEncode,JSEncode(lcase(o.Fields(j).Name)),JSEncode__(lcase(o.Fields(j).Name))) & ":" & toJSON(o.Fields(j).Value)
										End If
									Next
									toJSON = toJSON & "}]"
								Else
									bFJ = True
									toJSON = toJSON & "["
									o.MoveFirst
									Do While Not o.Eof
										If bFJ Then bFJ = False Else toJSON = toJSON & ","
										bFI = True
										toJSON = toJSON & "{"
										For j = 0 To o.Fields.Count-1
											If bFI Then bFI = False Else toJSON = toJSON & ","
											If QuotedVars Then
												toJSON = toJSON & """" & IIF(StrEncode,JSEncode(lcase(o.Fields(j).Name)),JSEncode__(lcase(o.Fields(j).Name))) & """:" & toJSON(o.Fields(j).Value)
											Else
												toJSON = toJSON & IIF(StrEncode,JSEncode(lcase(o.Fields(j).Name)),JSEncode__(lcase(o.Fields(j).Name))) & ":" & toJSON(o.Fields(j).Value)
											End If
										Next
										toJSON = toJSON & "}"
										i = i + 1
										o.MoveNext
									Loop
									toJSON = toJSON & "]"
								End If
							End If
						End If
					Case "Dictionary", "IRequest", "IRequestDictionary", "IApplicationObject", "ISessionObject"
						If TypeName(o) = "IRequest" Then
							Dim req : Set req = Server.CreateObject(AB.dictName)
							req.add "clientcertificate", o.ClientCertificate
							req.add "cookies", o.cookies
							req.add "form", o.form
							req.add "querystring", o.queryString
							req.add "servervariables", o.serverVariables
							req.add "totalbytes", o.totalBytes
							toJSON = toJSON(req)
						ElseIf TypeName(o) = "IApplicationObject" Or TypeName(o) = "ISessionObject" Then
							oCount = o.Contents.Count
							If oCount = 0 Then '此对象是空的，还没有任何键值
								toJSON = "{}"
							Else 'Application对象、Session对象等
								bFI = True
								toJSON = toJSON & "{"
								For Each i In o.Contents
									If bFI Then bFI = False Else toJSON = toJSON & ","
									toJSON = toJSON & IIF(QuotedVars, """" & IIF(StrEncode,JSEncode(i),JSEncode__(i)) & """", IIF(StrEncode,JSEncode(i),JSEncode__(i))) & ":" & toJSON(o(i))
								Next
								toJSON = toJSON & "}"
							End If
						ElseIf TypeName(o) = "Dictionary" Then
							oCount = o.Count
							If oCount = 0 Then '此对象是空的，还没有任何键值
								toJSON = "{}"
							Else 'Dictionary对象
								bFI = True
								toJSON = toJSON & "{"
								For Each i In o
									If bFI Then bFI = False Else toJSON = toJSON & ","
									toJSON = toJSON & """" & IIF(QuotedVars, """" & IIF(StrEncode,JSEncode(i),JSEncode__(i)) & """", IIF(StrEncode,JSEncode(i),JSEncode__(i))) & """:" & toJSON(o(i))
								Next
								toJSON = toJSON & "}"
							End If
						Else
							bFI = True
							toJSON = toJSON & "{"
							For Each i In o
								If bFI Then bFI = False Else toJSON = toJSON & ","
								toJSON = toJSON & IIF(QuotedVars, """" & IIF(StrEncode,JSEncode(i),JSEncode__(i)) & """", IIF(StrEncode,JSEncode(i),JSEncode__(i))) & ":" & toJSON(o(i))
							Next
							toJSON = toJSON & "}"
						End If
					Case "Cls_AB_JSON"
						bFI = True
						toJSON = toJSON & IIF(o.Kind, "[", "{")
						For Each i In o.Collection
							If bFI Then bFI = False Else toJSON = toJSON & ","
							toJSON = toJSON & IfThen(o.Kind=0, IIF(QuotedVars, """" & IIF(StrEncode,JSEncode(i),JSEncode__(i)) & """", IIF(StrEncode,JSEncode(i),JSEncode__(i))) & ":") & toJSON(o(i))
						Next
						toJSON = toJSON & IIF(o.Kind, "]", "}")
					Case "JScriptTypeInfo"
						If isFile(tempJsonJsPath) Then
							AB.Use "jsLib"
							Set jsLib = AB.jsLib.New
							jsLib.BasePath = tempJsDir
							jsLib.Inc(tempJsonJs)
							Set jso = jsLib.Object
							toJSON = jso.toString(o)
							Set jso = Nothing
							Set jsLib = Nothing
						Else
							toJSON = "{}"
						End If
					Case "VBScriptTypeInfo"
						toJSON = "{}"
					Case Else 'e.g. TypeName(Server) = "IServer"
						toJSON = "{}"
				End Select
			Case 11 'Boolean
				toJSON = IIF(o, "true", "false")
			Case 12, 8192, 8204, 8209 'Array
				toJSON = RenderArray(o, 1, "")
			Case 2, 3, 17, 19  'int, long, byte
				toJSON = CLng(o)
			Case 4, 5, 6, 14  'single, double, currency
				toJSON = Replace(CDbl(o), ",", ".")
			Case Else
				toJSON = """" & IIF(StrEncode,JSEncode(Cstr(o)),JSEncode__(Cstr(o))) & """"
		End select
		'On Error Goto 0
	End Function
	
	'数据转JSON，根据自己定义的字段显示 20150727
	function fieldToJson(rs,byval setFieldList)
		dim bFI, c,fieldName,fieldValue,j
		setFieldList = "|" & LCase(setFieldList) & "|"
		bFI = True
		c = c & "{"
		while not rs.eof
		For j = 0 To rs.Fields.Count-1
			fieldName = rs.Fields(j).Name
			fieldValue = rs.Fields(j).Value
			'存在字段则操作
			if instr(setFieldList,"|"& LCase(fieldName) &"|")>0 then
				If bFI Then bFI = False Else c = c & ","
				If QuotedVars Then
					c = c & """" & IIF(StrEncode,JSEncode(fieldName),JSEncode__(fieldName)) & """:" & toJSON(fieldValue)
				Else
					c = c & IIF(StrEncode,JSEncode(fieldName),JSEncode__(fieldName)) & ":" & toJSON(fieldValue)
				End If
			end if
		Next
		c = c & "}"
		rs.movenext:wend:rs.close
		c= "["& c &"]"		
		fieldToJson = c
	end function
	
	'使成为数组 
	Private Function RenderArray(Byval arr, Byval depth, Byval parent)
		'call echo("arr",ubound(arr)):doevents
		Dim first : first = LBound(arr, depth)
		Dim last : last = UBound(arr, depth)
		Dim index, rendered
		Dim limiter : limiter = ","
		RenderArray = "["
		For index = first To last
			If index = last Then
				limiter = ""
			End If
			On Error Resume Next
			rendered = RenderArray(arr, depth + 1, parent & index & "," )
			If Err = 9 Then
				On Error GoTo 0
				RenderArray = RenderArray & toJSON(Eval("arr(" & parent & index & ")")) & limiter
			Else
				RenderArray = RenderArray & rendered & "" & limiter
			End If
		Next
		RenderArray = RenderArray & "]"
	End Function
	
	Public Function JsEncode(ByVal s)
		If isNul(s) Then JsEncode = "" : Exit Function
		Dim arr1, arr2, i, j, c, p, t
		arr1 = Array(&h27,&h22,&h5C,&h2F,&h08,&h0C,&h0A,&h0D,&h09)
		arr2 = Array(&h27,&h22,&h5C,&h2F,&h62,&h66,&h6E,&h72,&h749)
		For i = 1 To Len(s)
			p = True
			c = Mid(s, i, 1)
			For j = 0 To Ubound(arr1)
				If c = Chr(arr1(j)) Then
					t = t & "\" & Chr(arr2(j))
					p = False
					Exit For
				End If
			Next
			If p Then
				Dim a
				a = AscW(c)
				If a > 31 And a < 127 Then
					t = t & c
				ElseIf a > -1 Or a < 65535 Then
					t = t & "\u" & String(4 - Len(Hex(a)), "0") & Hex(a)
				End If
			End If
		Next
		JsEncode = t
		'call echo("JsEncode s",s & "t=" & t)
	End Function
	Private Function JsEncode__(ByVal s)
		'call echo("JsEncode__",s)
		If isNul(s) Then JsEncode__ = "" : Exit Function
		Dim arr1, arr2, i, j, c, p, t
		arr1 = Array(&h27,&h22,&h5C,&h2F,&h08,&h0C,&h0A,&h0D,&h09)
		arr2 = Array(&h27,&h22,&h5C,&h2F,&h62,&h66,&h6E,&h72,&h749)
		For i = 1 To Len(s)
			p = True
			c = Mid(s, i, 1)
			For j = 0 To Ubound(arr1)
				If c = Chr(arr1(j)) Then
					t = t & "\" & Chr(arr2(j))
					p = False
					Exit For
				End If
			Next
			If p Then t = t & c
		Next
		JsEncode__ = t
	End Function
	
	Public Function Stringify(Byval o)
		Stringify = toJSON(o)
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.JsString 方法
	'@ 返  回:  String (字符串) Json格式字符串
	'@ 作  用:  用当前Json对象生成Json字符串
	'@ 			调用此方法可以把当前AspBox Json对象直接以Json格式转化为字符串。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ Dim jsa : Set jsa = ab.json.jsArray()
	'@ jsa(0) = "a" : jsa(1) = "b" : jsa(2) = "c"
	'@ PrintCn jsa.JsString '输出结果：["a","b","c"]
	'@ PrintCn AB.Json.toStr(jsa) '输出结果：["a","b","c"]
	'@ *****************************************************************************************

	Public Property Get jsString
		jsString = toJSON(Me)
	End Property

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.toObject(s) 方法
	'@ 别  名:  AB.Json.Parse(s)
	'@ 返  回:  ASP实体，可以是对象，也可以是其他类型
	'@ 作  用:  将字符串转化为ASP实体, json字符串将转为JS Object对象
	'==DESC=====================================================================================
	'@ 参数 s : 字符串
	'==DEMO=====================================================================================
	'# Dim strTest
	'# 'strTest = "{name:'alonely', age:24, email:['test1@163.com','weed2@gmail.com'], family:{parents:['父亲','母亲']}, func:function(){} }"
	'# 'strTest = "{name:""alonely"", age:24, email:[""test1@163.com"",""weed2@gmail.com""], family:{parents:[""父亲"",""母亲""],toString:function(){return ""家庭成员"";}}}"
	'# strTest = "{name:'alonely', age:24, email:['test1@163.com','weed2@gmail.com'], family:{parents:['父亲','母亲']}}"
	'# Dim objTest
	'# AB.Use "json"
	'# Set objTest = AB.Json.toObject(strTest)
	'# AB.Trace objTest
	'# PrintCn objTest.name & "的邮件地址是" & objTest.email.[0] '输出：alonely的邮件地址是ycplxl1314@163.com
	'# PrintCn "共有邮件地址" & objTest.email.length & "个" '输出：共有邮件地址2个
	'# PrintCn objTest.family.parents.[0] '输出：父亲
	'# Dim father
	'# AB.Json.setJSArrayItem father, objTest.family.parents, 0
	'# PrintCn father '输出：父亲
	'# PrintCn ab.json.getJSArrayItem(objTest.family.parents, 0) '输出：父亲
	'@ *****************************************************************************************

	Public Function toObject(Byval o)
		On Error Resume Next
		If Err Then Err.Clear
		Dim i,j : i = 0 : j = 0
		Dim Sc, jsLib, jso, temp
		Dim tempJsDir : tempJsDir = AB.BasePath & "jsLib/core/" '目录：“AspBox/jsLib/core/”
		Dim tempJsonJs : tempJsonJs = "json2.js"
		Dim tempJsonJsPath : tempJsonJsPath = tempJsDir&tempJsonJs '文件路径：“AspBox/jsLib/core/json2.js”
		Select Case VarType(o)
			Case 9 'vbObject
				Set toObject = o
			Case 8 'vbString
				Select Case TypeName(o)
					Case "JScriptTypeInfo"
						If isFile(tempJsonJsPath) Then
							AB.Use "jsLib"
							Set jsLib = AB.jsLib.New
							jsLib.BasePath = tempJsDir
							jsLib.Inc(tempJsonJs)
							Set jso = jsLib.Object
							If IsObject(jso.toObject(o)) Then Set toObject = jso.toObject(o) Else toObject = jso.toObject(o)
							Set jso = Nothing
							Set jsLib = Nothing
						Else
							toObject = o
						End If
					Case "String"
						If LCase(o) = "null" Then 'null
							toObject = Null
						ElseIf LCase(o) = "empty" Then 'empty
							toObject = Empty
						ElseIf o = "" Or o = """""" Then 'empty
							toObject = ""
						ElseIf LCase(o) = "nothing" Then 'nothing
							Set toObject = Nothing
						ElseIf LCase(o) = "true" Or LCase(o) = "false" Then 'boolean
							toObject = CBool(o)
						ElseIf isInt(o) Then 'int, long, byte
							toObject = CLng(o)
						ElseIf Test(o,"double") Then  'single, double
							toObject = CDbl(o)
						ElseIf Test(o,"date") Then  'Date
							toObject = CDate(o)
						Else
							' If RegTest(Trim(o),"^\s*[(""']*[\{].*?[\}][""')]*\s*$") Or RegTest(Trim(o),"^\s*[(""']*[\[].*?[\]][""')]*\s*$") Then 'json format
								' o = RegReplace(Trim(o),"^\s*[(""']*([\{].*?[\}])[""')]*\s*$","$1")
								' o = RegReplace(Trim(o),"^\s*[(""']*([\[].*?[\]])[""')]*\s*$","$1")
								' If isFile(tempJsonJsPath) Then
									' AB.Use "jsLib"
									' Set jsLib = AB.jsLib.New
									' jsLib.BasePath = tempJsDir
									' jsLib.Inc(tempJsonJs)
									' Set jso = jsLib.Object
									' If IsObject(jso.toObject(o)) Then Set temp = jso.toObject(o) Else temp = jso.toObject(o)
									' Set jso = Nothing
									' Set jsLib = Nothing
								' Else
									' If IsObject(Me.jsEval(o)) Then Set temp = Me.jsEval(o) Else temp = Me.jsEval(o)
								' End If
								' If IsObject(temp) Then Set toObject = temp Else toObject = temp
							' End If
							'o = RegReplace(Trim(o),"^\s*[(""']*([\{].*?[\}])[""')]*\s*$","$1")
							'o = RegReplace(Trim(o),"^\s*[(""']*([\[].*?[\]])[""')]*\s*$","$1")
							AB.Use "Sc"
							Set Sc = AB.Sc.New
							Sc.Lang = "js"
							Sc.Add "var jsonObject = " & o & ";"
							If IsObject(Sc.CodeObject.jsonObject) Then Set toObject = Sc.CodeObject.jsonObject Else Set toObject = Nothing
						End If
					Case Else
						'toObject = o
						If IsObject(Me.jsEval(o)) Then Set temp = Me.jsEval(o) Else temp = Me.jsEval(o)
						If IsObject(temp) Then Set toObject = temp Else toObject = temp
				End Select
			Case Else
				'toObject = o
				If IsObject(Me.jsEval(o)) Then Set temp = Me.jsEval(o) Else temp = Me.jsEval(o)
				If IsObject(temp) Then Set toObject = temp Else toObject = temp
		End select
		If Err Then : toObject = o : Err.Clear : End If
		On Error Goto 0
	End Function


	Public Function Parse(Byval o)
		If IsObject(toObject(o)) Then Set Parse = toObject(o) Else Parse = toObject(o)
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.setJSArrayItem(o, objJSArray, index) 方法
	'@ 返  回:  void
	'@ 作  用:  设置变量o值为objJSArray数组的index索引项值
	'==DESC=====================================================================================
	'@ 参数 o 			[Any] 		: 变量o
	'@ 参数 objJSArray 	[Object] 	: JS Array 对象
	'@ 参数 index 		[Integer] 	: JS Array的索引
	'==DEMO=====================================================================================
	'# Dim strTest
	'# strTest = "{name:'alonely', age:24, email:['test1@163.com','weed2@gmail.com'], family:{parents:['父亲','母亲']}}"
	'# Dim objTest
	'# AB.Use "json"
	'# Set objTest = AB.Json.toObject(strTest)
	'# PrintCn objTest.family.parents.[0] '输出：父亲
	'# Dim father
	'# AB.Json.setJSArrayItem father, objTest.family.parents, 0
	'# PrintCn father '输出：父亲
	'# PrintCn ab.json.getJSArrayItem(objTest.family.parents, 0) '输出：父亲
	'@ *****************************************************************************************

	Public Sub setJSArrayItem(ByRef o, ByVal objJSArray, ByVal index)
		On Error Resume Next
		AB.Use "Sc"
		Dim Sc : Set Sc = AB.Sc.New
		Sc.Lang = "js"
		Sc.Add "var itemTemp=null; function setJSArray(arr, index){try { itemTemp = arr[index]; } catch(e) { itemTemp = null; }}"
		Sc.Run "setJSArray", Array(objJSArray, index)
		Set o = Sc.CodeObject.itemTemp
		If Err.number=0 Then
			Exit Sub
		End If
		o = Sc.CodeObject.itemTemp
		On Error Goto 0
	End Sub

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.getJSArrayItem(objJSArray, index) 方法
	'@ 返  回:  void
	'@ 作  用:  获取objJSArray数组的index索引项值
	'==DESC=====================================================================================
	'@ 参数 objJSArray 	[Object] 	: JS Array 对象
	'@ 参数 index 		[Integer] 	: JS Array的索引
	'==DEMO=====================================================================================
	'# Dim strTest
	'# strTest = "{name:'alonely', age:24, email:['test1@163.com','weed2@gmail.com'], family:{parents:['父亲','母亲']}}"
	'# Dim objTest
	'# AB.Use "json"
	'# Set objTest = AB.Json.toObject(strTest)
	'# PrintCn objTest.family.parents.[0] '输出：父亲
	'# PrintCn ab.json.getJSArrayItem(objTest.family.parents, 0) '输出：父亲
	'@ *****************************************************************************************

	Public Function getJSArrayItem(ByVal objJSArray, ByVal index)
		On Error Resume Next
		AB.Use "Sc"
		Dim Sc : Set Sc = AB.Sc.New
		Sc.Lang = "js"
		Sc.Add "function getJSArray(arr, index){var temp=null; try { temp = arr[index]; } catch(e) {} return temp;}"
		If IsObject(Sc.Run("getJSArray", Array(objJSArray, index))) Then
			Set getJSArrayItem = Sc.Run("getJSArray", Array(objJSArray, index))
		Else
			getJSArrayItem = Sc.Run("getJSArray", Array(objJSArray, index))
		End If
		On Error Goto 0
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.jsEval(o) 方法
	'@ 返  回:  js对象
	'@ 作  用:  将字符串转为js对象
	'==DESC=====================================================================================
	'@ 参数 s : 字符串
	'==DEMO=====================================================================================
	'# Dim str : str = "{name:'alonely', age:24, email:['test1@163.com','weed2@gmail.com'], family:{parents:['父亲','母亲']}}"
	'# Dim temp
	'# AB.Use "json"
	'# If IsObject(AB.Json.jsEval(str)) Then Set temp = AB.Json.jsEval(str) Else temp = AB.Json.jsEval(str)
	'# AB.Trace temp
	'@ *****************************************************************************************

	Public Function jsEval(Byval o)
		On Error Resume Next
		If Err Then Err.Clear
		Dim Sc, jsLib, jso, temp
		AB.Use "Sc"
		Set Sc = AB.Sc.New
		Sc.Lang = "js"
		Sc.Add "function toEval(str) { var _temp = null; try { eval('_temp = (' + str + ');'); } catch(e) { _temp = null; } return (_temp);}"
		Set jso = Sc.Object
		If IsObject(jso.toEval(o)) Then Set jsEval = jso.toEval(o) Else jsEval = jso.toEval(o)
		Set jso = Nothing
		Set Sc = Nothing
		If Err.Number <> 0 Then : Err.Clear : jsEval = o : End If
		On Error Goto 0
	End Function

	Public Function vbEval(Byval o)
		On Error Resume Next
		If Err Then Err.Clear
		If IsObject(Eval(o)) Then Set vbEval = Eval(o) Else vbEval = Eval(o)
		If Err.Number <> 0 Then : Err.Clear : vbEval = o : End If
		On Error Goto 0
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.JSArrayToVBArray 方法
	'@ 返  回:  Array (VB数组)
	'@ 作  用:  将当前JS数组对象 转成 VB数组
	'==DESC=====================================================================================
	'@ 参数 jsArr: [Object] JS数组对象
	'==DEMO=====================================================================================
	'@ ab.use "sc"
	'@ Dim sc : Set sc = ab.sc.new
	'@ sc.Lang = "js"
	'@ sc.Add "function foo(){ return [1,5,8,9]; }"
	'@ Dim s,y,x
	'@ set x = sc.eval("foo();") 'js数组对象
	'@ 'Response.Write x.[2]
	'@ ab.use "json"
	'@ Dim temp : temp = AB.Json.JSArrayToVBArray(x) '返回vb数组
	'@ AB.Trace(temp)
	'@ *****************************************************************************************

	Public Function JSArrayToVBArray(ByVal jsArr)
		On Error Resume Next
		Dim temp, myVBArray
		If TypeName(jsArr) = "JScriptTypeInfo" Then
			temp = jsArr.join("{@Lx.Split@}") '先将 JSArray 转化为 [字符串]
			myVBArray = Split(temp, "{@Lx.Split@}") '再将 [字符串] 转化为 VBArray
		End If
		JSArrayToVBArray = myVBArray
		On Error Goto 0
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.VBArrayToJSArray 方法
	'@ 返  回:  Object (JS数组对象)
	'@ 作  用:  将当前VB数组 转成 JS数组对象
	'==DESC=====================================================================================
	'@ 参数 vbArr: [Array] VB数组
	'==DEMO=====================================================================================
	'@ Dim arr
	'@ arr = Array(1,3,8,7)
	'@ AB.Use "json"
	'@ Dim temp : Set temp = AB.Json.VBArrayToJSArray(arr) '返回js数组对象
	'@ AB.Trace(temp)
	'@ PrintCn AB.Json.toJSON(arr) '输出：[1,3,8,7]
	'@ PrintCn AB.Json.toJSON(temp) '输出：[1,3,8,7]
	'@ Dim obj : Set obj = AB.Json.toObject(AB.Json.toJSON(temp))
	'@ AB.Trace(obj)
	'@ PrintCn obj.[0]
	'@ *****************************************************************************************

	Public Function vbArrayToJSArray(ByVal vbArr)
		On Error Resume Next
		AB.Use "Sc"
		Dim objSC : Set objSC = AB.Sc.New
		objSC.Lang = "js"
		Dim objModule : Set objModule = objSC.Modules.Add("NewModule")
		objModule.AddCode "function jsVBArrayToJSArray(vbArr){ var temp = new VBArray(vbArr); return temp.toArray(); }"
		Dim objCodeObject : Set objCodeObject = objModule.CodeObject
		If IsObject(objCodeObject.jsVBArrayToJSArray(vbArr)) Then
			Set VBArrayToJSArray = objCodeObject.jsVBArrayToJSArray(vbArr)
		Else
			VBArrayToJSArray = objCodeObject.jsVBArrayToJSArray(vbArr)
		End If
		On Error Goto 0
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.Flush 方法
	'@ 返  回:  Stream (流数据) Json文件
	'@ 作  用:  用当前Json对象向浏览器输出Json文件
	'@ 			调用此方法可以用当前Json对象向浏览器直接输出Json文件，即输出的内容的ContentType是"application/json"。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ AB.Json.Flush
	'@ *****************************************************************************************

	Public Sub Flush
		Response.Clear()
		Response.Charset = s_charset
		Response.ContentType = "application/json"
		NoCache()
		If TypeName(Response) <> "Empty" Then
			Put jsString
		ElseIf WScript <> Empty Then
			WScript.Echo(jsString)
		End If
	End Sub

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.Clone 方法
	'@ 返  回:  AspBox Json对象
	'@ 作  用:  复制当前Json对象为新的AspBox Json对象
	'@ 			调用此方法可以复制当前Json对象为新的AspBox Json对象，原来的Json对象不受影响。
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ Dim jsa : Set jsa = ab.json.jsArray()
	'@ jsa(0) = "a" : jsa(1) = "b" : jsa(2) = "c"
	'@ Dim jsb : Set jsb = jsa.Clone
	'@ jsb(3) = "d" : jsb(4) = "e"
	'@ PrintCn AB.Json.toStr(jsa) '输出结果：["a","b","c"]
	'@ PrintCn AB.Json.toStr(jsb) '输出结果：["a","b","c","d","e"]
	'@ *****************************************************************************************

	Public Function Clone
		Set Clone = ColClone(Me)
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.jsObject 方法
	'@ 返  回: 	Object (对象)
	'@ 作  用:  创建Json对象
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ Dim member
	'@ Set member = ab.json.jsObject() '等同于： Set member = AB.Json.New(0)
	'@ member("name") = "Turul"
	'@ member("surname") = "Topuz"
	'@ member("message") = "Hello World"
	'@ member.Flush '输出结果：{"name":"Tu\u011Frul","surname":"Topuz","message":"Hello World"}
	'@ *****************************************************************************************

	Public Function jsObject
		Set jsObject = AB.Json.New(0)
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.jsArray 方法
	'@ 返  回: 	Array (数组)
	'@ 作  用:  创建Json数组
	'==DESC=====================================================================================
	'@ 参数: 无
	'==DEMO=====================================================================================
	'@ Dim jsa : Set jsa = ab.json.jsArray() '等同于： Set jsa = AB.Json.New(1)
	'@ jsa(0) = "a" : jsa(1) = "b" : jsa(2) = "c"
	'@ jsa.Flush '输出结果：["a","b","c"]
	'@ *****************************************************************************************

	Public Function jsArray
		Set jsArray = AB.Json.New(1)
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.toStr 方法
	'@ 返  回: 	String (字符串)
	'@ 作  用:  根据数据类型返回字符串 [以(js object)或(js array)形式]
	'==DESC=====================================================================================
	'@ 参数 o: String/Object/Array 字符串/对象(Json对象、字典对象、记录集对象等)/数组
	'==DEMO=====================================================================================
	'@ PrintCn AB.Json.toStr("hello world")
	'@ PrintCn AB.Json.toStr(Array("a","b","c"))
	'@ PrintCn AB.Json.toStr(AB.Dict)
	'@ PrintCn AB.Json.toStr(AB.db.ExeC("SELECT id,name FROM [Table] WHERE id<=2"))
	'@ *****************************************************************************************

	Public Function toStr(Byval o)
		toStr = AB.Json.toJSON(o)
	End Function

	'@ *****************************************************************************************
	'@ 过程名:  AB.Json.QueryToJSON 方法
	'@ 返  回:  AspBox Json对象
	'@ 作  用:  查询数据库并返回Json对象
	'==DESC=====================================================================================
	'@ 参数 dbconn: 数据库连接对象
	'@ 参数 sql: 要执行的SQL语句
	'==DEMO=====================================================================================
	'@ Dim dbJson : Set dbJson = AB.Json.QueryToJSON(AB.db.Conn, "SELECT id,name FROM [Table] WHERE id <= 2")
	'@ dbJson.Flush
	'@ Put AB.Json.toJSON(dbJson) '返回形式：[{"id":1,"name":"The Dawn"},{"id":2,"name":"lubov"}]
	'@ *****************************************************************************************

	Public Function QueryToJSON(Byval dbconn, Byval sql)
		On Error Resume Next
		Dim Rs, jsa, Col, tpobj
		Set jsa = jsArray()
		If Not IsObject(dbconn) Or TypeName(dbconn)<>"Connection" Then:Err.Clear:Set QueryToJSON=jsa:Exit Function:End If
		Set Rs = dbconn.Execute(sql)
		If Err.Number<>0 Then : Err.Clear : Set QueryToJSON = jsa : Exit Function : End If
		Dim i : i = 0
		Do While Not (Rs.EOF Or Rs.BOF)
			Set tpobj = jsObject()
			jsa(i) = tpobj
			For Each Col In Rs.Fields
				jsa(i)(Col.Name) = Col.Value
			Next
			i = i + 1
			Set tpobj = Nothing
			Rs.MoveNext
		Loop
		Rs.Close : Set Rs = Nothing
		Set QueryToJSON = jsa
		On Error Goto 0
	End Function



	Private Function ColClone(Byval core)
		Dim jsc, i
		Set jsc = new Cls_AB_JSON
		jsc.Kind = core.Kind
		For Each i In core.Collection
			If IsObject(core(i)) Then
				Set jsc(i) = ColClone(core(i))
			Else
				jsc(i) = core(i)
			End If
		Next
		Set ColClone = jsc
	End Function



	Private Function Escape__(Byval s)
		Dim cDoubleQuote, cRevSolidus, cSolidus
		cDoubleQuote = &h22
		cRevSolidus = &h5C
		cSolidus = &h2F
		Dim i, cur, temp
		For i = 1 To (Len(s))
			cur = Mid(s, i, 1)
			If AscW(cur) > &h00 and AscW(cur) < &h1F Then
				cur = EscapeQuence(cur)
			ElseIf AscW(cur) >= &hC280 and AscW(cur) <= &hC2BF Then
				cur = "\u00" + Right(padLeft(hex(AscW(cur) - &hC200), 2, 0), 2)
			ElseIf AscW(cur) >= &hC380 and AscW(cur) <= &hC3BF Then
				cur = "\u00" + Right(padLeft(hex(AscW(cur) - &hC2C0), 2, 0), 2)
			Else
				Select Case AscW(cur)
					Case cDoubleQuote: cur = EscapeQuence(cur)
					Case cRevSolidus: cur = EscapeQuence(cur)
					Case cSolidus: cur = EscapeQuence(cur)
				End Select
			End If
			temp = temp & cur
		Next
		Escape__ = temp
	End Function
	Private Function EscapeQuence(Byval digit)
		EscapeQuence = "\u00" + Right(padLeft(hex(AscW(digit)), 2, 0), 2)
	End Function
	Private Function padLeft(Byval value, Byval totalLength, Byval paddingChar)
		padLeft = Right(cloneIt(paddingChar, totalLength) & value, totalLength)
	End Function
	private Function cloneIt(Byval str, Byval n)
		Dim i:For i = 1 To n : cloneIt = cloneIt & str : Next
	End Function

End Class
%>