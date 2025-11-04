<%'严禁反编译、逆向等任何形式的破解侵权行为
'官方网站：www.xiyueta.com   QQ：313801120%><% 


function getFileText(byVal a)
on error resume next 
dim b, c, d 

call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.opentextfile(a, 1)

set d = b.getfile(a)
if d.size = 0 then getFileText = "" : exit function
set d = nothing 
getFileText = c.readall 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(35835)&ChrW(21462)&ChrW(25991)&ChrW(20214)&ChrW(20869)&ChrW(23481)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function getFText(a)
getFText = getFileText(a) 
end function 

function getFileType(byVal a)
on error resume next 
dim b, c, d 

call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
getFileType = c.type 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(84)&ChrW(101)&ChrW(120)&ChrW(116)&ChrW(32)&ChrW(35835)&ChrW(21462)&ChrW(25991)&ChrW(20214)&ChrW(31867)&ChrW(22411)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function checkFile(byVal a)
on error resume next 
dim b 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
checkFile = b.fileexists(a) 
set b = nothing 
if err then call doError(err.description, ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(26816)&ChrW(26597)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function existsFile(a)
existsFile = checkFile(a) 
end function 

function createFile(byVal a, byVal b)
on error resume next 
dim c, d 
call handlePath(a)
set d = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if existsZhiDuFile(a) = true then
call EditFileAttribute(a, 32)
end if 

set c = d.createtextfile(a, true)
c.writeline(b) 
createFile = true 
set c = nothing 
set d = nothing 
if err then createFile = false : call doError(err.description, ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(21019)&ChrW(24314)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function saveFile(a, b)
saveFile = createFile(a, b) 
end function 

function createAddFile(byVal a, byVal b)
on error resume next 
dim c, d 
call handlePath(a)
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) = false then
set d = c.createtextfile(a, true)
d.writeline(b) 
set d = nothing 
createAddFile = true
else
createAddFile = addToFile(a, b) 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(65)&ChrW(100)&ChrW(100)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(21019)&ChrW(24314)&ChrW(25991)&ChrW(20214)&ChrW(65292)&ChrW(23384)&ChrW(22312)&ChrW(32047)&ChrW(21152)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function createAddUpFile(a, b)
createAddUpFile = createAddFile(a, b) 
end function 

function addToFile(byVal a, byVal b)

dim c, d 
call handlePath(a)
addToFile = false
if existsZhiDuFile(a) = true then
call EditFileAttribute(a, 32)
end if 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) = true then
set d = c.opentextfile(a, 8)
d.writeline(b) 
set d = nothing 
addToFile = true
end if 
set c = nothing 
if err then call doError(err.description, ChrW(65)&ChrW(100)&ChrW(100)&ChrW(84)&ChrW(111)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(36861)&ChrW(21152)&ChrW(25991)&ChrW(20214)&ChrW(20449)&ChrW(24687)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(60)&ChrW(98)&ChrW(114)&ChrW(62)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(23383)&ChrW(31526)&ChrW(38271) & len(b) & ChrW(32)&ChrW(67)&ChrW(111)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(110)&ChrW(116)&ChrW(31867)&ChrW(22411) & typeName(b) & ChrW(12304) & b & ChrW(12305)) 
end function 

function saveByteFile(byVal a, b)
dim c 
a = handlePath(a) 
set c = createObject(ChrW(65)&ChrW(68)&ChrW(79)&ChrW(68)&ChrW(66)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109))
with c
.type = 1 
.open 
.write(b)

.saveToFile a, 2 
.cancel 
.close 
end with 
set c = nothing 
end function 
function createByteFile(a, b)
end function 

function moveFile(byVal a, byVal b)
on error resume next 
dim c 
call handlePath(a)
call handlePath(b)
moveFile = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) = true and c.fileexists(b) = false then
call c.movefile(a, b) 
moveFile = true 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(77)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(31227)&ChrW(21160)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(65292)&ChrW(84)&ChrW(111)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & b) 
end function 

function editFile(a, b)
editFile = moveFile(a, b) 
end function 

function copyFile(byVal a, byVal b)
on error resume next 
dim c 
call handlePath(a)
call handlePath(b)
copyFile = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) = true and c.fileexists(b) = false then
call c.copyfile(a, b) 
copyFile = true 
end if 
if err then call doError(err.description, ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(25335)&ChrW(36125)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(40)& c.fileexists(a) &ChrW(41)&ChrW(65292)&ChrW(84)&ChrW(111)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & b & ChrW(40)& c.fileexists(b) &ChrW(41)) 
set c = nothing 
end function 

function deleteFile(byVal a)
on error resume next 
dim b 
call handlePath(a)
deleteFile = false 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
call b.deletefile(a, true) 
deleteFile = true 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(68)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function delSelFile(a, byVal b)
dim c, d, e 
c = split(b, ChrW(124)) 
for each d in c
if d <> "" then

call deleteFile(a & d) 
e = e & d & vbCrLf 
end if 
next 
delSelFile = e 
end function 

function delFileList(a, byVal b)
delFileList = delSelFile(a, b) 
end function 

function batchDelFile(a, b)
dim c, d, e 
for each c in b
d = a & c 
e = e & d & vbCrLf 
call deleteFile(d) 
next 
batchDelFile = e 
end function 

function deleteAppointFileList(byVal a)

dim b, c, d, e 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) = false then deleteAppointFileList = "" : exit function
set c = b.getfolder(a)
for each d in c.files
e = baseName(d) 

if left(e, 1) = ChrW(35) then
call deleteFile(d) 
end if 
doEvents 
next 
set c = nothing 
set b = nothing 
deleteAppointFileList = "" 
end function 

