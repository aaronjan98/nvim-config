local ls = require("luasnip") --{{{
local s, i, t = ls.s, ls.i, ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local events = require("luasnip.util.events")

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Javascript Snippets", { clear = true })
local file_pattern = "*.js"

return {
	-- git
	s("git add .", t("git add .")),
	s("git add -A", t("git add -A")),
	s("git status", t("git status")),
	s("git commit --amend --no-edit", t("git commit --amend --no-edit")),
	s(
		"git commit -am",
		fmt(
			[[
git commit -am "{}"
	]],
			{
				i(1),
			}
		)
	),
	s(
		"git commit -m",
		fmt(
			[[
git commit -m "{}"
	]],
			{
				i(1),
			}
		)
	),
	s(
		"git clone react_hardhat_template.git",
		fmt(
			[[
git clone git@github.com:aaronjan98/react_hardhat_template.git {}
	]],
			{
				i(1, "new_project"),
			}
		)
	),
	-- repositories
	s(
		"gh api --method POST (create repo)",
		fmt(
			[[
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /user/repos \
  -f name='{}' \
  -f homepage='https://github.com'
]],
			{ i(1, "repo-name") }
		)
	),
	s(
		"git remote add origin",
		fmt(
			[[
git remote add origin git@github.com:aaronjan98/{}.git
		]],
			{ i(1, "repo-name") }
		)
	),
	s("gh repo view --web", t("gh repo view --web")),
	s("git remote remove origin", t("git remote remove origin")),
	-- npm
	s("sudo npm install -g npm@latest", t("sudo npm install -g npm@latest")),
	s("npm publish --access public", t("npm publish --access public")),
	s("npm run start", t("npm run start")),
	s("npm install", t("npm install")),
	s("npm install --save-dev", t("npm install --save-dev")),
	-- ganache
	s(
		"ganache-cli -paem",
		fmt(
			[[
ganache-cli -p {} -a {} -e {} -m "{}"
		]],
			{
				i(1, "9000"),
				i(2, "20"),
				i(3, "10000"),
				i(4, "seed phrase"),
			}
		)
	),
	-- hardhat
	s(
		"npx hardhat run scripts/{}.js --network ganache",
		fmt(
			[[
npx hardhat run scripts/{} --network ganache
		]],
			{
				i(1, "deploy.js"),
			}
		)
	),
}
