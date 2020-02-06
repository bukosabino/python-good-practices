# Swiss army knife for Python good practices code style

This show how to configure any python project to follow good practices code style.

Some features:

* mypy
* pylint
* black
* coverage


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

### Format the python code following Python Software Foundation style
```bash
make format
```

### Generate UML diagrams
```bash
make reverse-uml
```
