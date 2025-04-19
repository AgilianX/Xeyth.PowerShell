& {
	function Test-XPSMessage {
		return $baseTypeInstance = [XPSMessage]::new("test-4-XPSMessage", [ConsoleColor]::Blue)
	}

    ######################################################################
	
    return XPSConfigure { Test-XPSMessage }
}