function getFileSize(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
getFileSize = 0 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
getFileSize = c.size 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(22823)&ChrW(23567)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function fileSize(a)
fileSize = getFileSize(a) 
end function 

function getFSize(a)
getFSize = getFileSize(a) 
end function 

function getFileCreateDate(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
getFileCreateDate = c.datecreated 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(21019)&ChrW(24314)&ChrW(26102)&ChrW(38388)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function fileCreateDate(a)
fileCreateDate = getFileCreateDate(a) 
end function 

function getFileCreateTime(a)
getFileCreateTime = getFileCreateDate(a) 
end function

function getFileEditDate(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
getFileEditDate = c.datelastmodified 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(20462)&ChrW(25913)&ChrW(26102)&ChrW(38388)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function fileEditDate(a)
fileEditDate = getFileEditDate(a) 
end function 

function getFileEditTime(a)
getFileEditTime = getFileEditDate(a) 
end function 

function getDateLastAccessed(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
getDateLastAccessed = c.datelastaccessed 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(35775)&ChrW(38382)&ChrW(26102)&ChrW(38388)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function

function getFileVisitTime(a)
getFileVisitTime=getDateLastAccessed(a)
end function

function modifyFileModifydate(byVal a, byVal b)
on error resume next 
dim c, d, e, f 
call handlePath(a)
if checkFile(a) = false then
modifyFileModifydate = false 
exit function 
end if 
c = left(a, inStrRev(a, ChrW(92))) 
a = right(a, len(a) - len(c)) 


set d = createObject(ChrW(83)&ChrW(104)&ChrW(101)&ChrW(108)&ChrW(108)&ChrW(46)&ChrW(65)&ChrW(112)&ChrW(112)&ChrW(108)&ChrW(105)&ChrW(99)&ChrW(97)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110))
set e = d.namespace(c)
set f = e.parsename(a)
f.modifydate = b 
modifyFileModifydate = true 
if err then call doError(err.description, ChrW(77)&ChrW(111)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(77)&ChrW(111)&ChrW(100)&ChrW(105)&ChrW(102)&ChrW(121)&ChrW(100)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(20462)&ChrW(25913)&ChrW(26102)&ChrW(38388)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & c & a) 
set f = nothing 
set e = nothing 
set d = nothing 
end function 

function editFileEditDate(a, b)
editFileEditDate = modifyFileModifydate(a, b) 
end function 

function existsZhiDuFile(byVal a)
on error resume next 
dim b, c 
existsZhiDuFile = false 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
existsZhiDuFile = c.attributes 
set c = nothing 
if existsZhiDuFile >= 128 then existsZhiDuFile = existsZhiDuFile - 128 
if existsZhiDuFile >= 64 then existsZhiDuFile = existsZhiDuFile - 64 
if existsZhiDuFile >= 32 then existsZhiDuFile = existsZhiDuFile - 32 
if existsZhiDuFile >= 8 then existsZhiDuFile = existsZhiDuFile - 8 
if existsZhiDuFile >= 4 then existsZhiDuFile = existsZhiDuFile - 4 
if existsZhiDuFile >= 2 then existsZhiDuFile = existsZhiDuFile - 2 
existsZhiDuFile = cBool(existsZhiDuFile)
end if 
set b = nothing 
if err then call doError(err.description, ChrW(69)&ChrW(120)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(90)&ChrW(104)&ChrW(105)&ChrW(68)&ChrW(117)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(32)&ChrW(21028)&ChrW(26029)&ChrW(21482)&ChrW(35835)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function getFileAttribute(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
getFileAttribute = -1 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.fileexists(a) = true then
set c = b.getfile(a)
getFileAttribute = c.attributes 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(116)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(23646)&ChrW(24615)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function editFileAttribute(byVal a, byVal b)
on error resume next 
dim c, d 
call handlePath(a)
editFileAttribute = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) = true then
set d = c.getfile(a)
d.attributes = b
set d = nothing 
editFileAttribute = true 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(65)&ChrW(116)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(20462)&ChrW(25913)&ChrW(25991)&ChrW(20214)&ChrW(23646)&ChrW(24615)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function existsFileDay(byVal a, byVal b)
on error resume next 
dim c, d, e 
call handlePath(a)
existsFileDay = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.fileexists(a) = true then
set d = c.getfile(a)
e = dateDiff(ChrW(100), d.datelastmodified, now())
if e <= b then existsFileDay = true 
set d = nothing 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(69)&ChrW(120)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(121)&ChrW(32)&ChrW(21028)&ChrW(26029)&ChrW(25991)&ChrW(20214)&ChrW(22825)&ChrW(25968)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function checkFileDay(a, b)
checkFileDay = existsFileDay(a, b) 
end function 


function createFolder(byVal a)
on error resume next 
dim b 
call handlePath(a)
createFolder = false 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) = false then
b.createfolder(a) 
createFolder = true 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(99)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(21019)&ChrW(24314)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(58)&ChrW(58)&ChrW(58) & b.folderexists(a)) 
end function 

function createDirFolder(byVal a)

createDirFolder = "" 
if checkFolder(a) = true then exit function
dim b, c, d, e 
e = ""
call handlePath(a)
b = split(a, ChrW(92)) 
for c = 0 to uBound(b)
d = trim(b(c))
if d <> "" then
e = e & d & ChrW(92) 
if c = uBound(b) and inStr(d, ChrW(46)) > 0 then exit for
if inStr(d, ChrW(58)) = false then

call createFolder(e) 
end if 
end if 
next 
end function 

function createDomain(byVal a, byVal b)
on error resume next 
dim c 
call handlePath(a)
createDomain = false 
b = getWebSite(b) 
b = replace(replace(replace(b, ChrW(104)&ChrW(116)&ChrW(116)&ChrW(112)&ChrW(58)&ChrW(47)&ChrW(47), ""), ChrW(47), ""), ChrW(46), ChrW(95)) 
b = replace(b, ChrW(58), ChrW(95))
c = a & b 
if checkFolder(c) = false then
call createFolder(c) 
createDomain = true 
end if 
if err then call doError(err.description, ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(111)&ChrW(77)&ChrW(97)&ChrW(105)&ChrW(110)&ChrW(32)&ChrW(21019)&ChrW(24314)&ChrW(20197)&ChrW(22495)&ChrW(21517)&ChrW(21629)&ChrW(21517)&ChrW(30340)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function createDomainFolder(a, b)
createDomainFolder = createDomain(a, b) 
end function 

function moveFolder(byVal a, byVal b)
on error resume next 
dim c 
call handlePath(a)
call handlePath(b)
moveFolder = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.folderexists(a) = true and c.folderexists(b) = false then
call c.movefolder(a, b) 
moveFolder = true 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(77)&ChrW(111)&ChrW(118)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(31227)&ChrW(21160)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(65292)&ChrW(84)&ChrW(111)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & b) 
end function 

function editFolder(a, b)
editFolder = moveFolder(a, b) 
end function 

function copyFolder(byVal a, byVal b)
on error resume next 
dim c 
call handlePath(a)
call handlePath(b)

if right(a, 1) = ChrW(92) then
a = left(a, len(a) - 1) 
end if 
if right(b, 1) = ChrW(92) then
b = left(b, len(b) - 1) 
end if 
copyFolder = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.folderexists(a) = true and c.folderexists(b) = false then
call c.copyfolder(a, b) 
copyFolder = true 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(67)&ChrW(111)&ChrW(112)&ChrW(121)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(25335)&ChrW(36125)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a & ChrW(65292)&ChrW(84)&ChrW(111)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & b) 
end function 

function deleteFolder(byVal a)
on error resume next 
dim b 
call handlePath(a)
deleteFolder = false 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) then
if right(a, 1) = ChrW(92) then a = left(a, len(a) - 1)
call b.deletefolder(a, true) 
deleteFolder = true 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(68)&ChrW(101)&ChrW(108)&ChrW(101)&ChrW(116)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(21024)&ChrW(38500)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function getFolderSize(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
getFolderSize = 0 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) then
set c = b.getfolder(a)
getFolderSize = c.size 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(83)&ChrW(105)&ChrW(122)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(22823)&ChrW(23567)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function checkFolder(byVal a)
on error resume next 
dim b 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
checkFolder = b.folderexists(a) 
set b = nothing 
if err then call doError(err.description, ChrW(99)&ChrW(104)&ChrW(101)&ChrW(99)&ChrW(107)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(32)&ChrW(26816)&ChrW(26597)&ChrW(22841)&ChrW(25991)&ChrW(20214)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function existsFolder(a)
existsFolder = checkFolder(a) 
end function 

function getFolderCreateDate(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) then
set c = b.getfolder(a)
getFolderCreateDate = c.datecreated 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(67)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(21019)&ChrW(24314)&ChrW(26102)&ChrW(38388)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function getFolderCreateTime(a)
getFolderCreateTime=getFolderCreateDate(a)
end function

function getFolderEditDate(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) then
set c = b.getfolder(a)
getFolderEditDate = c.datelastmodified 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(20462)&ChrW(25913)&ChrW(26102)&ChrW(38388)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function getFolderTime(a)
getFolderTime = getFolderEditDate(a) 
end function

function getFolderEditTime(a)
getFolderEditTime = getFolderEditDate(a) 
end function

function getFolderVisitTime(a)
getFolderVisitTime = getFolderEditDate(a) 
end function

function getFolderAttribute(byVal a)
on error resume next 
dim b, c 
call handlePath(a)
getFolderAttribute = 0 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) = true then
set c = b.getfolder(a)
getFolderAttribute = c.attributes 
set c = nothing 
end if 
set b = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(65)&ChrW(116)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(23646)&ChrW(24615)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function editFolderAttribute(byVal a, b)
on error resume next 
dim c, d 
call handlePath(a)
editFolderAttribute = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.folderexists(a) then
set d = c.getfolder(a)
d.attributes = b
set d = nothing 
editFolderAttribute = true 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(69)&ChrW(100)&ChrW(105)&ChrW(116)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(65)&ChrW(116)&ChrW(116)&ChrW(114)&ChrW(105)&ChrW(98)&ChrW(117)&ChrW(116)&ChrW(101)&ChrW(32)&ChrW(20462)&ChrW(25913)&ChrW(25991)&ChrW(20214)&ChrW(23646)&ChrW(24615)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function existsFolderDay(byVal a, byVal b)
on error resume next 
dim c, d, e 
call handlePath(a)
existsFolderDay = false 
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.folderexists(a) = true then
set d = c.getfolder(a)
e = dateDiff(ChrW(100), d.datelastmodified, now())
if e <= b then existsFolderDay = true 
set d = nothing 
end if 
set c = nothing 
if err then call doError(err.description, ChrW(69)&ChrW(120)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(115)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(68)&ChrW(97)&ChrW(121)&ChrW(32)&ChrW(21028)&ChrW(26029)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(22825)&ChrW(25968)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(97)&ChrW(109)&ChrW(101)&ChrW(61) & a) 
end function 

