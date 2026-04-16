local utils = require "nvchad.stl.utils"

local M = {}

M.mode = function()
  if not utils.is_activewin() then
    return ""
  end

  local modes = utils.modes
  local m = vim.api.nvim_get_mode().mode
  return "%#St_" .. modes[m][2] .. "mode#" .. "  " .. modes[m][1] .. " "
end

M.file = function()
  local x = utils.file()
  local name = " " .. x[2] .. " "
  local bo = vim.bo[utils.stbufnr()]

  local flags = ""
  if bo.readonly or not bo.modifiable then
    flags = flags .. " "
  end
  if bo.modified then
    flags = flags .. "● "
  end

  return "%#StText# " .. x[1] .. name .. (flags ~= "" and ("%#St_lspWarning#" .. flags) or "")
end

M.git = utils.git
M.lsp_msg = utils.lsp_msg
M.diagnostics = utils.diagnostics

M.lsp = function()
  return "%#St_Lsp#" .. utils.lsp()
end

local kube_cache = { value = "", ts = 0 }

local function kube_context()
  local now = vim.uv.now()
  if now - kube_cache.ts < 10000 then
    return kube_cache.value
  end

  local ctx = vim.env.KUBE_CONTEXT
  if not ctx or ctx == "" then
    local kubeconfig = vim.env.KUBECONFIG
    if kubeconfig and kubeconfig ~= "" then
      ctx = kubeconfig:match("([^/\\:]+)$")
    end
  end

  kube_cache.ts = now
  kube_cache.value = (ctx and ctx ~= "") and ("%#St_gitIcons# 󱃾 " .. ctx .. " ") or ""
  return kube_cache.value
end

M.kube = function()
  return vim.o.columns > 120 and kube_context() or ""
end

M.cwd = function()
  local name = vim.uv.cwd()
  name = "%#St_cwd# 󰉖 " .. (name:match "([^/\\]+)[/\\]*$" or name) .. " "
  return (vim.o.columns > 85 and name) or ""
end

M.cursor = "%#StText# Ln %l, Col %v "
M["%="] = "%="

return function()
  return utils.generate("vscode", M)
end
