# Enable Remote Desktop
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0

# Add user to Remote Desktop Users group
$Username = "student" # Replace "username" with the actual username
$Group = "Remote Desktop Users"
$Domain = "example.com" # Use the computer name if it's not in a domain, otherwise, specify the domain name
$User = "$Domain\$Username"

# Check if the user is already in the group
if (-not (Get-LocalGroupMember -Group $Group -Member $User -ErrorAction SilentlyContinue)) {
    # Add user to the group
    Add-LocalGroupMember -Group $Group -Member $User
}

# Restart Remote Desktop Service for changes to take effect
Restart-Service -Name TermService -Force
