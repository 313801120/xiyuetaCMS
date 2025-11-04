<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><%

dim rsField(99),rsFieldValue(99),rsIndex
rsIndex=-1
dim rsxField(99),rsxFieldValue(99),rsxIndex
rsxIndex=-1
dim rsAddUpdateDebug:rsAddUpdateDebug=false
dim insertOrUpdateSql

function rsData(a,b)
call handle_rsData(rsField,rsFieldValue,rsIndex,a,b)
end function 

function rsAddnew(a) 
rsAddnew=handle_rsAddnew(rsField,rsFieldValue,rsIndex,a,conn,db_PREFIX,databaseType) 
end function

function rsAddnew_conn(a,b,c,d) 
rsAddnew_conn=handle_rsAddnew(rsField,rsFieldValue,rsIndex,a,b,c,d) 
end function

function rsUpdate(a,b) 
rsUpdate=handle_rsUpdate(rsField,rsFieldValue,rsIndex,a,b,conn,db_PREFIX,databaseType)
end function

function rsUpdate_conn(a,b,c,d,e) 
rsUpdate_conn=handle_rsUpdate(rsField,rsFieldValue,rsIndex,a,b,c,d,e)
end function

function rsDataPrint()
dim a
if rsIndex <>-1 then  
for a=0 to rsIndex
call echo(ChrW(114)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100),rsField(a))
call echo(ChrW(114)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(101)&ChrW(108)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101),rsFieldValue(a))
call hr()
next
end if
end function

function rsxData(a,b)
call handle_rsData(rsxField,rsxFieldValue,rsxIndex,a,b)
end function 

function rsxAddnew(a) 
rsxAddnew=handle_rsAddnew(rsxField,rsxFieldValue,rsxIndex,a,conn,db_PREFIX,databaseType) 
end function

function rsxAddnew_conn(a,b,c,d) 
rsxAddnew_conn=handle_rsAddnew(rsxField,rsxFieldValue,rsxIndex,a,b,c,d) 
end function

function rsxUpdate(a,b) 
rsxUpdate=handle_rsUpdate(rsxField,rsxFieldValue,rsxIndex,a,b,conn,db_PREFIX,databaseType) 
end function

function rsxUpdate_conn(a,b,c,d,e)
rsxUpdate_conn=handle_rsUpdate(rsxField,rsxFieldValue,rsxIndex,a,b,c,d,e) 
end function

function handle_rsData(a,b,c,d,e)
dim f,g
g=true
d=phptrim(lcase(d))
if c <>-1 then 
for f=0 to c
if a(f)=d then
b(f)=e
g=false
exit for
end if
next
end if

if g=true then
c=c+1
a(c)=d
b(c)=e
end if
end function

function getRsUpdate(a) 
getRsUpdate=handle_getRsUpdate(rsField,rsFieldValue,rsIndex,a,conn,db_PREFIX,databaseType) 
end function

function getRsUpdate_conn(a,b,c,d) 
getRsUpdate_conn=handle_getRsUpdate(rsField,rsFieldValue,rsIndex,a,b,c,d)  
end function

function handle_getRsUpdate(a,b,c,d,e,f,g) 
dim h,i,j,k,l,m,n,o,p,q
dim r,s
r=ChrW(91)
s=ChrW(93)
if g=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
r=ChrW(96)
s=ChrW(96)
end if
for h=0 to c

j=a(h)
k=b(h) 
if g=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then  
i=getMysqlFieldAlt_conn(f & d, j,e)
else  
i=getFieldAlt_conn(f & d, j,e)
end if
if i="" then
if rsAddUpdateDebug then call echoRed(ChrW(25552)&ChrW(31034),d & ChrW(37324)&ChrW(27809)&ChrW(26377)&ChrW(32)& j &ChrW(32)&ChrW(23383)&ChrW(27573))
else
if rsAddUpdateDebug then call echo(j & ChrW(40)& i &ChrW(41),k)
if i=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or i=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) or i=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
k=ChrW(39)& replace(k,ChrW(39),ChrW(39)&ChrW(39)) &ChrW(39)
end if
if m <>"" then m = m & ChrW(44)&ChrW(32)
m = m & j & ChrW(61) & k

if n <>"" then n=n & ChrW(44)
n=n & r&j&s
end if
next
handle_getRsUpdate=m
end function

function handle_rsUpdate(a,b,c,d,e,f,g,h)
dim i,j,k,l,m,n,o,p,q,r
dim s,t,u
s=ChrW(91)
t=ChrW(93)
if h=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
s=ChrW(96)
t=ChrW(96)
end if

if instr(lcase(e),ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101))>0 then
u=e
else
e=getNumberGroup(e)
if e="" then
if rsAddUpdateDebug then call echoRed(ChrW(25552)&ChrW(31034),ChrW(105)&ChrW(100)&ChrW(20026)&ChrW(31354))
exit function
end if
u=ChrW(32)&ChrW(119)&ChrW(104)&ChrW(101)&ChrW(114)&ChrW(101)&ChrW(32)&ChrW(105)&ChrW(100)&ChrW(61)&e
end if

for i=0 to c

