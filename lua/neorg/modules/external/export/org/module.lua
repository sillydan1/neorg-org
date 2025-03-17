local neorg = require("neorg.core")
local lib, modules = neorg.lib, neorg.modules
local module = modules.create("external.export.org")

module.setup = function()
    return {
        success = true,
        requires = {
            "core.integrations.treesitter",
        },
    }
end

module.load = function()
    if module.config.public.extensions == "all" then
        module.config.public.extensions = {
            "todo-items-basic",
            "todo-items-pending",
            "todo-items-extended",
            "definition-lists",
            "mathematics",
            "metadata",
            "latex",
        }
    end
    module.config.public.extensions = lib.to_keys(module.config.public.extensions, {})
end

module.config.public = {
    extension = "org",
}

--- @class core.export.org
module.public = {
    extensions = {},
    export = {
        init_state = function()
            return {
                weak_indent = 0,
                indent = 0,
                ordered_list_level = {
                    0,
                    2,
                    4,
                    6,
                    8,
                    10,
                    12,
                },
                tag_indent = 0,
                tag_close = nil,
                ranged_tag_indentation_level = 0,
                is_url = false,
                footnote_count = 0,
            }
        end,

        functions = {
            ["single_footnote"] = true,
            ["_word"] = true,
            ["_space"] = true,
            ["_line_break"] = true,
            ["_paragraph_break"] = true,
            ["_segment"] = true,
            ["heading1_prefix"] = true,
            ["heading2_prefix"] = true,
            ["heading3_prefix"] = true,
            ["heading4_prefix"] = true,
            ["heading5_prefix"] = true,
            ["heading6_prefix"] = true,
            ["_open"] = true,
            ["_close"] = true,
            ["_begin"] = true,
            ["_end"] = true,
            ["link_file_text"] = true,
            ["link_target_url"] = true,
            ["escape_sequence"] = true,
            ["unordered_list1_prefix"] = true,
            ["unordered_list2_prefix"] = true,
            ["unordered_list3_prefix"] = true,
            ["unordered_list4_prefix"] = true,
            ["unordered_list5_prefix"] = true,
            ["unordered_list6_prefix"] = true,
            ["ordered_list1_prefix"] = true,
            ["ordered_list2_prefix"] = true,
            ["ordered_list3_prefix"] = true,
            ["ordered_list4_prefix"] = true,
            ["ordered_list5_prefix"] = true,
            ["ordered_list6_prefix"] = true,
            ["tag_parameters"] = true,
            ["tag_name"] = true,
            ["ranged_verbatim_tag_content"] = true,
            ["ranged_verbatim_tag_end"] = true,
            ["quote1_prefix"] = true,
            ["quote2_prefix"] = true,
            ["quote3_prefix"] = true,
            ["quote4_prefix"] = true,
            ["quote5_prefix"] = true,
            ["quote6_prefix"] = true,
            ["todo_item_done"] = true,
            ["todo_item_undone"] = true,
            ["todo_item_pending"] = true,
            ["todo_item_urgent"] = true,
            ["todo_item_cancelled"] = true,
            ["todo_item_recurring"] = true,
            ["todo_item_on_hold"] = true,
            ["todo_item_uncertain"] = true,
            ["single_definition_prefix"] = true,
            ["multi_definition_prefix"] = true,
            ["multi_definition_suffix"] = true,
            ["_prefix"] = true,
            ["capitalized_word"] = true,
            ["strong_carryover"] = true,
            ["weak_carryover"] = true,
            ["key"] = true,
            [":"] = true,
            ["["] = true,
            ["]"] = true,
            ["{"] = true,
            ["}"] = true,
            ["string"] = true,
            ["number"] = true,
            ["horizontal_line"] = true,
        },

        recollectors = {
            ["link_location"] = true,
            ["link"] = true,
            ["ranged_verbatim_tag"] = true,
            ["unordered_list1"] = true,
            ["unordered_list2"] = true,
            ["unordered_list3"] = true,
            ["unordered_list4"] = true,
            ["unordered_list5"] = true,
            ["unordered_list6"] = true,
            ["single_definition"] = true,
            ["multi_definition"] = true,
            -- TODO
            ["insertion"] = true,
            ["heading1"] = true,
            ["heading2"] = true,
            ["heading3"] = true,
            ["heading4"] = true,
            ["heading5"] = true,
            ["heading6"] = true,
            ["object"] = true,
            ["array"] = true,
        },

        cleanup = function()
        end,
    },
}

return module
