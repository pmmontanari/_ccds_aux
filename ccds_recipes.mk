## Initialize project
.PHONY: initialize
initialize:
# create git repo
	git init
	git add .
	git commit -m "CCDS defaults"
# create .venv
	create_environment
# remove unused folders
	rm -rf ./models ./notebooks
# install dependencies
	requirements

## Install Python dependencies
.PHONY: requirements
requirements:
	uv pip install -r requirements.txt
	uv lock
	uv sync
	uv pip freeze > requirements.txt