function checkFolderDay(a, b)
checkFolderDay = existsFolderDay(a, b) 
end function 

function getFileFolderList(byVal a, b, c, d, e, f, byVal g)
on error resume next 
dim h, i, j, k, l, m 
call handlePath(a)
c = lCase(c)
set h = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if not h.folderexists(a) then exit function 
set i = h.getfolder(a)
if b = true then
for each k in i.files
m = lCase(right(k.name, len(k.name) - inStrRev(k.name, ChrW(46)))) 
if (inStr(ChrW(124) & c & ChrW(124), ChrW(124) & m & ChrW(124)) > 0 or c = "" or c = ChrW(20840)&ChrW(37096) or c = ChrW(42)) and c <> ChrW(48) then
if inStr(ChrW(124)&ChrW(21517)&ChrW(31216)&ChrW(124)&ChrW(21462)&ChrW(21517)&ChrW(31216)&ChrW(124), ChrW(124) & d & ChrW(124)) > 0 then
g = g & k.name & vbCrLf 
else
g = g & k.path & vbCrLf
end if 
end if 
doEvents 
next 
end if 
if inStr(ChrW(124) & e & ChrW(124), ChrW(124)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124)) > 0 or inStr(ChrW(124) & e & ChrW(124), ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124)) > 0 or inStr(ChrW(124) & e & ChrW(124), ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(124)) > 0 then
set j = i.subfolders
for each l in j
if inStr(ChrW(124) & e & ChrW(124), ChrW(124)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(124)) = false then
if inStr(ChrW(124)&ChrW(21517)&ChrW(31216)&ChrW(124)&ChrW(21462)&ChrW(21517)&ChrW(31216)&ChrW(124), ChrW(124) & f & ChrW(124)) > 0 then
g = g & l.name & vbCrLf 
elseIf lCase(f) <> ChrW(110)&ChrW(111) then
g = g & l & vbCrLf 
end if 
end if 
if inStr(ChrW(124) & e & ChrW(124), ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124)) > 0 or inStr(ChrW(124) & e & ChrW(124), ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(124)) > 0 then
g = getFileFolderList(l, b, c, d, e, f, g) & vbCrLf 
end if 
doEvents 
next 
set j = nothing 
end if 
set i = nothing 
set h = nothing 
if g <> "" then g = left(g, len(g) - 2) 
getFileFolderList = g 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(65288)&ChrW(22841)&ChrW(65289)&ChrW(21015)&ChrW(34920)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function getDirJpgList(byVal a)
getDirJpgList = getDirFileList(a, ChrW(106)&ChrW(112)&ChrW(103)) 
end function 

