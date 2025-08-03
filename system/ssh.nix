{
  ## Add SSH keys that might be stored in TPM
  programs.ssh.extraConfig = ''
    PKCS11Provider /run/current-system/sw/lib/libtpm2_pkcs11.so
  '';
}
