---
name: reference_layout_apresentacao
description: "Stack visual canonica pra qualquer apresentacao institucional 16:9 do Daniel/Linda (call, conteudo programatico, deck de produto, recepcao). Reusar generate.py + fontes + helpers da pasta apresentacao-recepcao."
metadata: 
  node_type: memory
  type: reference
  originSessionId: c2d5190d-06e5-4306-826e-9a872fc3dc95
---

**Pasta de referencia (canonica):** `~/harmo clinic/apresentacao-recepcao/`

Toda apresentacao institucional 16:9 (call X1, conteudo programatico, deck de produto, apresentacao de recepcao, proposta) reusa essa stack. NAO recriar do zero, COPIAR o esqueleto e trocar so o conteudo.

**O que reusar:**
- **Fontes da marca:** Vandermark (titulos) + Kumbh Sans (corpo), em `~/Linda Italia/fonts/`, ja linkadas em `assets/fonts/` via @font-face local. Sem rede.
- **Paleta marrom da Linda:** `#B07F49` (gold) `#CEAE8F` (light) `#5E381E` (brown-deep) `#835230` (brown-mid) `#D8DACE`, fundo cream `#F8F8F5`. Vale pra deck do Daniel e da Linda (a marca compartilha paleta).
- **Resolucao:** slide CSS 1920x1080, export Playwright `device_scale_factor=2` -> PNG 4K (3840x2160). MP4 4K via `imageio-ffmpeg` (sem ffmpeg do sistema).
- **Helpers prontos em `generate.py`:**
  - `cover()` - capa com logo empilhado em alta + brilhos top-left + @handle bottom-right
  - `pdf_overlay(n, content, mask)` - usa pagina N de um PDF de referencia como fundo + retangulo cream cobrindo a area de texto + texto novo por cima (preserva foto/arco/decoracao do PDF). Util pra remontar slides existentes com fonte maior.
  - `team(n, name, role, body, name_size)` - slide de pessoa (arco do PDF + texto novo a esquerda)
  - Padrao `cards/quadros`: classe `.seal` (selos com icone+titulo+desc) e `.proc` (procedimentos grid)
  - Padrao `stats`: classe `.stat` (numero grande Vandermark + label Kumbh)
  - `hero_result(img)` (um antes/depois grande) e `gallery_results(imgs)` (grade 3x2, 6 por pagina)
  - `cta()` com QR codes (gerados com `segno`, dark `#23170E`)
- **Scripts:**
  - `generate.py` -> `apresentacao.html`
  - `export_png.py` (Playwright) -> `slides/slide_NN.png` 4K
  - `build_mp4.py` (imageio-ffmpeg) -> `apresentacao-*.mp4` com xfade 0.6s, 6s por slide

**Pra montar deck novo:**
1. Copiar o esqueleto `generate.py` + `assets/fonts/` + `export_png.py` + `build_mp4.py` pra pasta nova.
2. Atualizar `SLIDES` com o conteudo do novo deck (capa + slides + CTA).
3. Trocar logo se for outra marca (Linda logo em `~/Linda Italia/logo.png`; Harmo em `~/harmo clinic/logo/LOGO VERSAO ORIGINAL.pdf`).
4. NAO inventar conteudo do produto/oferta: perguntar ao Daniel input por input (nome, publico, promessa, modulos, preco, CTA).

**Onde colocar deck novo:**
- Da Linda (mentoria, conteudo programatico, call): `~/Linda Italia/mentoria/{tipo}/`
- Do Daniel (Aceleracao 4D, Secretaria que Converte, call): `~/Daniel Torres/decks/{tipo}/`

Relacionado: [[project_harmoclinic_apresentacao]], [[feedback_pdf_linda_laureo]].