function getDirPngList(byVal a)
getDirPngList = getDirFileList(a, ChrW(112)&ChrW(110)&ChrW(103)) 
end function 

function getDirIniList(byVal a)
getDirIniList = getDirFileList(a, ChrW(105)&ChrW(110)&ChrW(105)) 
end function 

function getDirTxtList(byVal a)
getDirTxtList = getDirFileList(a, ChrW(116)&ChrW(120)&ChrW(116)) 
end function 

function getDirJsList(byVal a)
getDirJsList = getDirFileList(a, ChrW(106)&ChrW(115)) 
end function 

function getDirCssList(byVal a)
getDirCssList = getDirFileList(a, ChrW(99)&ChrW(115)&ChrW(115)) 
end function 

function getDirHtmlList(byVal a)
getDirHtmlList = getDirFileList(a, ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) 
end function 

function getDirAspList(byVal a)
getDirAspList = getDirFileList(a, ChrW(97)&ChrW(115)&ChrW(112)) 
end function 

function getDirPhpList(byVal a)
getDirPhpList = getDirFileList(a, ChrW(112)&ChrW(104)&ChrW(112)) 
end function 

function getDirFileList(byVal a, b)
if b = "" then
b = ChrW(20840)&ChrW(37096) 
end if 
getDirFileList = getFileFolderList(a, true, b, "", "", "", "") 
end function 

function getDirJpgNameList(byVal a)
getDirJpgNameList = getDirFileNameList(a, ChrW(106)&ChrW(112)&ChrW(103)) 
end function 

function getDirPngNameList(byVal a)
getDirPngNameList = getDirFileNameList(a, ChrW(112)&ChrW(110)&ChrW(103)) 
end function 

function getDirIniNameList(byVal a)
getDirIniNameList = getDirFileNameList(a, ChrW(105)&ChrW(110)&ChrW(105)) 
end function 

function getDirTxtNameList(byVal a)
getDirTxtNameList = getDirFileNameList(a, ChrW(116)&ChrW(120)&ChrW(116)) 
end function 

function getDirJsNameList(byVal a)
getDirJsNameList = getDirFileNameList(a, ChrW(106)&ChrW(115)) 
end function 

function getDirCssNameList(byVal a)
getDirCssNameList = getDirFileNameList(a, ChrW(99)&ChrW(115)&ChrW(115)) 
end function 

function getDirHtmlNameList(byVal a)
getDirHtmlNameList = getDirFileNameList(a, ChrW(104)&ChrW(116)&ChrW(109)&ChrW(108)) 
end function 

function getDirAspNameList(byVal a)
getDirAspNameList = getDirFileNameList(a, ChrW(97)&ChrW(115)&ChrW(112)) 
end function 

function getDirPhpNameList(byVal a)
getDirPhpNameList = getDirFileNameList(a, ChrW(112)&ChrW(104)&ChrW(112)) 
end function 

function getDirFileNameList(byVal a, b)
if b = "" then
b = ChrW(20840)&ChrW(37096) 
end if 
getDirFileNameList = getFileFolderList(a, true, b, ChrW(21517)&ChrW(31216), "", "", "") 
end function 

function getDirAllFileList(byVal a, b)
if b = "" then
b = ChrW(20840)&ChrW(37096) 
end if 
getDirAllFileList = getFileFolderList(a, true, b, "", ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116), "", "") 
end function 

function getDirAllFileNameList(byVal a, b)
if b = "" then
b = ChrW(20840)&ChrW(37096) 
end if 
getDirAllFileNameList = getFileFolderList(a, true, b, ChrW(21517)&ChrW(31216), ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124)&ChrW(104)&ChrW(105)&ChrW(100)&ChrW(101)&ChrW(102)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(108)&ChrW(105)&ChrW(115)&ChrW(116), "", "") 
end function 

function getDirFolderList(byVal a)
getDirFolderList = getFileFolderList(a, false, "", "", ChrW(25991)&ChrW(20214)&ChrW(22841), "", "") 
end function 

function getDirFolderNameList(byVal a)
getDirFolderNameList = getFileFolderList(a, false, "", true, ChrW(25991)&ChrW(20214)&ChrW(22841), ChrW(21517)&ChrW(31216), "") 
end function 

function getDirAllFolderList(byVal a)
getDirAllFolderList = getFileFolderList(a, false, "", "", ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841), "", "") 
end function 

function getDirAllFolderNameList(byVal a)
getDirAllFolderNameList = getFileFolderList(a, false, "", true, ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841), ChrW(21517)&ChrW(31216), "") 
end function 

function getFileFolderNumb(byVal a, b, byVal c)
on error resume next 
dim d, e, f, g 
getFileFolderNumb = c 
call handlePath(a)
set d = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if d.folderexists(a) = true then
set e = d.getfolder(a)
set f = e.subfolders
if b = ChrW(25991)&ChrW(20214)&ChrW(25968)&ChrW(37327) or b = ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(25968)&ChrW(37327) then
c = c + e.files.count 
elseIf b = ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327) or b = ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327) then
c = c + f.count 
elseIf b = ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(22823)&ChrW(23567) then
c = e.size 
end if 
if b = ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(25968)&ChrW(37327) or b = ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327) then
for each g in f
c = getFileFolderNumb(g, b, c) 
doEvents 
next 
end if 
set e = nothing 
set f = nothing 
end if 
getFileFolderNumb = c 
set d = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(24403)&ChrW(21069)&ChrW(30446)&ChrW(24405)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function getDirFolderNumb(a)
getDirFolderNumb = getFileFolderNumb(a, ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327), 0) 
end function 

