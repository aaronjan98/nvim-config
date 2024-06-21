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

-- repeat nodes
local same = function(index)
	return f(function(arg)
		return arg[1]
	end, { index }) -- text currently in the node
end

return {
	s(
		"= () => {}",
		fmt(
			[[
= () => {{
	{}
}}
  ]],
			{
				i(1),
			}
		)
	),
	s(
		"=> {}",
		fmt(
			[[
=> {{
	{}
}}
  ]],
			{
				i(1),
			}
		)
	),
	-- component
	s(
		"const Component",
		fmt(
			[[
const {} = () => {{
	return (
		<>{}</>
	)
}}

export default {}
		]],
			{
				i(1, "Component"),
				i(2),
				same(1),
			}
		)
	),
	s(
		"eventHandler",
		fmt(
			[[
const {} = e => {{
	e.preventDefault()
	console.log('{}')
}}
		]],
			{
				i(1, "eventHandler"),
				i(2, "working..."),
			}
		)
	),
	-- hardhat ethers
	s("await ethers.getSigners()", t("await ethers.getSigners()")),
	s(
		"await ethers.getContractFactory()",
		fmt(
			[[
await ethers.getContractFactory('{}')
		]],
			{ i(1, "Contract") }
		)
	),
	s(
		"await Contract.deploy()",
		fmt(
			[[
await {}.deploy({})
		]],
			{ i(1), i(2) }
		)
	),
	-- ethers
	s(
		"ethers.utils.formatEther",
		fmt(
			[[
ethers.utils.formatEther({})
		]],
			{ i(1) }
		)
	),
	s(
		"ethers.BigNumber.from",
		fmt(
			[[
ethers.BigNumber.from({})
		]],
			{ i(1) }
		)
	),
	s(
		"ethers.provider.getBalance",
		fmt(
			[[
await ethers.provider.getBalance({}.address)
		]],
			{
				i(1, "contract"),
			}
		)
	),
	s(
		"ethers.utils.getAddress",
		fmt(
			[[
ethers.utils.getAddress({})
		]],
			{
				i(1, "0x0000000000000000000000000000000000000000"),
			}
		)
	),
	-- import
	s("import { ethers } from 'ethers'", t("import { ethers } from 'ethers'")),
	s(
		"req",
		fmt(
			[[
const {{ {} }} = require('{}')
  ]],
			{
				f(function(import_name)
					local parts = vim.split(import_name[1][1], "/", true)
					return parts[#parts] or ""
				end, { 1 }),
				i(1),
			}
		)
	),
	s(
		"require",
		fmt(
			[[
const {{ {} }} = require('{}')
  ]],
			{
				i(1),
				i(2),
			}
		)
	),
	-- export
	s("export default", {
		t("export default"),
	}),
	s(
		"log",
		fmt(
			[[
console.log({})
  ]],
			{
				i(0, ""),
			}
		)
	),
	-- [[ Solidity Testing ]]
	s(
		"describe",
		fmt(
			[[
describe('{}', async ({}) => {{
    {}
}})
  ]],
			{ i(1, "WhatchaTesting"), i(2, ""), i(3, "") }
		)
	),
	s(
		"success",
		fmt(
			[[
describe('Success', async ({}) => {{
    {}
}})
  ]],
			{ i(1, ""), i(2, "") }
		)
	),
	s(
		"failure",
		fmt(
			[[
describe('Failure', async ({}) => {{
    {}
}})
  ]],
			{ i(1, ""), i(2, "") }
		)
	),
	s(
		"beforeEach",
		fmt(
			[[
beforeEach(async () => {{
    {}
}})
  ]],
			{
				i(1),
			}
		)
	),
	s(
		"async",
		fmt(
			[[
async () => {{
    {}
}}
  ]],
			{
				i(1),
			}
		)
	),
	s(
		"expect().to.equal()",
		fmt(
			[[
expect({}).to.equal({})
]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		"expect().to.not.equal()",
		fmt(
			[[
expect({}).to.not.equal({})
]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		"expect().to.be.greaterThan()",
		fmt(
			[[
expect({}).to.be.greaterThan({})
]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		"expect().to.emit().withArgs()",
		fmt(
			[[
expect({}).to.emit({}).withArgs({})
]],
			{
				i(1),
				i(2),
				i(3),
			}
		)
	),
	s(
		"expect().to.be.reverted",
		fmt(
			[[
expect({}).to.be.reverted
]],
			{
				i(1),
			}
		)
	),
	s(
		"expect().to.be.fulfilled",
		fmt(
			[[
expect({}).to.be.fulfilled
]],
			{
				i(1),
			}
		)
	),
	s("result", t("result = await transaction.wait()")),
	s("await transaction.wait()", t("await transaction.wait()")),

	-- Deployment
	s("const { chainId } = await provider.getNetwork()", t("const { chainId } = await provider.getNetwork()")),
	s("import config from '../config.json'", t("import config from '../config.json'")),
	s(
		"import ABI from '../abis/Contract.json'",
		fmt(
			[[
import {} from '{}'
		]],
			{ i(1, "ABI"), i(2, "../abis/Contract.json") }
		)
	),
	-- scripts
	s(
		"main().catch(err => process.exitCode = 1)",
		fmt(
			[[
main().catch(error => {{
  console.error(error)
  process.exitCode = 1
}})
		]],
			{}
		)
	),
	-- React jsx
	s(
		"h1",
		fmt(
			[[
<h1>{}</h1>
]],
			{
				i(1),
			}
		)
	),
	s(
		"h2",
		fmt(
			[[
<h2>{}</h2>
]],
			{
				i(1),
			}
		)
	),
	s(
		"h3",
		fmt(
			[[
<h3>{}</h3>
]],
			{
				i(1),
			}
		)
	),
	s(
		"h4",
		fmt(
			[[
<h4>{}</h4>
]],
			{
				i(1),
			}
		)
	),
	s(
		"h5",
		fmt(
			[[
<h5>{}</h5>
]],
			{
				i(1),
			}
		)
	),
	s(
		"h6",
		fmt(
			[[
<h6>{}</h6>
]],
			{
				i(1),
			}
		)
	),
	s(
		"p",
		fmt(
			[[
<p>{}</p>
]],
			{
				i(1),
			}
		)
	),
	s(
		"div",
		fmt(
			[[
<div>{}</div>
]],
			{
				i(1),
			}
		)
	),
	s(
		"head",
		fmt(
			[[
<head>{}</head>
]],
			{
				i(1),
			}
		)
	),
	s(
		"title",
		fmt(
			[[
<title>{}</title>
]],
			{
				i(1),
			}
		)
	),
	s(
		"body",
		fmt(
			[[
<body>{}</body>
]],
			{
				i(1),
			}
		)
	),
	s(
		"em",
		fmt(
			[[
<em>{}</em>
]],
			{
				i(1),
			}
		)
	),
	s(
		"img",
		fmt(
			[[
<img>{}</img>
]],
			{
				i(1),
			}
		)
	),
	s(
		"b",
		fmt(
			[[
<b>{}</b>
]],
			{
				i(1),
			}
		)
	),
	s(
		"i",
		fmt(
			[[
<i>{}</i>
]],
			{
				i(1),
			}
		)
	),
	s(
		"small",
		fmt(
			[[
<small>{}</small>
]],
			{
				i(1),
			}
		)
	),
	s(
		"u",
		fmt(
			[[
<u>{}</u>
]],
			{
				i(1),
			}
		)
	),
	s(
		"a",
		fmt(
			[[
<a>{}</a>
]],
			{
				i(1),
			}
		)
	),
	s(
		"li",
		fmt(
			[[
<li>{}</li>
]],
			{
				i(1),
			}
		)
	),
	s(
		"ol",
		fmt(
			[[
<ol>{}</ol>
]],
			{
				i(1),
			}
		)
	),
	s(
		"ul",
		fmt(
			[[
<ul>{}</ul>
]],
			{
				i(1),
			}
		)
	),
	s(
		"br",
		fmt(
			[[
<br>{}</br>
]],
			{
				i(1),
			}
		)
	),
	s(
		"<!",
		fmt(
			[[
<!-- {} -->
]],
			{
				i(1),
			}
		)
	),
}
