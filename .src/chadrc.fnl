

{
  :plugins (require "custom.plugins")
  :mappings {
    :user {
      :n { 
             :<left>    [ "<cmd> cprev <cr>" "" ]
             :<leader>n [ 
                          (fn [] 
                            (let [m (require "nvchad_ui.tabufline")] (m.tabuflineNext) )) 
                          "go to next buffer" ]
          }
    }
  }
}