function getDirFolderSize(a)
getDirFolderSize = getFileFolderNumb(a, ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(22823)&ChrW(23567), 0) 
end function 

function getDirFileNumb(a)
getDirFileNumb = getFileFolderNumb(a, ChrW(25991)&ChrW(20214)&ChrW(25968)&ChrW(37327), 0) 
end function 

function getDirAllFileNumb(a)
getDirAllFileNumb = getFileFolderNumb(a, ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(25968)&ChrW(37327), 0) 
end function 

function getDirAllFolderNumb(a)
getDirAllFolderNumb = getFileFolderNumb(a, ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327), 0) 
end function 

function getFolderList(byVal a, b)

dim c, d, e, f, g 
g = "" 
b = cStr(b) 
call handlePath(a)
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if c.folderexists(a) = true then
set d = c.getfolder(a)
set e = d.subfolders
for each f in e
if b = ChrW(21517)&ChrW(31216) or b = ChrW(48) then
g = g & f.name & vbCrLf 
else
g = g & f & vbCrLf 
end if 
doEvents 
next 
set d = nothing 
set e = nothing 
end if 
if g <> "" then g = left(g, len(g) - 2) 
getFolderList = g 
set c = nothing 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(78)&ChrW(117)&ChrW(109)&ChrW(98)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(24403)&ChrW(21069)&ChrW(30446)&ChrW(24405)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(25968)&ChrW(37327)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function getDirFileSort(byVal a)
on error resume next 
dim b, c, d, e, f, arrayStr(99), g, h 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) = false then exit function
set c = b.getfolder(a)
for each e in c.files
if inStr(e.name, ChrW(35)) = false and inStr(e.name, ChrW(12289)) > 0 then
f = replace(left(e.name, 2), ChrW(12289), "") 
arrayStr(f) = e.name 
end if 
doEvents 
next 
for g = 0 to uBound(arrayStr)
if arrayStr(g) <> "" then
h = h & arrayStr(g) & vbCrLf 
end if 
next 
set c = nothing 
set b = nothing 
getDirFileSort = h 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(21015)&ChrW(34920)&ChrW(25490)&ChrW(24207)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

function getDirFolderSort(byVal a)
on error resume next 
dim b, c, d, e, f, arrayStr(99), g, h, i 
call handlePath(a)
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if b.folderexists(a) = false then exit function
set c = b.getfolder(a)
set d = c.subfolders
for each i in d
if inStr(i.name, ChrW(35)) = 0 and inStr(i.name, ChrW(12289)) > 0 then
f = replace(left(i.name, 2), ChrW(12289), "") 
arrayStr(f) = i.name 
doEvents 
end if 
next 
for g = 0 to uBound(arrayStr)
if arrayStr(g) <> "" then
h = h & arrayStr(g) & vbCrLf 
end if 
next 
set c = nothing 
set d = nothing 
set b = nothing 
getDirFolderSort = h 
if err then call doError(err.description, ChrW(71)&ChrW(101)&ChrW(116)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(32)&ChrW(33719)&ChrW(24471)&ChrW(25991)&ChrW(20214)&ChrW(21015)&ChrW(34920)&ChrW(25490)&ChrW(24207)&ChrW(32)&ChrW(20989)&ChrW(25968)&ChrW(20986)&ChrW(38169)&ChrW(65292)&ChrW(70)&ChrW(111)&ChrW(108)&ChrW(100)&ChrW(101)&ChrW(114)&ChrW(80)&ChrW(97)&ChrW(116)&ChrW(104)&ChrW(61) & a) 
end function 

sub delDirAllFile(a)
dim b, c, d 
set b = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
set c = b.getfolder(a)
set d = c.files
for each c in d
if b.fileexists(c) then b.deletefile(c) 
next 
set d = nothing 
set c = nothing 
set b = nothing 
end sub 

sub deleteAllFile(a)
call DelDirAllFile(a) 
end sub 


function getUpdateFile(byVal a, b, c, d, byVal e)

dim f, g, h, i, j, k, l, m, n, o, p 
n = "" 
p = "" 
call handlePath(a)
if inStr(d, ChrW(44)) then
o = split(d, ChrW(44)) 
n = trim(o(0)) 
d = trim(o(1)) 
if uBound(o) >= 2 then p = trim(o(2))
end if 
if n = "" then
n = ChrW(115) 
end if 
if d = "" then
d = -1  
else
d = cLng(d)
end if 
b = lCase(b)
set f = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if not f.folderexists(a) then exit function 
set g = f.getfolder(a)
for each i in g.files
if left(i.name, 1) <> ChrW(35) then


l = dateDiff(n, i.datelastmodified, now()) 

if l <= d or d = -1 then
k = lCase(right(i.name, len(i.name) - inStrRev(i.name, ChrW(46)))) 

if (inStr(ChrW(124) & b & ChrW(124), ChrW(124) & k & ChrW(124)) > 0 or b = "" or b = ChrW(20840)&ChrW(37096) or b = ChrW(42)) and b <> ChrW(48) then
if p = ChrW(25991)&ChrW(20214)&ChrW(36335)&ChrW(24452) then
m = i 
else
m = i & ChrW(124) & checkCode(i) & ChrW(124) & printSpaceValue(i.size) & ChrW(124) & format_Time(i.datelastmodified, 1) & ChrW(124) & l & ChrW(47) & d & ChrW(40) & d - l & ChrW(41) 
end if 
e = e & m & vbCrLf 
end if 
end if 
end if 
doEvents 
next 
if inStr(ChrW(124)&ChrW(24403)&ChrW(21069)&ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(124)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124), ChrW(124) & c & ChrW(124)) > 0 then
set h = g.subfolders
for each j in h
if inStr(ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(124)&ChrW(20840)&ChrW(37096)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(124), ChrW(124) & c & ChrW(124)) > 0 then
e = getUpdateFile(j, b, c, d, e) & vbCrLf 
end if 
doEvents 
next 
set h = nothing 
end if 
set g = nothing 
set f = nothing 
if e <> "" then e = left(e, len(e) - 2) 
getUpdateFile = e 

