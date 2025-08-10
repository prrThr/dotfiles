// ==UserScript==
// @name        WhatsApp Web - Iosevka Term Font
// @namespace   Violentmonkey Scripts
// @match       https://web.whatsapp.com/*
// @grant       GM_addStyle
// @version     1.0
// @author      Me
// @description Change WhatsApp Web font to Iosevka Term
// ==/UserScript==

(function () {
  'use strict';

  const style = document.createElement("style");
  style.innerHTML = `
    * {
      font-family: "Iosevka Term", monospace !important;
    }
  `;
  document.head.appendChild(style);
})();
