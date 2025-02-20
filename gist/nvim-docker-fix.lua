-- docker-compose-language-service only attaches to a file named yaml.docker-compose
-- which means docker-compose.yml / docker-compose.yaml will not hook into the
-- native lsp server.

-- This function looks at the currently open filepath and determines if it is a
-- docker.compose.{yml,yaml} file, if so, sets the current buffers file type to yaml.docker-compose
-- which activates the lsp if installed
function docker_fix()
	local filename = vim.fn.expand("%:t")

	if filename == "docker-compose.yaml" or filename == "docker-compose.yml" then
		vim.bo.filetype = "yaml.docker-compose"
	end
end

vim.cmd([[au BufRead * lua docker_fix()]])
