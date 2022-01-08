all: clean build

clean:
	rm -rf dist/*

build:
	python -m build

upload:
	python -m twine upload dist/*

test-upload:
	python -m twine upload --repository testpypi dist/*
