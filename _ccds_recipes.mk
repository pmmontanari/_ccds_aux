### 
# Copy and paste inside the ccds Makefile
###

## Create git repository
.PHONY: create_git_repo
create_git_repo:
# create git repo
	git init
	git add .
	git commit -m "CCDS defaults"


## Remove "models" and "notebooks" folder
.PHONY: remove_models_and_notebooks
remove_models_and_notebooks:
# remove unused folders
	rm -rf ./models ./notebooks


## Create "main.py"
.PHONY: create_main
create_main:
	touch main.py


## Add dependencies from "requirements.txt" to lock file
.PHONY: add_dependencies
add_dependencies:
	uv add -r requirements.txt


## Update "requirements.txt" from lock:
.PHONY: update_requirements_from_lock
update_requirements_from_lock:
	uv export --no-hashes --format requirements-txt > requirements.txt