k=a(i)
l=b(i)
if h=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then  
j=getMysqlFieldAlt_conn(g & d, k,f)
else  
j=getFieldAlt_conn(g & d, k,f)
end if
if j="" then
if rsAddUpdateDebug then call echoRed(ChrW(25552)&ChrW(31034),d & ChrW(37324)&ChrW(27809)&ChrW(26377)&ChrW(32)& k &ChrW(32)&ChrW(23383)&ChrW(27573))
else
if rsAddUpdateDebug then call echo(k & ChrW(40)& j &ChrW(41),l)
if j=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or j=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) or j=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
l=ChrW(39)& replace(l,ChrW(39),ChrW(39)&ChrW(39)) &ChrW(39)
end if
if n <>"" then n = n & ChrW(44)&ChrW(32)
n = n & k & ChrW(61) & l

if o <>"" then o=o & ChrW(44) 
o=o & s&k&t
end if
next

if n <>"" then
m = ChrW(117)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32) & g & "" & d & ChrW(32)&ChrW(115)&ChrW(101)&ChrW(116)&ChrW(32) & n & u
insertOrUpdateSql=m
if rsAddUpdateDebug then call echo(ChrW(115)&ChrW(113)&ChrW(108),m):doevents
q=handle_executeSql(m,f)
c=-1
r=IIF(q,"",ChrW(115)&ChrW(113)&ChrW(108)&ChrW(38169)&ChrW(35823))

if 1=2 then

p=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & g & ChrW(97)&ChrW(100)&ChrW(100)&ChrW(85)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(40)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(44)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(44)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39)&ChrW(20462)&ChrW(25913)&ChrW(39)&ChrW(44)&ChrW(39)& replace(m,ChrW(39),ChrW(39)&ChrW(39)) &ChrW(39)&ChrW(44)&ChrW(39)& r &ChrW(39)&ChrW(41)

f.execute(p)
end if
handle_rsUpdate=q
end if
end function

function handle_executeSql(a,b)
on error resume next 
b.execute(a)
if err then
handle_executeSql=false
else
handle_executeSql=true
end if
end function

function handle_rsAddnew(a,b,c,d,e,f,g) 
dim h,i,j,k,l,m,n,o,p,q 
dim r,s
r=ChrW(91)
s=ChrW(93)
if g=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then
r=ChrW(96)
s=ChrW(96)
end if
for h=0 to c
j=a(h)
k=b(h)
if isnul(k) then k=""

if g=ChrW(109)&ChrW(121)&ChrW(115)&ChrW(113)&ChrW(108) then  
i=getMysqlFieldAlt_conn(f & d, j,e)
else
i=getFieldAlt_conn(f & d, j,e)
end if
if i="" then
if rsAddUpdateDebug then call echoRed(ChrW(25552)&ChrW(31034),d & ChrW(37324)&ChrW(27809)&ChrW(26377)&ChrW(32)& j &ChrW(32)&ChrW(23383)&ChrW(27573))
else
if rsAddUpdateDebug then call echo(j & ChrW(40)& i &ChrW(41),k)
if i=ChrW(86)&ChrW(97)&ChrW(114)&ChrW(67)&ChrW(104)&ChrW(97)&ChrW(114) or i=ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116) or i=ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(84)&ChrW(105)&ChrW(109)&ChrW(101) then
k=ChrW(39)& replace(k,ChrW(39),ChrW(39)&ChrW(39)) &ChrW(39)
end if
if m <>"" then m = m & ChrW(44)&ChrW(32)
m = m & k

if n <>"" then n=n & ChrW(44)
n=n & r&j&s
end if
next
if m <>"" then
l = ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & f & "" & d & ChrW(32)&ChrW(40) & n & ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40) & m & ChrW(41) 
insertOrUpdateSql=l
if rsAddUpdateDebug then call echo(ChrW(115)&ChrW(113)&ChrW(108),l):doevents
p=handle_executeSql(l,e)
c=-1
q=IIF(p,"",ChrW(115)&ChrW(113)&ChrW(108)&ChrW(38169)&ChrW(35823))

if 1=2 then
o=ChrW(105)&ChrW(110)&ChrW(115)&ChrW(101)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(105)&ChrW(110)&ChrW(116)&ChrW(111)&ChrW(32) & f & ChrW(97)&ChrW(100)&ChrW(100)&ChrW(85)&ChrW(112)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(83)&ChrW(113)&ChrW(108)&ChrW(32)&ChrW(40)&ChrW(115)&ChrW(116)&ChrW(121)&ChrW(112)&ChrW(101)&ChrW(44)&ChrW(115)&ChrW(113)&ChrW(108)&ChrW(116)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(44)&ChrW(98)&ChrW(111)&ChrW(100)&ChrW(121)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(41)&ChrW(32)&ChrW(118)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(115)&ChrW(40)&ChrW(39)&ChrW(28155)&ChrW(21152)&ChrW(39)&ChrW(44)&ChrW(39)& replace(l,ChrW(39),ChrW(39)&ChrW(39)) &ChrW(39)&ChrW(44)&ChrW(39)& q &ChrW(39)&ChrW(41)
e.execute(o)
end if
handle_rsAddnew=p
else 
handle_rsAddnew=false
if rsAddUpdateDebug then call echo(ChrW(25552)&ChrW(31034),ChrW(97)&ChrW(100)&ChrW(100)&ChrW(86)&ChrW(97)&ChrW(108)&ChrW(117)&ChrW(101)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(23383)&ChrW(27573)&ChrW(20026)&ChrW(31354))
end if
end function













%>