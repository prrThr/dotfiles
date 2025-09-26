// ==UserScript==
// @name        claude.ai fix width
// @namespace   Violentmonkey Scripts
// @icon        https://www.google.com/s2/favicons?domain=claude.ai
// @match       https://claude.ai/*
// @grant       none
// @version     2.0
// @author      Meteco
// @description Expande o chat do Claude.ai para 90% da largura da tela
// @run-at      document-ready
// ==/UserScript==

(function() {
    'use strict';

    // Função para aplicar os estilos
    function expandChat() {
        // Cria ou atualiza o CSS customizado
        let style = document.getElementById('claude-expander-style');
        if (!style) {
            style = document.createElement('style');
            style.id = 'claude-expander-style';
            document.head.appendChild(style);
        }

        style.textContent = `
            /* Expande o container principal */
            .mx-auto.max-w-4xl,
            .mx-auto.max-w-3xl,
            .mx-auto.max-w-2xl,
            div[class*="max-w-"] {
                max-width: 90% !important;
            }

            /* Ajusta especificamente containers do chat */
            [data-testid="conversation"] > div,
            main > div > div,
            .prose {
                max-width: 90% !important;
                width: 90% !important;
            }

            /* Garante que o sidebar não interfira */
            main {
                margin-left: 0 !important;
                padding-left: 0 !important;
            }

            /* Ajusta o container de mensagens */
            .flex.flex-col.gap-4,
            .flex.flex-col.space-y-4 {
                max-width: 90% !important;
                width: 90% !important;
                margin: 0 auto !important;
            }

            /* Expande área de input */
            .sticky.bottom-0 > div {
                max-width: 90% !important;
                width: 90% !important;
                margin: 0 auto !important;
            }

            /* Remove limitações de largura em elementos de texto */
            .whitespace-pre-wrap,
            .break-words {
                max-width: none !important;
            }

            /* Ajusta responsividade */
            @media (max-width: 768px) {
                .mx-auto.max-w-4xl,
                .mx-auto.max-w-3xl,
                .mx-auto.max-w-2xl,
                div[class*="max-w-"] {
                    max-width: 95% !important;
                }
            }
        `;
    }

    // Aplica imediatamente
    expandChat();

    // Observer para detectar mudanças na página (navegação SPA)
    const observer = new MutationObserver(function(mutations) {
        let shouldReapply = false;

        mutations.forEach(function(mutation) {
            if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
                // Verifica se novos elementos foram adicionados que podem precisar dos estilos
                mutation.addedNodes.forEach(function(node) {
                    if (node.nodeType === Node.ELEMENT_NODE) {
                        if (node.querySelector && (
                            node.querySelector('[data-testid="conversation"]') ||
                            node.querySelector('main') ||
                            node.classList.contains('max-w-')
                        )) {
                            shouldReapply = true;
                        }
                    }
                });
            }
        });

        if (shouldReapply) {
            setTimeout(expandChat, 100); // Pequeno delay para garantir que os elementos foram renderizados
        }
    });

    // Monitora mudanças no DOM
    observer.observe(document.body, {
        childList: true,
        subtree: true
    });

    // Re-aplica após navegação (para SPAs)
    window.addEventListener('popstate', function() {
        setTimeout(expandChat, 500);
    });

    // Re-aplica periodicamente como backup
    setInterval(expandChat, 5000);

    console.log('Claude.ai Chat Expander ativo - Chat expandido para 90% da tela');
})();
