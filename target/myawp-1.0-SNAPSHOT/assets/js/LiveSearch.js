function showResult(str) {
    if (str.length==0) {
      return;
    }
    var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange=function() {
        document.getElementById("lis").innerHTML=this.responseText;
    };
    xmlhttp.open("GET","advsearch?str="+str,true);
    xmlhttp.send();
    }