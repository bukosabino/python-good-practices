# Swiss army knife for Python good practices code style

This show how to configure any python project to follow good practices code style.

Some features:

* mypy
* pylint
* black
* coverage
* isort
* sphinx


### Install dependencies
```bash
make init
```

### Check python type hints
```bash
make typehint
```

### Check if the code is standard
```bash
make lint
```

### Check the order of imports
```bash
make isort
```

### Sort the imports
```bash
make isort-fix
```

### Test package post checks
```bash
make test
```

### Generate Sphinx automated documentation
```bash
make doc
```

### Format the python code following Python Software Foundation style
```bash
make format-fix
```

### Generate UML diagrams
```bash
make reverse-uml
```
