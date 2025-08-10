// ==UserScript==
// @name         Zabbix Docs Toggle left panel
// @namespace    Violentmonkey Scripts
// @match        https://www.zabbix.com/documentation/current/en/*
// @grant        none
// @icon         https://icon-icons.com/icons2/2699/PNG/512/zabbix_logo_icon_167937.png
// @version      1.0
// @author       Meteco
// @description  Add a toggle button for the left panel on Zabbix documentation.
// ==/UserScript==

(function() {
    'use strict';

    // Create the toggle button
    const toggleButton = document.createElement('button');
    toggleButton.textContent = 'Toggle left panel';
    toggleButton.style.marginLeft = '10px'; // Espaçamento entre o botão de download e o botão de alternância
    toggleButton.style.padding = '5px 10px';
    toggleButton.style.backgroundColor = '#ffffff';
    toggleButton.style.color = '#333333';
    toggleButton.style.border = '1px solid #dadada';
    toggleButton.style.borderRadius = '3px';
    toggleButton.style.cursor = 'pointer';
    toggleButton.style.fontSize = '14px';

    // Estilo ao passar o mouse
    toggleButton.addEventListener('mouseover', () => {
        toggleButton.style.backgroundColor = '#444';
        toggleButton.style.borderColor = '#666';
    });
    toggleButton.addEventListener('mouseout', () => {
        toggleButton.style.backgroundColor = '#333';
        toggleButton.style.borderColor = '#555';
    });

    // Find the parent element (group-2)
    const group2 = document.querySelector('.group-2');

    if (group2) {
        // Insert the toggle button next to the download button
        group2.appendChild(toggleButton);

        // Panel selector
        const panel = document.querySelector('#dokuwiki__aside');

        // Toggle visibility on button click
        toggleButton.addEventListener('click', () => {
            if (panel.style.display === 'none') {
                panel.style.display = '';
            } else {
                panel.style.display = 'none';
            }
        });
    } else {
        console.error('Element with class "group-2" not found.');
    }
})();

