{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "dblt-tim";
      user.email = "timeodiebolt@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
