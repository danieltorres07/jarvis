---
name: project_harmoclinic_apresentacao
description: Apresentacao institucional da Harmo Clinic pra TV da recepcao (projeto em andamento)
metadata: 
  node_type: memory
  type: project
  originSessionId: c2d5190d-06e5-4306-826e-9a872fc3dc95
---

**Harmo Clinic** = a clinica fisica do Daniel + Dra. Linda Italia (`@harmoclinic_`). Daniel e cofundador (experiencia do paciente), Dra. Linda Italia e fundadora (harmonizacao facial), Dra. Livia Dias (implanto/endo/clinica geral), Victoria (recepcao). Endereco: Av. Londres, 47 - LJ03 - Eldorado - Contagem. WhatsApp (31) 99185-8801. Instagram da Linda: `@dralindaitala`. Credenciais citaveis: 7 anos de clinica, especializacao + certificacao internacional em Miami, AMWC Monaco 2x (maior congresso de estetica do mundo), referencia reconhecida na camara da cidade, +6 mil pacientes atendidos.

Projeto **apresentacao de recepcao** (TV em loop, 16:9): pasta `~/harmo clinic/apresentacao-recepcao/`. Recriei o PDF `APRESENTAÇÃO HARMOCLINIC.pdf` em HTML + export PNG/MP4. Abordagem 100% fiel: slides inalterados usam a propria pagina do PDF renderizada em alta (PyMuPDF/fitz, instalado via pip --user); slides alterados/novos em HTML com fotos recortadas do PDF. Fontes da marca: **Vandermark** (titulos) + **Kumbh Sans** (corpo), em `~/Linda Italia/fonts/`. Paleta marrom da Linda, fundo `#F8F8F5`. Scripts: generate.py, export_png.py, build_mp4.py. Entregaveis: MP4 em loop + PNGs 16 slides.

Decisao de export: TV de 55 polegadas, exportar final em **4K (3840x2160)** (fontes sao alta-res/vetor, sem perda). Hoje esta 1080p.

EXIGENCIA: nenhuma imagem (logo, fotos, antes/depois) pode perder qualidade. Daniel vai mandar os ORIGINAIS em alta (provavelmente numa pasta) -> usar os originais no lugar dos extraidos do PDF, e exportar em 4K. As fotos hoje vem do PDF (ja comprimidas pelo Canva); originais sao melhores, sobretudo nos antes/depois.

Pendencias e decisoes em `~/harmo clinic/apresentacao-recepcao/PENDENTES.txt`. Relacionado: [[project_negocios]], [[feedback_linda_consulta]].
