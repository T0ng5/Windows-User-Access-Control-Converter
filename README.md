# Windows_UAC_Convert
Converts the user access control bit vector of a user to human readable
#USAGE
PS> .\Convert-UACBV.ps1 <value>

#EXAMPLES
PS> .\Convert-UACBV.ps1 512
-NORMAL_ACCOUNT - It's a default account type that represents a typical user.

PS> .\Convert-UACBV.ps1 262656
-SMARTCARD_REQUIRED - When this flag is set, it forces the user to log on by using a smart card.
-NORMAL_ACCOUNT - It's a default account type that represents a typical user.