end function 

function getFileFolderEditTime(byVal a, b, byVal c)
dim d, e, f, g, h, i, j, k, l 
call handlePath(a)
set d = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if not d.folderexists(a) then exit function 
set e = d.getfolder(a)
if b = ChrW(25991)&ChrW(20214) or b = "" or b = ChrW(42) then
for each h in e.files
set i = d.getfile(h)
k = i.datelastmodified 
set i = nothing 
if c = "" then
c = k 
elseIf dateDiff(ChrW(115), c, k) > 0 then
c = k 
end if 
next 
end if 
if b = ChrW(25991)&ChrW(20214)&ChrW(22841) or b = ChrW(42) then
set g = e.subfolders
for each f in g

if 1 = 2 then
set j = d.getfolder(f)
l = j.datelastmodified 
set j = nothing 
if l = "" then
c = l 
elseIf dateDiff(ChrW(115), c, l) > 0 then
c = l 
end if 
end if 
c = getFileFolderEditTime(f, b, c) 
next 
set g = nothing 
end if 
set e = nothing 
set d = nothing 
getFileFolderEditTime = c 
end function 

function deleteDir(byVal a,b,c) 
dim d, e, f, g, h, i 
call handlePath(a)
set d = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if not d.folderexists(a) then exit function 
set e = d.getfolder(a) 
for each g in e.files
call deleteFile(g)
next  
set f = e.subfolders
for each h in f
if instr(ChrW(124)& b &ChrW(124),ChrW(124)& h.name &ChrW(124))=0 then
call deleteFolder(h)

end if
next 
set f = nothing  
set e = nothing 
set d = nothing  
end function 

function copyDir(byVal a,b) 
dim c, d, e, f, g, h,i
call handlePath(a)
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if not c.folderexists(a) then exit function 
set d = c.getfolder(a) 
for each f in d.files
call copyfile(f, b & ChrW(47) & f.name)
next  
set e = d.subfolders
for each g in e
if instr(ChrW(124)& i &ChrW(124),ChrW(124)& g.name &ChrW(124))=0 then
call copyfile(g, b & ChrW(47) & g.name)
end if
next 
set e = nothing  
set d = nothing 
set c = nothing  
end function 


function handlePath(a)
a = replace(a, ChrW(47), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
dim b
b = false 
if right(a, 1) = ChrW(92) then
b = true 
end if 
if inStr(a, ChrW(58)) = 0 then
if left(a, 1) = ChrW(92) then
a = server.mapPath(ChrW(92)) & ChrW(92) & a 
else
a = server.mapPath(ChrW(46)&ChrW(92)) & ChrW(92) & a 
end if 
end if 
a = replace(a, ChrW(47), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
a = replace(a, ChrW(92)&ChrW(92), ChrW(92)) 
a = fullPath(a) 
if b = true then
a = a & ChrW(92) 
end if 
handlePath = a 
end function 

function fullPath(byVal a)
dim b, c, d 
d = "" 
a = replace(a, ChrW(47), ChrW(92)) 
b = split(a, ChrW(92)) 
for each c in b
c = trim(c) 
if c <> "" and c <> ChrW(46) then
if inStr(d, ChrW(92)) > 0 and c = ChrW(46)&ChrW(46) then
d = mid(d, 1, inStrRev(d, ChrW(92)) - 1) 
else
if d <> "" and right(d, 1) <> ChrW(92) then d = d & ChrW(92) 
d = d & c 
end if 
end if 
next 
fullPath = d 
end function 

function realPath(byVal a)
realPath = "" 
if checkFile(a) then
realPath = a 
exit function 
end if 
if checkFolder(a) then
realPath = a 
exit function 
end if 
end function 

function handleRelativePath(a, byVal b)
if a = "" then a = ChrW(92) 
a = handlePath(a) 
b = replace(b, a, ChrW(92)) 
handleRelativePath = b 
end function 

function dirName(a)
a = handleFileUrl(a) 
if right(a, 1) <> ChrW(92) then
a = mid(a, 1, inStrRev(a, ChrW(92))) 
end if 
dirName = a 
end function 

function phpDirName(a)
a = handleFileUrl(a) 
if right(a, 1) <> ChrW(92) then
a = mid(a, 1, inStr(a, ChrW(92))) 
end if 
phpDirName = a 
end function 

function isObjInstalled(a)
on error resume next 
isObjInstalled = false
dim b 
set b = createObject(a)
if 0 = err.number then isObjInstalled = true
set b = nothing 
end function 

function existsObject(a)
existsObject = isObjInstalled(a) 
end function 

function getFileObject()
if existsObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116)) then
getFileObject = ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116) 
else
getFileObject = ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(119)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(49)&ChrW(57)&ChrW(56)&ChrW(48)&ChrW(54)&ChrW(48)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116) 
end if 
end function 

function getDictionary()
if existsObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121)) then
getDictionary = ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121) 
else
getDictionary = ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(119)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(49)&ChrW(57)&ChrW(56)&ChrW(48)&ChrW(54)&ChrW(48)&ChrW(68)&ChrW(105)&ChrW(99)&ChrW(116)&ChrW(105)&ChrW(111)&ChrW(110)&ChrW(97)&ChrW(114)&ChrW(121) 
end if 
end function 

function getStream()
if existsObject(ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109)) then
getStream = ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109) 
else
getStream = ChrW(65)&ChrW(100)&ChrW(111)&ChrW(100)&ChrW(98)&ChrW(46)&ChrW(119)&ChrW(97)&ChrW(110)&ChrW(103)&ChrW(49)&ChrW(57)&ChrW(56)&ChrW(48)&ChrW(54)&ChrW(48)&ChrW(83)&ChrW(116)&ChrW(114)&ChrW(101)&ChrW(97)&ChrW(109) 
end if 
end function 

