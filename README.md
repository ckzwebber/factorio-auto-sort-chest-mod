# 🧰 Factorio Auto Sort Chest Mod

[![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)](https://www.lua.org/)
[![Factorio](https://img.shields.io/badge/Game-Factorio-FAB71C?style=for-the-badge&logo=factorio&logoColor=white)](https://factorio.com/)
[![Modding API](https://img.shields.io/badge/API-Factorio_Modding-blue?style=for-the-badge)](https://wiki.factorio.com/Modding)

Bem-vindo ao repositório **factorio-auto-sort-chest-mod**!  
Este mod adiciona um **botão “Auto-sort”** sempre que você abre um baú (ou container com inventário), permitindo **organizar automaticamente** o conteúdo por tipo de item.

---

## ✨ Funcionalidades

- ✅ Adiciona um botão **“Auto-sort”** na interface ao abrir um baú.
- ✅ Reorganiza automaticamente os itens do inventário em **ordem alfabética**.
- ✅ Compatível com baús vanilla e containers equivalentes.
- ✅ Não altera a jogabilidade — apenas organiza o conteúdo visualmente.
- ✅ Código limpo e seguindo o padrão oficial de modding do Factorio.

---

## 🧩 Como Funciona

O mod usa eventos da API de runtime do Factorio para detectar quando o jogador abre uma interface de container:

1. **Detecta evento** `on_gui_opened` → verifica se a entidade aberta tem inventário.
2. **Cria botão GUI** (“Auto-sort”) dinamicamente em `player.gui.top`.
3. **Ao clicar**, o script:
   - Coleta todos os itens do inventário.
   - Esvazia o baú.
   - Reinsere os itens, agrupados e ordenados por nome.
4. **Ao fechar o baú**, o botão é removido automaticamente.

---

## 🛠️ Tecnologias e Conceitos

- **Linguagem:** [Lua 5.2+](https://www.lua.org/)
- **API:** [Factorio Modding API](https://lua-api.factorio.com/latest/)
- **Eventos:** `on_gui_opened`, `on_gui_closed`, `on_gui_click`
- **Classes usadas:** `LuaPlayer`, `LuaEntity`, `LuaInventory`
- **Boas práticas:** código modular, uso de `pcall` e verificações `valid`.

---

## 📁 Estrutura do Mod

```
factorio-auto-sort-chest-mod/
│
├── info.json        # Metadados do mod (nome, versão, descrição, dependências)
├── control.lua      # Script principal (lógica do mod)
└── locale/
    └── en/
        └── locale.cfg   # (Opcional) Localização e strings
```

---

## ⚙️ Instalação

### Método 1 – Manual

1. Localize sua pasta de mods do Factorio:
   - **Windows:** `%APPDATA%/Factorio/mods`
   - **Linux:** `~/.factorio/mods`
   - **Mac:** `~/Library/Application Support/factorio/mods`
2. Crie uma nova pasta:
   ```
   factorio-auto-sort-chest-mod/
   ```
3. Coloque dentro dela os arquivos:
   - `info.json`
   - `control.lua`
4. (Opcional) Compacte a pasta como `.zip` se quiser distribuir o mod.
5. Inicie o jogo e **ative o mod** na tela inicial do Factorio.

---

## 🚀 Como Usar

1. Abra qualquer baú (ou container compatível).
2. Um botão **“Auto-sort”** aparecerá na parte superior da tela.
3. Clique nele para **organizar o inventário automaticamente**.
4. Feche o baú — o botão desaparecerá.

> 💡 Dica: o script apenas reorganiza os itens. Nenhum item é perdido, alterado ou duplicado.

---

## 💡 Exemplos de Expansão (para futuros updates)

- 🔸 Suporte a vagões de carga e baús logísticos.
- 🔸 Ordenação por categoria (`item.subgroup` ou `item.group`).
- 🔸 Painel de preferências do jogador.
- 🔸 Integração com outros mods de logística.

---

## 🧪 Teste Rápido

- Crie um mapa sandbox.
- Dê a si mesmo alguns itens diferentes e um baú.
- Misture os itens e clique em **Auto-sort**.
- Veja a mágica acontecer ✨

---

## 👤 Autor

Desenvolvido por [Carlos Miguel Webber](https://www.linkedin.com/in/cmiguelwm/).  
Ideia, código e documentação por amor ao caos organizado dos baús de Factorio 💼🪣

---

## 📜 Licença

Licença Poética 🪶

> Você pode remixar, modificar, distribuir e aprender com este código,  
> contanto que mantenha a alma de organização e compartilhe o crédito.
>
> “O universo é caótico — nossos baús não precisam ser.”

---

## 🧷 Referências

- [Tutorial Oficial de Modding – Factorio Wiki](https://wiki.factorio.com/Tutorial:Modding_tutorial/Gangsir)
- [Factorio Lua API Reference](https://lua-api.factorio.com/latest/)
- [Docs de Eventos (`on_gui_opened`, `on_gui_click`)](https://lua-api.factorio.com/latest/events.html)
