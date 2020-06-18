function addquantity(x, y) {
	let initialcost = $('#Amount' + x).text();
	initialcost =initialcost.replace(",","");
	initialcost=parseFloat(initialcost);
	y=parseFloat(y)
	initialcost += y;
	initialcost=initialcost.toFixed(2)
    $('#Amount' + x).text(initialcost);

	let total = $('#Total').text();
	total=total.replace(",","");
	total=parseFloat(total);
	total += y;
	total=total.toFixed(2)
	$('#Total').text(total);

	const xhr = new XMLHttpRequest();
	const userid = $("#userid").val();
	xhr.open('GET', 'addquantity?cartId=' + x , false);
	xhr.send(null);
	console.log(xhr.readyState);
}
function subquantity(x, y) {
	let initialcost = $('#Amount' + x).text();
	initialcost=initialcost.replace(",","");
	initialcost=parseFloat(initialcost);
	y=parseFloat(y)
	console.log("hiii",y,initialcost);
	if(initialcost>0){
		initialcost -= y;
		initialcost=initialcost.toFixed(2)
		$('#Amount' + x).text(initialcost);

		let total = $('#Total').text();
		total=total.replace(",","");
		total=parseFloat(total);
		total -= y;
		total=total.toFixed(2)
		$('#Total').text(total);
		const xhr = new XMLHttpRequest();
		xhr.open('GET', 'delquantity?cartId=' + x , false);
		xhr.send(null);
		console.log(xhr.readyState);
	}

}