function showAttributeTip(a)
dim b 
if a = 0 then b = ChrW(48)&ChrW(26222)&ChrW(36890)&ChrW(25991)&ChrW(20214)&ChrW(65292) 
if a >= 128 then
a = a - 128 
b = b & ChrW(49)&ChrW(50)&ChrW(56)&ChrW(21387)&ChrW(32553)&ChrW(25991)&ChrW(20214)&ChrW(65292) 
end if 
if a >= 64 then
a = a - 64 
b = b & ChrW(54)&ChrW(52)&ChrW(24555)&ChrW(25463)&ChrW(38190)&ChrW(65292) 
end if 
if a >= 32 then
a = a - 32 
b = b & ChrW(51)&ChrW(50)&ChrW(23384)&ChrW(26723)&ChrW(65292) 
end if 
if a >= 16 then
a = a - 16 
b = b & ChrW(49)&ChrW(54)&ChrW(25991)&ChrW(20214)&ChrW(22841)&ChrW(65292) 
end if 
if a >= 8 then
a = a - 8 
b = b & ChrW(56)&ChrW(21367)&ChrW(26448)&ChrW(65292) 
end if 
if a >= 4 then
a = a - 4 
b = b & ChrW(52)&ChrW(31995)&ChrW(32479)&ChrW(65292) 
end if 
if a >= 2 then
a = a - 2 
b = b & ChrW(50)&ChrW(20026)&ChrW(38544)&ChrW(34255)&ChrW(65292) 
end if 
if a >= 1 then
a = a - 1 
b = b & ChrW(49)&ChrW(21482)&ChrW(35835)&ChrW(65292) 
end if 
if b <> "" then b = left(b, len(b) - 1) 
showAttributeTip = b 
end function  

function printSpaceValue(byVal a)
dim b 
b = a 
if b >= 1073741824 then
b = b / 1073741824 
if inStr(b, ChrW(46)) then
b = left(b, inStr(b, ChrW(46)) + 2) 
end if 
b = b & ChrW(32)&ChrW(71)&ChrW(66) 
elseIf b >= 1048576 then
b = b / 1048576 
if inStr(b, ChrW(46)) then
b = left(b, inStr(b, ChrW(46)) + 2) 
end if 
b = b & ChrW(32)&ChrW(77)&ChrW(66) 
else
b = formatNumber(b / 1024, 2) & ChrW(32)&ChrW(75)&ChrW(66)
if a<1024 then
b=ChrW(48) & b
end if
end if 
printSpaceValue = b 
end function 

function printSpaceSize(a)
printSpaceSize = printSpaceValue(a) 
end function 

function printFileSize(a)
printFileSize = printSpaceValue(a) 
end function 

function getDeskPath()
dim a 
set a = createObject(ChrW(87)&ChrW(115)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(46)&ChrW(115)&ChrW(104)&ChrW(101)&ChrW(108)&ChrW(108))
getDeskPath = a.specialfolders(ChrW(68)&ChrW(101)&ChrW(115)&ChrW(107)&ChrW(116)&ChrW(111)&ChrW(112)) & ChrW(92) 
end function

function createUrlShortcut(a, byVal b)
dim c 
c = ChrW(91)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(93)&ChrW(32) & vbCrLf 
c = c & ChrW(85)&ChrW(82)&ChrW(76)&ChrW(61) & b & vbCrLf 
c = c & ChrW(73)&ChrW(68)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(61)&ChrW(32) & vbCrLf 
c = c & ChrW(91)&ChrW(123)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(50)&ChrW(49)&ChrW(52)&ChrW(65)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(67)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(52)&ChrW(54)&ChrW(125)&ChrW(93)&ChrW(32) & vbCrLf 
c = c & ChrW(80)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(51)&ChrW(61)&ChrW(49)&ChrW(57)&ChrW(44)&ChrW(50)&ChrW(32) & vbCrLf 


call CreateFile(a, c) 
createUrlShortcut = c 
end function 

function createFolderShortcut(a, b)
dim c 
c = ChrW(91)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(93)&ChrW(32)&ChrW(32) & vbCrLf 
c = c & ChrW(85)&ChrW(82)&ChrW(76)&ChrW(61)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(47) & b & vbCrLf 
c = c & ChrW(72)&ChrW(111)&ChrW(116)&ChrW(75)&ChrW(101)&ChrW(121)&ChrW(61)&ChrW(48) & vbCrLf 
c = c & ChrW(73)&ChrW(68)&ChrW(76)&ChrW(105)&ChrW(115)&ChrW(116)&ChrW(61) & vbCrLf 
c = c & ChrW(73)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(61)&ChrW(67)&ChrW(58)&ChrW(92)&ChrW(87)&ChrW(73)&ChrW(78)&ChrW(68)&ChrW(79)&ChrW(87)&ChrW(83)&ChrW(92)&ChrW(115)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(51)&ChrW(50)&ChrW(92)&ChrW(83)&ChrW(72)&ChrW(69)&ChrW(76)&ChrW(76)&ChrW(51)&ChrW(50)&ChrW(46)&ChrW(100)&ChrW(108)&ChrW(108) & vbCrLf 
c = c & ChrW(73)&ChrW(99)&ChrW(111)&ChrW(110)&ChrW(73)&ChrW(110)&ChrW(100)&ChrW(101)&ChrW(120)&ChrW(61)&ChrW(51) & vbCrLf 
c = c & ChrW(91)&ChrW(123)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(50)&ChrW(49)&ChrW(52)&ChrW(65)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(67)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(45)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(48)&ChrW(52)&ChrW(54)&ChrW(125)&ChrW(93) & vbCrLf 
c = c & ChrW(80)&ChrW(114)&ChrW(111)&ChrW(112)&ChrW(51)&ChrW(61)&ChrW(49)&ChrW(57)&ChrW(44)&ChrW(57) & vbCrLf 
c = c & ChrW(91)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(46)&ChrW(65)&ChrW(93) & vbCrLf 
c = c & ChrW(85)&ChrW(82)&ChrW(76)&ChrW(61)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(47) & b & vbCrLf 
c = c & ChrW(91)&ChrW(73)&ChrW(110)&ChrW(116)&ChrW(101)&ChrW(114)&ChrW(110)&ChrW(101)&ChrW(116)&ChrW(83)&ChrW(104)&ChrW(111)&ChrW(114)&ChrW(116)&ChrW(99)&ChrW(117)&ChrW(116)&ChrW(46)&ChrW(87)&ChrW(93) & vbCrLf 
c = c & ChrW(85)&ChrW(82)&ChrW(76)&ChrW(61)&ChrW(102)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(58)&ChrW(47)&ChrW(47)&ChrW(47) & b & vbCrLf 


