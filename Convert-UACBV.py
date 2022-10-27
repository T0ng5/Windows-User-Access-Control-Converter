
BitsList = {
    67108864:	"-PARTIAL_SECRETS_ACCOUNT - (Windows Server 2008/Windows Server 2008 R2) The account is a read-only domain controller (RODC). It's a security-sensitive setting. Removing this setting from an RODC compromises security on that server.",
    16777216:	"-TRUSTED_TO_AUTH_FOR_DELEGATION - (Windows 2000/Windows Server 2003) The account is enabled for delegation. It's a security-sensitive setting. Accounts that have this option enabled should be tightly controlled. This setting lets a service that runs under the account assume a client's identity and authenticate as that user to other remote servers on the network.",
    8388608:	"-PASSWORD_EXPIRED - (Windows 2000/Windows Server 2003) The user's password has expired.",
    4194304:	"-DONT_REQ_PREAUTH - (Windows 2000/Windows Server 2003) This account doesn't require Kerberos pre-authentication for logging on.",
    2097152:	"-USE_DES_KEY_ONLY - (Windows 2000/Windows Server 2003) Restrict this principal to use only Data Encryption Standard (DES) encryption types for keys.",
    1048576:	"-NOT_DELEGATED - When this flag is set, the security context of the user isn't delegated to a service even if the service account is set as trusted for Kerberos delegation.",
    524288:		"-TRUSTED_FOR_DELEGATION - When this flag is set, the service account (the user or computer account) under which a service runs is trusted for Kerberos delegation. Any such service can impersonate a client requesting the service.",
    262144:		"-SMARTCARD_REQUIRED - When this flag is set, it forces the user to log on by using a smart card.",
    131072:		"-MNS_LOGON_ACCOUNT - It's an MNS logon account.",
    65536:		"-DONT_EXPIRE_PASSWORD - Represents the password, which should never expire on the account.",
    8192:		"-SERVER_TRUST_ACCOUNT - It's a computer account for a domain controller that is a member of this domain.",
    4096:		"-WORKSTATION_TRUST_ACCOUNT - It's a computer account for a computer that is running Microsoft Windows NT 4.0 Workstation, Microsoft Windows NT 4.0 Server, Microsoft Windows 2000 Professional, or Windows 2000 Server and is a member of this domain.",
    2048:		"-INTERDOMAIN_TRUST_ACCOUNT - It's a permit to trust an account for a system domain that trusts other domains.",
    512:		"-NORMAL_ACCOUNT - It's a default account type that represents a typical user.",
    256:		"-TEMP_DUPLICATE_ACCOUNT - It's an account for users whose primary account is in another domain.",
    128:		"-ENCRYPTED_TEXT_PWD_ALLOWED - The user can send an encrypted password.",
    64:			"-PASSWD_CANT_CHANGE - The user can't change the password.",
    32:			"-PASSWD_NOTREQD - No password is required.",
    16:			"-LOCKOUT - Account is locked out.",
    8:			"-HOMEDIR_REQUIRED - The home folder is required.",
    2:			"-ACCOUNTDISABLE - The user account is disabled.",
    1:			"-SCRIPT - The logon script will be run."
}

#Input validation
def InputCheck():
    while True:
        try:
            return int(input("\n\nPlease enter an integer value to convert: "))
        except ValueError: 
            print("That is not a valid integer.")

'''
Returns the values from BitsList that are possible
Please note, there are many values that can be entered that are not 'valid' bit vectors.
That is, when you subtract the values from highest to lowest, you don't end up at 0.
'''
def GetValues(List, ToConvert):
    SortedValues = []
    EnglishValues = []
    for Val in List:
        SortedValues.append(Val)
    SortedValues.sort(reverse=True)

    #Subtracts the value from the entered value to convert and then adds the corresponding value from BitsList via the key
    for Val in SortedValues:
        if ToConvert >= Val:
            ToConvert -= Val
            EnglishValues.append(List.get(Val))
        
    #This is the check to make sure that the entered value was/is a valid bit vector
    if ToConvert != 0:
        EnglishValues = ["This isn't a valid UAC Bit Vector"]

    return EnglishValues

#Main loop, Keyboard Interrupt exits the program with "Good Bye" end exit code 0
while True:
    try:
        for line in GetValues(BitsList, InputCheck()):
            print(line)
    except KeyboardInterrupt:
        print("\nGood Bye")
        break

