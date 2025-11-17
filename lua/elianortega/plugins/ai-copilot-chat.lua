-- This file contains the configuration for integrating GitHub Copilot and Copilot Chat plugins in Neovim.

-- Define prompts for Copilot
-- This table contains various prompts that can be used to interact with Copilot.
local prompts = {
	Explain = "Please explain how the following code works.", -- Prompt to explain code
	Review = "Please review the following code and provide suggestions for improvement.", -- Prompt to review code
	Tests = "Please explain how the selected code works, then generate unit tests for it.", -- Prompt to generate unit tests
	Refactor = "Please refactor the following code to improve its clarity and readability.", -- Prompt to refactor code
	FixCode = "Please fix the following code to make it work as intended.", -- Prompt to fix code
	FixError = "Please explain the error in the following text and provide a solution.", -- Prompt to fix errors
	BetterNamings = "Please provide better names for the following variables and functions.", -- Prompt to suggest better names
	Documentation = "Please provide documentation for the following code.", -- Prompt to generate documentation
	JsDocs = "Please provide JsDocs for the following code.", -- Prompt to generate JsDocs
	DocumentationForGithub = "Please provide documentation for the following code ready for GitHub using markdown.", -- Prompt to generate GitHub documentation
	CreateAPost = "Please provide documentation for the following code to post it in social media, like Linkedin, it has be deep, well explained and easy to understand. Also do it in a fun and engaging way.", -- Prompt to create a social media post
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.", -- Prompt to generate Swagger API docs
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.", -- Prompt to generate Swagger JsDocs
	Summarize = "Please summarize the following text.", -- Prompt to summarize text
	Spelling = "Please correct any grammar and spelling errors in the following text.", -- Prompt to correct spelling and grammar
	Wording = "Please improve the grammar and wording of the following text.", -- Prompt to improve wording
	Concise = "Please rewrite the following text to make it more concise.", -- Prompt to make text concise
}

-- Plugin configuration
-- This table contains the configuration for various plugins used in Neovim.
return {

	-- Copilot Chat plugin configuration
	{
		"CopilotC-Nvim/CopilotChat.nvim", -- Load the Copilot Chat plugin
		opts = {
			prompts = prompts,
			system_prompt = [[
        You are an assistant helping with the following technologies:
        - Flutter for mobile development.
        - Cloud Functions with TypeScript.
        - Firebase and Supabase for backend services.
        - Occasionally, NestJS for backend development.
        - React for web development.

        Always ask questions if something is not clear. Follow best coding practices and standards at all times, ensuring that code is maintainable, efficient, and properly documented.

        Prioritize:
        - Clean, readable code.
        - Strong error handling and validations.
        - Efficient database queries and API interactions.
        - Consistency in style and structure.

        Always check for edge cases and optimize for performance where necessary.
        ]],
			model = "gemini-2.5-pro",
			answer_header = "👨‍💻 EMOV 👨‍💻  ",
			window = {
				layout = "float",
			},
		},
	},
}
