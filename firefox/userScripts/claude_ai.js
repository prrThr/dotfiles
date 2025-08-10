// ==UserScript==
// @name         claude.ai - wide screen
// @namespace    https://claude.ai/
// @version      0.1
// @description  Change the max-width of .max-w-3xl class to 100%
// @author       cosrah
// @match        *://claude.ai/*
// @icon         https://www.google.com/s2/favicons?domain=claude.ai
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    // Function to change the CSS
    function changeCSS() {
        const style = document.createElement('style');
        style.type = 'text/css';
        style.innerHTML = `
            .max-w-3xl {
                max-width: 95% !important;
            }
        `;
        document.head.appendChild(style);
    }

    // Wait for the DOM to be fully loaded before applying the CSS change
    window.addEventListener('load', changeCSS);
})();
