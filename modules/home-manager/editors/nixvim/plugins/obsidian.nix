{ ... }:

{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
        conceallevel = 1;
        completion = {
            min_chars = 2;
            nvim_cmp = true;
        };
        new_notes_location = "current_dir";
        workspaces = [
            {
                name = "mind";
                path = "~/Documents/Docs/Obi-vault-mind";
            }
            {
                name = "shared";
                path = "~/Documents/Docs/obi-vault-shared";
            }
        ];
    };
  };
}
