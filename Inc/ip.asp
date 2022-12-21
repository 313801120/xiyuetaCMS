<%
class tqqwry
	dim country,localstr,buf,offset
	private startip,endip,countryflag
	public qqwryfile
	public firststartip,laststartip,recordcount
	private stream,endipoff
	
	private sub class_initialize
		country=""
		localstr=""
		startip=0
		endip=0
		countryflag=0
		firststartip=0
		laststartip=0
		endipoff=0 
		qqwryfile=server.mappath(ipMDBPath)			'IP数据库
	end sub

	function ipToint(ip) 
		if instr(ip,":")>0 then ip="127.0.0.1"
		dim iparray,i
		iparray=split(ip,".",-1)
		for i=0 to 3
			if not isnumeric(iparray(i)) then iparray(i)=0
			if cint(iparray(i))<0 then iparray(i)=Abs(cint(iparray(i)))
			if cint(iparray(i))>255 then iparray(i)=255
		next
		ipToint=(cint(iparray(0))*256*256*256)+(cint(iparray(1))*256*256)+(cint(iparray(2))*256)+cint(iparray(3))
	end function

	function intToip(intvalue)
		p4=intvalue-fix(intvalue/256)*256
		intvalue=(intvalue-p4)/256
		p3=intvalue-fix(intvalue/256)*256
		intvalue=(intvalue-p3)/256
		p2=intvalue-fix(intvalue/256)*256
		intvalue=(intvalue-p2)/256
		p1=intvalue
		intToip=cstr(p1)&"."&cstr(p2)&"."&cstr(p3)&"."&cstr(p4)
	end function

	private function getstartip(recno)
		offset=firststartip+recno*7
		stream.position=offset
		buf=stream.Read(7)
		endipoff=AscB(MidB(buf,5,1))+(AscB(MidB(buf,6,1))*256)+(AscB(MidB(buf,7,1))*256*256)
		startip=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)+(AscB(MidB(buf,4,1))*256*256*256)
		getstartip=startip
	end function

	private function getendip()
		stream.position=endipoff
		buf=stream.Read(5)
		endip=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)+(AscB(MidB(buf,4,1))*256*256*256)
		countryflag=AscB(MidB(buf,5,1))
		getendip=endip
	end function

	private sub Getcountry(ip)
		if (countryflag=1 or countryflag=2) then
			country=getflagstr(endipoff+4)
			if countryflag=1 then
				localstr=getflagstr(stream.position)
				'以下用来获取数据库版本信息
				if ip>=ipToint("255.255.255.0") and ip<=ipToint("255.255.255.255") then
					localstr=getflagstr(endipoff+21)
					country=getflagstr(endipoff+12)
				end if
			else
				localstr=getflagstr(endipoff + 8)
			end if
		else
			country=getflagstr(endipoff+4)
			localstr=getflagstr(stream.position)
		end if
		'过滤数据库中的无用信息
		country=trim(country)
		localstr=trim(localstr)
		if instr(country,"CZ88.NET") then country="本地/局域网"
		if instr(localstr,"CZ88.NET") then localstr="本地/局域网"
	end sub

	private function getflagstr(offset)
		dim Flag
		Flag=0
		do while (true)
			stream.position=offset
			Flag=AscB(stream.Read(1))
			if(Flag=1 or Flag=2) then
				buf=stream.Read(3)
				if (Flag=2) then
					countryflag=2
					endipoff=offset-4
				end if
				offset=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)
			else
				exit do
			end if
		loop
		if (offset<12) then
			getflagstr=""
		else
			stream.position=offset
			getflagstr=GetStr()
		end if
	end function
	
	private function getstr()
		dim c
		getstr=""
		dim objstream
		set objstream=server.createobject("adodb.stream")
		objstream.type=1
		objstream.mode=3
		objstream.open
		c=stream.read(1)
		do while (ascb(c)<>0 and not stream.eos)
			objstream.write c
			c=stream.read(1)
		loop
		objstream.position=0
		objstream.type=2
		objstream.charset="gb2312"
		getstr=objstream.readtext
		objstream.close
		set objstream=nothing
	end function

	public function qqwry(dotip)
		dim ip,nRet
		dim RangB,RangE,recno
		ip=ipToint(dotip)
		set stream=CreateObject("adodb.stream")
		stream.mode=3
		stream.type=1
		stream.open
		stream.LoadFromFile qqwryfile
		stream.position=0
		buf=stream.Read(8)
		firststartip=AscB(MidB(buf,1,1))+(AscB(MidB(buf,2,1))*256)+(AscB(MidB(buf,3,1))*256*256)+(AscB(MidB(buf,4,1))*256*256*256)
		laststartip=AscB(MidB(buf,5,1))+(AscB(MidB(buf,6,1))*256)+(AscB(MidB(buf,7,1))*256*256)+(AscB(MidB(buf,8,1))*256*256*256)
		recordcount=int((laststartip-firststartip)/7)
		' 在数据库中找不到任何ip地址
		if (recordcount<=1) then
			country="未知"
			qqwry=2
			exit function
		end if
		RangB=0
		RangE=recordcount
		do while (RangB<(RangE-1))
			recno=int((RangB+RangE)/2)
			call getstartip (recno)
			if (ip=startip) then
				RangB=recno
				exit do
			end if
			if (ip>startip) then
				RangB=recno
			else
				RangE=recno
			end if
		loop
		call getstartip(RangB)
		call getendip()
		if (startip<=ip) and (endip>=ip) then
		' 没有找到
			nRet=0
		else
		' 正常
			nRet=3
		end if
		call Getcountry(ip)
		qqwry=nRet
	end function

	private sub Class_Terminate
		on error resume next
		stream.close
		if err then err.clear
		set stream=nothing
	end sub
end class

 
 public function look_ip(byval ip)
 		if ip="" or isNull(ip) then		'追加20210331
			look_ip=""
			exit function
		end if
		dim wry,iptype,qqwryversion,ipcounter
		set wry=new tqqwry
			iptype=wry.qqwry(ip) 
		
			look_ip=wry.country
		set wry=nothing
	end function
 %>