call CreateFile(a, c) 
createFolderShortcut = c 
end function 

function findDirFileName(a, b)
dim c, d, e, f 
findDirFileName = "" 
b = lCase(b)
call handlePath(a)
set c = createObject(ChrW(83)&ChrW(99)&ChrW(114)&ChrW(105)&ChrW(112)&ChrW(116)&ChrW(105)&ChrW(110)&ChrW(103)&ChrW(46)&ChrW(70)&ChrW(105)&ChrW(108)&ChrW(101)&ChrW(83)&ChrW(121)&ChrW(115)&ChrW(116)&ChrW(101)&ChrW(109)&ChrW(79)&ChrW(98)&ChrW(106)&ChrW(101)&ChrW(99)&ChrW(116))
if not c.folderexists(a) then exit function 
set d = c.getfolder(a)
for each e in d.files
f = lCase(mid(e.name, 1, inStrRev(e.name, ChrW(46)) - 1)) 
if b = f then
findDirFileName = e.name 
exit function 
end if 
doEvents 
next 
set d = nothing 
set c = nothing 
end function 

function findSubDirFileName(a, b)
dim c, d 
c = split(b, ChrW(124)) 
for each d in c
d = trim(d) 
if d <> "" then
findSubDirFileName = findDirFileName(a, d) 
if findSubDirFileName <> "" then exit function 
end if 
next 
end function 

function getArticleFillContent(a, b, c)
dim d, e, f, g 
if a <> "" then
b = autoReadFile(a) 
elseIf b = "" then
b = autoReadFile(ChrW(92)&ChrW(68)&ChrW(97)&ChrW(116)&ChrW(97)&ChrW(68)&ChrW(105)&ChrW(114)&ChrW(92)&ChrW(33258)&ChrW(21160)&ChrW(22635)&ChrW(25991)&ChrW(31456)&ChrW(20869)&ChrW(23481)&ChrW(25968)&ChrW(25454)&ChrW(46)&ChrW(116)&ChrW(120)&ChrW(116)) 
end if 
d = split(b, vbCrLf) 
randomize 
for g = 0 to c
f = cInt(uBound(d) * rnd) 

e = e & d(f) 
next 
getArticleFillContent = e 
end function 





function getFilePathName(byVal a)
a = replace(a, ChrW(92), ChrW(47)) 
if inStr(a, ChrW(47)) > 0 then
a = mid(a, inStrRev(a, ChrW(47)) + 1) 
end if 
if inStr(a, ChrW(46)) > 0 then
a = mid(a, 1, inStrRev(a, ChrW(46)) - 1) 
end if 
getFilePathName = a 
end function 

function getExtension(a)
getExtension = getFilePathName(a) 
end function 

function removeFileDir(byVal a)
a = replace(a, ChrW(92), ChrW(47)) 
if inStr(a, ChrW(47)) > 0 then
a = mid(a, inStrRev(a, ChrW(47)) + 1) 
end if 
removeFileDir = a 
end function 

function baseName(byVal a)
baseName = removeFileDir(a) 
end function 

function getFileExtName(a)
dim b 
b = inStrRev(a, ChrW(46)) 
if b > 0 then
getFileExtName = mid(a, b + 1) 
else
getFileExtName = "" 
end if 
end function 







function handleFilePathArray(byVal a)
dim b, c, d, e 
a = handleFileUrl(a) 
b = mid(a, 1, inStrRev(a, ChrW(92))) 
c = mid(a, inStrRev(a, ChrW(92)) + 1) 
if inStrRev(c, ChrW(46)) > 0 then
d = mid(c, 1, inStrRev(c, ChrW(46)) - 1) 
else
d = "" 
end if 
if inStrRev(c, ChrW(46))=false then
e = ""
else
e = mid(c, inStrRev(c, ChrW(46)) + 1) 
if instr(e,ChrW(63))>0 then
e=mid(e,1,instr(e,ChrW(63))-1)
elseif instr(e,ChrW(38))>0 then
e=mid(e,1,instr(e,ChrW(38))-1)
end if
end if





handleFilePathArray = split(a & vbCrLf & b & vbCrLf & c & vbCrLf & d & vbCrLf & e, vbCrLf) 

end function 

function getFileAttr(byVal a, b)
dim c
b = cstr(b) 
if b = ChrW(48) then
getFileAttr = handleFilePathArray(a)(0) 
elseIf b = ChrW(49) then
getFileAttr = handleFilePathArray(a)(1) 
elseIf  b = ChrW(50) then
getFileAttr = handleFilePathArray(a)(2) 
elseIf b = ChrW(110)&ChrW(97)&ChrW(109)&ChrW(101) then
getFileAttr = handleFilePathArray(a)(2) 
c=instr(replace(getFileAttr,ChrW(38),ChrW(63)),ChrW(63))
if c>0 then
getFileAttr=mid(getFileAttr,1,c-1)
end if
elseIf b = ChrW(51) then
getFileAttr = handleFilePathArray(a)(3) 
elseIf b = ChrW(52) then
getFileAttr = handleFilePathArray(a)(4) 
end if 
end function 





function getFileExt(byval a)
dim b : b = split(a, ChrW(46))
if ubound(b)>0 then getFileExt = b(uBound(b))
end function

function getStrFileName(byVal a)
getStrFileName = handleFilePathArray(a)(2)
end function 

function getFileName(byVal a)
getFileName = handleFilePathArray(a)(2) 
end function 

function getParentPath(byVal a)
a = handlePath(a) 
if inStr(a, ChrW(92)) > 0 then
if right(a, 1) = ChrW(92) then
a = left(a, len(a) - 1) 
end if 
getParentPath = mid(a, 1, inStrRev(a, ChrW(92))) 
end if 
end function 
%>     
