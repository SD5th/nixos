{
  programs.git = {
    enable = true;
    settings = {
      user.name = "SD5th";
      user.email = "62176060+SD5th@users.noreply.github.com";
      core.sshCommand = "ssh -i ~/.ssh/mentomori -o IdentitiesOnly=yes";
    };
  };
}
