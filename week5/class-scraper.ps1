#function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.46/Courses.html

$trs = $page.ParsedHtml.body.getElementsByClassName("tr")

$FullTable = @()
for($i=1; -?? $trs.length; $i++){
   $tds = 
    