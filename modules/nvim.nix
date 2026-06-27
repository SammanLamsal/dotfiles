{config, pkgs, ...}: 

{
  environment.systemPackages = with pkgs; [
    lua-language-server   
    pyright
    marksman
    typescript-language-server
    gopls
    angular-language-server
    vimPlugins.nvim-jdtls
    gcc 
    clang-tools
  ];
}
