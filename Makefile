LINE_LENGTH := 120
SRC := src/
TEST := test/

# Install dependencies
init:
	pip install -r requirements.txt

# Check python type hints
typehint:
	mypy --config-file mypy.ini --disallow-untyped-defs $(SRC) $(TEST)

# Check the order of imports
isort:
	isort -p test --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=$(LINE_LENGTH) --check-only --recursive $(SRC) $(TEST)

# Sort the imports
isort-fix:
	isort -p test --multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=$(LINE_LENGTH) --recursive $(SRC) $(TEST)

# Check if the code is standard
lint: isort
	pylint --rcfile=pylintrc $(SRC) $(TEST)

# Test package post checks
test: typehint lint
	coverage run -m unittest discover
	coverage report -m --include=$(SRC)*

# Format the code following Python Software Fundation style
format-fix:
	black --target-version py36 --line-length $(LINE_LENGTH) $(SRC) $(TEST)
	docformatter --in-place --blank --wrap-descriptions $(LINE_LENGTH) --wrap-summaries $(LINE_LENGTH) -r $(SRC)*.py

# Generate sphinx automated documentation
doc:
	sphinx-build -b html source/ build/

# Generate UML diagrams
reverse-uml:
	pyreverse $(SRC) -o png -p src
	mkdir -p reverse_doc/
	mv *.png reverse_doc/
