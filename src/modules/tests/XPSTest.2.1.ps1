& {
	function Test-String {
		return "test-2-string"
	}
    
	function Test-XPSMessage {
		return $baseTypeInstance = [XPSMessage]::new("test-2-XPSMessage", [ConsoleColor]::Magenta)
	}

    ######################################################################
	
    return XPSConfigure { Test-String }, { Test-XPSMessage } 
}