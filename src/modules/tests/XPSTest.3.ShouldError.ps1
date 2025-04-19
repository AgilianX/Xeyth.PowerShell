& {
	function Test-String {
		return "test-3-string"
	}

    ######################################################################
	
	SomeInvalidCodeThatShouldThrow

    return XPSConfigure { Test-String } 
}