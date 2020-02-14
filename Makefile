# Install dependencies
init:
	pip install -r requirements.txt

# Check python type hints
typehint:
	mypy --config-file mypy.ini --disallow-untyped-defs src/ test/

# Check the order of imports
isort:
	isort --check-only --recursive src/ test/

# Sort the imports
isort-fix:
	isort --recursive src/ test/

# Check if the code is standard
lint: isort
	pylint --rcfile=pylintrc src/ test/

# Test package post checks
test: typehint lint
	coverage run -m unittest discover
	coverage report -m --include=src/*

# Format the code following Python Software Fundation style
format-fix:
	black --target-version py36 --line-length 80 src/ test/

# Generate sphinx automated documentation
doc:
	sphinx-build -b html source/ build/

# Generate UML diagrams
reverse-uml:
	pyreverse src/ -o png -p src
	mkdir -p reverse_doc/
	mv *.png reverse_doc/
