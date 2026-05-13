# Factorio Auto Sort Chest

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![Factorio](https://img.shields.io/badge/Factorio-FAB71C?style=for-the-badge&logo=factorio&logoColor=white)](https://factorio.com/)

Mod para Factorio que adiciona um botão "Auto-sort" ao abrir qualquer baú, reorganizando o inventário em ordem alfabética por tipo de item.

## Como funciona

O mod registra listeners nos eventos de GUI do Factorio (`on_gui_opened`, `on_gui_closed`, `on_gui_click`). Quando o jogador abre um container com inventário, o mod cria dinamicamente um botão na interface. Ao clicar, o script coleta todos os itens, esvazia o inventário e reinsere em ordem alfabética. Ao fechar o container, o botão é removido automaticamente.

Todo o ciclo de vida (criação, ação, limpeza) acontece em `control.lua` usando a API de runtime do Factorio.

## Estrutura

```
├── info.json       # Metadados do mod (nome, versão, dependências)
└── control.lua     # Lógica principal (eventos, sorting, GUI)
```

## Instalação

Copiar a pasta do mod para o diretório de mods do Factorio:

- Windows: `%APPDATA%/Factorio/mods/`
- Linux: `~/.factorio/mods/`
- macOS: `~/Library/Application Support/factorio/mods/`

Ativar o mod na tela inicial do jogo.

## Referências

- [Factorio Modding API](https://lua-api.factorio.com/latest/)
- [Tutorial de Modding (Factorio Wiki)](https://wiki.factorio.com/Tutorial:Modding_tutorial/Gangsir)

## Licença

MIT
