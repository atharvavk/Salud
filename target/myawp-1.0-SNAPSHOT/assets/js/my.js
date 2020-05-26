
$(document).ready(function () {
	$('form[action="register"] input[name="number"]').mask('(000)-000-0000');
	// alert("rishabh");
	$('form[action="login"]').submit(function (e) {
		let retval = false;
		var email = $('form[action="login"] input[name="email"]').val();
		var pwd = $('form[action="login"] input[name="password"]').val();
		if (pwd.length === 0) {
			$('form[action="login"] input[name="password"]').addClass(
				'is-invalid'
			);
			retval = true;
		} else {
			$('form[action="login"] input[name="password"]').removeClass(
				'is-invalid'
			);
			$('form[action="login"] input[name="password"]').addClass(
				'is-valid'
			);
		}
		if (email.length === 0) {
			$('form[action="login"] input[name="email"]').addClass(
				'is-invalid'
			);
			retval = true;
		} else {
			$('form[action="login"] input[name="email"]').removeClass(
				'is-invalid'
			);
			$('form[action="login"] input[name="email"]').addClass('is-valid');
		}
		if (retval === true) {
			e.preventDefault();
		}
	});
	$('form[action="register"]').submit(function (e) {
		let retval = true;
		const fname = $(
			'form[action="register"] input[name="first_name"]'
		).val();
		const lname = $(
			'form[action="register"] input[name="last_name"]'
		).val();
		const email = $('form[action="register"] input[name="email"]').val();
		const number = $('form[action="register"] input[name="number"]').val();
		const pwd = $('form[action="register" ] input[name="password"]').val();
		const pwd2 = $(
			'form[action="register"] input[name="password_repeat"]'
		).val();
//                console.log(pwd+"hi"+pwd2);
		if (pwd !== pwd2) {
			$('form[action="register"] input[name="password_repeat"]').addClass(
				'is-invalid'
			);
			retval = false;
		}
                else{
                    $('form[action="register"] input[name="password_repeat"]').removeClass(
				'is-invalid'
			);
                    $('form[action="register"] input[name="password_repeat"]').addClass(
				'is-valid'
			);
                }

		if (!pwd.match('^(?=.*[\\w])(?=.*[\\W])[\\w\\W]{8,}$')) {
			$('form[action="register" ] input[name="password"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[action="register" ] input[name="password"]').removeClass(
				'is-invalid'
			);
			$('form[action="register" ] input[name="password"]').addClass(
				'is-valid'
			);
		}
		if (fname.length === 0) {
			$('form[action="register"] input[name="first_name"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[action="register"] input[name="first_name"]').removeClass(
				'is-invalid'
			);
			$('form[action="register"] input[name="first_name"]').addClass(
				'is-valid'
			);
		}
		if (lname.length === 0) {
			$('form[action="register"] input[name="last_name"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[action="register"] input[name="last_name"]').removeClass(
				'is-invalid'
			);
			$('form[action="register"] input[name="last_name"]').addClass(
				'is-valid'
			);
		}
		if (
			!email.match(
				'^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$'
			)
		) {
			$('form[action="register"] input[name="email"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[action="register"] input[name="email"]').removeClass(
				'is-invalid'
			);
			$('form[action="register"] input[name="email"]').addClass(
				'is-valid'
			);
		}
		if (!number.match('^\\(\\d{3}\\)-\\d{3}-\\d{4}$')) {
			$('form[action="register"] input[name="number"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[action="register"] input[name="number"]').removeClass(
				'is-invalid'
			);
			$('form[action="register"] input[name="number"]').addClass(
				'is-valid'
			);
		}
		if (retval === false) {
			e.preventDefault();
		}
	});
});
