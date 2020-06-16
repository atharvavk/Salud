function addcart(prodId,userid) {
    prodId = Number(prodId);
    userid = Number(userid);
    console.log("addcart");
    $("#prodadd"+prodId).attr("hidden",true);
    $("#proddel"+prodId).attr("hidden",false);
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'addcart?prodId=' + prodId + '&userId=' + userid, false);
    xhr.send(null);
    console.log(xhr.readyState);
}
function removecart(prodId,userid) {
    prodId = Number(prodId);
    userid = Number(userid);
    console.log("removecart");
    $("#prodadd"+prodId).attr("hidden",false);
    $("#proddel"+prodId).attr("hidden",true);
    const xhr = new XMLHttpRequest();
    xhr.open('GET', 'delcart?prodId=' + prodId + '&userId=' + userid, false);
    xhr.send(null);
    console.log(xhr.readyState);
}
