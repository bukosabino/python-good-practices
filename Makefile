# Install dependencies
init:
	pip install -r requirements.txt

# Check python type hints
typehint:
	mypy --config-file mypy.ini --disallow-untyped-defs src/ test/

# Check if the code is standard
lint:
	pylint --rcfile=pylintrc src/ test/

# Check the order of imports
isort:
	isort --check-only --recursive src/ test/

# Sort the imports
isort-fix:
	isort --recursive src/ test/

# Test package post checks
test: typehint lint isort
	# python -m unittest discover
	coverage run test/__init__.py
	coverage report -m

# Formate code following Python Software Fundation style
format:
	black --target-version py36 --line-length 120 src/ test/

# Generate UML diagrams
reverse-uml:
	pyreverse src/ -o png -p src
	mkdir -p reverse_doc/
	mv *.png reverse_doc/
