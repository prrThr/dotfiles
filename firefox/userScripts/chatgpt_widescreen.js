// ==UserScript==
// @name        ChatGPT Widescreen
// @namespace   Violentmonkey Scripts
// @match       *://chatgpt.com/*
// @grant       GM_addStyle
// @version     1.0
// @icon        https://static.vecteezy.com/system/resources/previews/024/558/800/large_2x/openai-chatgpt-logo-icon-free-png.png
// @author      Me
// @description Widescreen with just changing the CSS
// ==/UserScript==

// Expand general responses to 100% of the available width.
GM_addStyle(".text-token-text-primary>div>div{max-width:100%!important}");

// For "Which response do you prefer? [Response 1 | Response 2]"
// expand both responses to 50% of the available width.
GM_addStyle(".min-w-fit>div{max-width:100%!important}");

// Force JetBrains font
GM_addStyle(`
    * {
        font-family: 'Iosevka Term', monospace !important;
    }
`);
