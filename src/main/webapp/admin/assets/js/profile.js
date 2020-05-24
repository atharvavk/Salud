function validateUserForm() {
	if (
		$("#usersettings input[name='number']").val() == '' &&
		$("#usersettings input[name='email']").val() == '' &&
		$("#usersettings input[name='first_name']").val() == '' &&
		$("#usersettings input[name='last_name']").val() == ''
	) {
		$('#usererror').html('Enter The value to be changed');
		return false;
	}

	if ($("#usersettings input[name='number']").val() != '') {
		if ($("#usersettings input[name='number']").val().length < 10) {
			$('#usererror').html('Enter Valid Mobile Number');
			return false;
		}
	} else if ($("#usersettings input[name='email']").val() != '') {
		if (
			$("#usersettings input[name='email']")
				.val()
				.match('^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}$') ==
			null
		) {
			$('#usererror').html('Enter Valid Email');
			return false;
		}
	} else if ($("#usersettings input[name='first_name']").val() != '') {
		if (
			$("#usersettings input[name='first_name']")
				.val()
				.match('[A-Za-z]+') == null
		) {
			$('#usererror').html('Enter Valid First Name');
			return false;
		}
	} else if ($("#usersettings input[name='last_name']").val() != '') {
		if (
			$("#usersettings input[name='last_name']")
				.val()
				.match('[A-Za-z]+') == null
		) {
			$('#usererror').html('Enter Valid Last Name');
			return false;
		}
	}
	return true;
}
function validateContactForm() {
	if ($("#contactsettings input[name='address']").val() == '') {
		$('#contacterror').html('Enter Address');
		return false;
	} else if ($("#contactsettings input[name='city']").val() == '') {
		$('#contacterror').html('Enter City');
		return false;
	}
	return true;
}
