let
  UserKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPkmsU/Z8QBlfZmf3Y/jWU9EbQxavTTwX8zkVJNdBUHe voidwalter@proton.me";

  HostKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJMUYetRx1+g7lFf8dDKlg66LBJq7A1WP1UN2V/voP2v voidwalter@proton.me";
in
{
  # Define the rule for 'flake-token.age'
  "flake-token.age".publicKeys = [
    UserKey
    HostKey
  ];
}
