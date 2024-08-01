{ ... }:

{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
        #conceallevel = 1;
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
        daily_notes = {
        #-- Optional, if you keep daily notes in a separate directory.
            folder = "notes/dailies";
        #-- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y-%m-%d";
        #-- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y";
        #-- Optional, default tags to add to each new daily note created.
            default_tags = [ "daily-notes" ];
        #-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            #template = nil:
        };
    };
  };
}
