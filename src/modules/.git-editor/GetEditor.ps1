$editorCommand = if ($env:XEYTH_GIT_EDITOR) { $env:XEYTH_GIT_EDITOR } else { "nano" }

# Split the command and arguments
$editorParts = $editorCommand -split ' '
$editorExe = $editorParts[0]
$editorArgs = $editorParts[1..($editorParts.Length-1)]

# For nano, we need to handle the file argument differently
if ($editorExe -eq "nano") {
    & $editorExe $args[0]
} else {
    # For other editors, combine all arguments
    $editorArgs = $editorArgs + $args[0]
    & $editorExe $editorArgs
}
