DC  = sudo docker-compose
# make [ターゲット名]
# ターゲット:依存するファイル
# 		コマンド

# make build
build:
	@$(DC) build

# make bash
bash:
	@$(DC) run --rm app bash

#=============================
# HTML/PDF/EPUB3
#=============================
clean:
	sudo rm -rf dist

html:
	@$(DC) run --rm app asciidoctor -D dist src/main.adoc
	sudo chown vagrant:vagrant . -R

epub:
	@$(DC) run --rm app asciidoctor-epub3 -D dist src/main.adoc
	sudo chown vagrant:vagrant . -R

pdf:
	@$(DC) run --rm app asciidoctor-pdf -o dist/main_`date '+%s'`.pdf src/main.adoc
	sudo chown vagrant:vagrant . -R


