


(macro safe_setup [mname c]
       `(let [(p# m#) (require ,mname)]
          (if p#
            (m#.setup ,c)))
       )

{
 :tpope/vim-surround {} 
 :hkupty/iron.nvim 
 {:config 
  (fn [] (safe_setup 
           :iron.nvim
           {:config {}
            :keymaps 
            { 
             :send_motion :<space>sc
             :visual_send :<space>sc
             }
            }))
  }
 :jose/null-ls.nvim
 {:config 
  (fn [] 
    (let [[present m] (require "null-ls")]
      (if present 
        (m.setup 
          {:debug true 
           :sources 
           [
            m.builtins.formatting.uncrustify 
            m.builtins.formatting.yapf
            ]}))
      )
    )}
 :trouble 
 {:config (fn [] (safe_setup "trouble"))}

 :mini.move 
 {:config 
  (fn [] 
    (safe_setup "mini.move" 
                {:mappings 
                 {:left :<Left>
                  :right :<Right>
                  }})
    )}

 :nvim-jdtls 
 {
  :ft [ :java ]
  :config 
  (fn [] 
    (
     (. (require "jdtls") :start_or_attach)
     {:config 
      {
       :cmd [(.. (os.getenv "HOME") "/.local/share/nvim/mason/bin/jdtls")]
       :root_dir (vim.fs.dirname 
                   (. (vim.fs.find [".gradlew" ".git" "mvnw"] {:upward true}) 
                      1))
       :on_attach (fn [client buffer] 
                    (set client.server_capabilities.documentFormattingProvider false)
                    (set client.server_capabilities.documentRangeFormattingProvider false)
                    ((. (require "core.utils") load_mapping) "lspconfig" {:buffer bufnr})
                    (if client.server_capabilities.signatureHelpProvider 
                      ((. (require "nvchad_ui.signature") :setup) client)))}
      }))}
 }
