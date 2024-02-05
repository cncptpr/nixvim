{
  plugins = {
    lsp.servers.rust-analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
    };
    crates-nvim.enable = true;
  };
}
