# kitty-cat lib

Para buildar a lib:
`python -m build`

Copiar para myPyPI:
`cp ~/Documents/palestra-python/packaging_kittycat/v1.1/dist/kitty_cat-1.1.tar.gz ~/Documents/palestra-python/mypypi/`

Rodar o myPyPI:
`pypi-server run -p 8080 ~/Documents/palestra-python/mypypi/`

# Motivação (pip)

cd projeto1
pip install kitty-cat
python pets1.py

=== out of screen

copiar a versão 1.1 para o mypypi
restartar o server

=== out of screen

cd novo_projeto
pip install kitty-cat #(should install 1.1)
python pets2.py

===

cd projeto1
python -m venv .venv
source .venv/bin/activate
pip list
pip install kitty-cat==1.0
python pets1.py
deactivate

cd ../projeto2
python -m venv .venv
source .venv/bin/activate
pip list
pip install kitty-cat
python pets2.py
deactivate

=== uv ===

export UV_INDEX=mypypi=http://localhost:8080/simple
uv run --with kitty_cat pets1.py

# building
[build-system]
requires = ["uv_build>=0.8.3,<0.9.0"]
build-backend = "uv_build"

[project.scripts]
newapp = "main:main"

[[tool.uv.index]]
name = "testpypi"
url = "https://test.pypi.org/simple/"
publish-url = "https://test.pypi.org/legacy/"
explicit = true


# Benchmarks
https://github.com/astral-sh/uv/blob/main/BENCHMARKS.md