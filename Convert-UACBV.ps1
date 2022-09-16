
param
(
    [Parameter(Mandatory=$true, Position=0, ValueFromPipeline = $true)]
    $Decimal
)

$Result = @()

switch ($Decimal)
{
    {$Decimal -ge 67108864} {$Decimal -= 67108864; $Result += "-PARTIAL_SECRETS_ACCOUNT - (Windows Server 2008/Windows Server 2008 R2) The account is a read-only domain controller (RODC). It's a security-sensitive setting. Removing this setting from an RODC compromises security on that server."}
    {$Decimal -ge 16777216} {$Decimal -= 16777216; $Result += "-TRUSTED_TO_AUTH_FOR_DELEGATION - (Windows 2000/Windows Server 2003) The account is enabled for delegation. It's a security-sensitive setting. Accounts that have this option enabled should be tightly controlled. This setting lets a service that runs under the account assume a client's identity and authenticate as that user to other remote servers on the network."}
    {$Decimal -ge 8388608} {$Decimal -= 8388608; $Result += "-PASSWORD_EXPIRED - (Windows 2000/Windows Server 2003) The user's password has expired."}
    {$Decimal -ge 4194304} {$Decimal -= 4194304; $Result += "-DONT_REQ_PREAUTH - (Windows 2000/Windows Server 2003) This account doesn't require Kerberos pre-authentication for logging on."}
    {$Decimal -ge 2097152} {$Decimal -= 2097152; $Result += "-USE_DES_KEY_ONLY - (Windows 2000/Windows Server 2003) Restrict this principal to use only Data Encryption Standard (DES) encryption types for keys."}
    {$Decimal -ge 1048576} {$Decimal -= 1048576; $Result += "-NOT_DELEGATED - When this flag is set, the security context of the user isn't delegated to a service even if the service account is set as trusted for Kerberos delegation."}
    {$Decimal -ge 524288} {$Decimal -= 524288; $Result += "-TRUSTED_FOR_DELEGATION - When this flag is set, the service account (the user or computer account) under which a service runs is trusted for Kerberos delegation. Any such service can impersonate a client requesting the service."}
    {$Decimal -ge 262144} {$Decimal -= 262144; $Result += "-SMARTCARD_REQUIRED - When this flag is set, it forces the user to log on by using a smart card."}
    {$Decimal -ge 131072} {$Decimal -= 131072; $Result += "-MNS_LOGON_ACCOUNT - It's an MNS logon account."}
    {$Decimal -ge 65536} {$Decimal -= 65536; $Result += "-DONT_EXPIRE_PASSWORD - Represents the password, which should never expire on the account."}
    {$Decimal -ge 8192} {$Decimal -= 8192; $Result += "-SERVER_TRUST_ACCOUNT - It's a computer account for a domain controller that is a member of this domain."}
    {$Decimal -ge 4096} {$Decimal -= 4096; $Result += "-WORKSTATION_TRUST_ACCOUNT - It's a computer account for a computer that is running Microsoft Windows NT 4.0 Workstation, Microsoft Windows NT 4.0 Server, Microsoft Windows 2000 Professional, or Windows 2000 Server and is a member of this domain."}
    {$Decimal -ge 2048} {$Decimal -= 2048; $Result += "-INTERDOMAIN_TRUST_ACCOUNT - It's a permit to trust an account for a system domain that trusts other domains."}
    {$Decimal -ge 512} {$Decimal -= 512; $Result += "-NORMAL_ACCOUNT - It's a default account type that represents a typical user."}
    {$Decimal -ge 256} {$Decimal -= 256; $Result += "-TEMP_DUPLICATE_ACCOUNT - It's an account for users whose primary account is in another domain."}
    {$Decimal -ge 128} {$Decimal -= 128; $Result += "-ENCRYPTED_TEXT_PWD_ALLOWED - The user can send an encrypted password."}
    {$Decimal -ge 64} {$Decimal -= 64; $Result += "-PASSWD_CANT_CHANGE - The user can't change the password."}
    {$Decimal -ge 32} {$Decimal -= 32; $Result += "-PASSWD_NOTREQD - No password is required."}
    {$Decimal -ge 16} {$Decimal -= 16; $Result += "-LOCKOUT - Account is locked out."}
    {$Decimal -ge 8} {$Decimal -= 8; $Result += "-HOMEDIR_REQUIRED - The home folder is required."}
    {$Decimal -ge 2} {$Decimal -= 2; $Result += "-ACCOUNTDISABLE - The user account is disabled."}
    {$Decimal -ge 1} {$Decimal -= 1; $Result += "-SCRIPT - The logon script will be run."}
    {$Decimal -ne 0} {$Result = "This isn't a valid UAC Bit Vector"}
}

return $Result

