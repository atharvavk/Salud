$(document).ready(function(){
	const number = $('[name="number"]').mask("(0000)-000-000")
},
function validateLogin() {
	var email = $('[name = "email"]').val();
	var pwd = $('[name = "password"]').val();
	var retval = true;
	if (pwd.length == 0) {
		$('.text-danger').text(email);
		$('[name="password"]').addClass('is-invalid');
		retval = false;
	}
	if (email.length == 0) {
		$('[name="email"]').addClass('is-invalid');

		retval = false;
	}
	return retval;
},
function validateRegister() {
    let retval = true;
	var fname = $('[name="first_name"]').val();
	var lname = $('[name="last_name"]').val();
	const email = $('[name="email"]').val();
	const number = $('[name="number"]').val();
	const pwd = $('[name="password"]').val();
	const pwd2 = $('[name="password_repeat"]').val();
	if (pwd != pwd2) {
		$('[name="password_repeat"]').addClass('is-invalid');
		retval = false;
	}

	if (!pwd.match('^(?=.*[w])(?=.*[W])[wW]{8,}$')) {
		$('[name="password"]').addClass('is-invalid');
		retval = false;
	}
	if (fname.length == 0) {
		$('[name="first_name"]').addClass('is-invalid');
		retval = false;
	}
	if (lname.length == 0) {
		$('[name="last_name"]').addClass('is-invalid');
		retval = false;
	}
	if (
		!email.match(
			'^[a-zA-Z0-9_+&*-] + (?:\\.[a-zA-Z0-9_+&*-]+ )*@(?:[a-zA-Z0-9-]+\\.) + [a-zA-Z]{2, 7}'
		)
	) {
		$('[name="email"]').addClass('is-invalid');
		retval = false;
	}
	if (!number.match('(0/91)?[7-9][0-9]{9}')) {
		$('[name="number"]').addClass('is-invalid');
		retval = false;
	}
	return retval;
}
