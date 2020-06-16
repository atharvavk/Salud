function addquantity(x, y) {
	let initialcost = $('#Amount' + x).text();
	initialcost=parseFloat(initialcost);
	y=parseFloat(y)
	initialcost += y;
	initialcost=initialcost.toFixed(2)
    $('#Amount' + x).text(initialcost);

	let total = $('#Total').text();
	console.log(total)
	total=parseFloat(total);
	total += y;
	total=total.toFixed(2)
	console.log(total)
	$('#Total').text(total);
}
function subquantity(x, y) {
	let initialcost = $('#Amount' + x).text();
	initialcost=parseFloat(initialcost);
	y=parseFloat(y)
	if(initialcost>0){
	initialcost -= y;
	initialcost=initialcost.toFixed(2)
	$('#Amount' + x).text(initialcost);

	let total = $('#Total').text();
	console.log(total)
	total=parseFloat(total);
	total -= y;
	total=total.toFixed(2)
	console.log(total)
	$('#Total').text(total);}
}
