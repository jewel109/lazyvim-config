return {
  "bloznelis/before.nvim",
  config = function()
    local before = require("before")
    before.setup()

    --doning some edit
    -- Jump to previous entry in the edit history
    vim.keymap.set("n", "<leader>zl", before.jump_to_last_edit, {})

    -- Jump to next entry in the edit history
    vim.keymap.set("n", "<leader>zn", before.jump_to_next_edit, {})
    --here also edit

    -- Look for previous edits in quickfix list
    vim.keymap.set("n", "<leader>oq", before.show_edits_in_quickfix, {})

    -- Look for previous edits in telescope (needs telescope, obviously)
    vim.keymap.set("n", "<leader>oe", function()
      before.show_edits_in_telescope(require("telescope.themes").get_dropdown())
    end, {})
  end,
}
