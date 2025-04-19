& {
	function Test-XPSMessage {
		return $baseTypeInstance = [XPSMessage]::new("test-5-XPSMessage", [ConsoleColor]::DarkBlue)
	}

    ######################################################################
	
    return Test-XPSMessage
}