
$(document).ready(function () {
	$('form[id="user"] input[name="number"]').mask('(000)-000-0000');
	// alert("rishabh");
	
	$('form[id="user"]').submit(function (e) {
		let retval = true;
		const fname = $(
			'form[id="user"] input[name="first_name"]'
		).val();
		const lname = $(
			'form[id="user"] input[name="last_name"]'
		).val();
		const email = $('form[id="user"] input[name="email"]').val();
		const number = $('form[id="user"] input[name="number"]').val();
		const pwd = $('form[id="user"] input[name="password"]').val();
		const pwd2 = $(
			'form[id="user"] input[name="password_repeat"]'
		).val();
//                console.log(pwd+"hi"+pwd2);
		if (pwd !== pwd2) {
			$('form[id="user"] input[name="password_repeat"]').addClass(
				'is-invalid'
			);
			retval = false;
		}
                else{
                    $('form[id="user"] input[name="password_repeat"]').removeClass(
				'is-invalid'
			);
                    $('form[id="user"] input[name="password_repeat"]').addClass(
				'is-valid'
			);
                }

		if (!pwd.match('^(?=.*[\\w])(?=.*[\\W])[\\w\\W]{8,}$')) {
			$('form[id="user"] input[name="password"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[id="user"] input[name="password"]').removeClass(
				'is-invalid'
			);
			$('form[id="user"] input[name="password"]').addClass(
				'is-valid'
			);
		}
		if (fname.length === 0) {
			$('form[id="user"] input[name="first_name"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[id="user"] input[name="first_name"]').removeClass(
				'is-invalid'
			);
			$('form[id="user"] input[name="first_name"]').addClass(
				'is-valid'
			);
		}
		if (lname.length === 0) {
			$('form[id="user"] input[name="last_name"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[id="user"] input[name="last_name"]').removeClass(
				'is-invalid'
			);
			$('form[id="user"] input[name="last_name"]').addClass(
				'is-valid'
			);
		}
		if (
			!email.match(
				'^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$'
			)
		) {
			$('form[id="user"] input[name="email"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[id="user"] input[name="email"]').removeClass(
				'is-invalid'
			);
			$('form[id="user"] input[name="email"]').addClass(
				'is-valid'
			);
		}
		if (!number.match('^\\(\\d{3}\\)-\\d{3}-\\d{4}$')) {
			$('form[id="user"] input[name="number"]').addClass(
				'is-invalid'
			);
			retval = false;
		} else {
			$('form[id="user"] input[name="number"]').removeClass(
				'is-invalid'
			);
			$('form[id="user"] input[name="number"]').addClass(
				'is-valid'
			);
		}
		if (retval === false) {
			e.preventDefault();
		}
	});
});
