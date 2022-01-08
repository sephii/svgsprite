all:
	python -m build

upload:
	python -m twine upload dist/*

test-upload:
	python -m twine upload --repository testpypi dist/*
