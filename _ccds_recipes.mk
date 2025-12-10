#################################################################################
# USER RECIPES                                                                  #
#################################################################################
## Source: Rasmus Bååth, "A Makefile recipe for Python data pipelines" 2023-06-10
# Some reasonable makefile settings
# Always use the bash shell instead of the default shell which might be zsh, fish, etc.
SHELL := bash
# Flags to put bash into "strict" mode
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
# We're not compiling C++, so no need for the many built-in rules 
MAKEFLAGS += --no-builtin-rules


## Remove "models" and "notebooks" folder
.PHONY: remove_models_and_notebooks
remove_models_and_notebooks:
# does not work on windows!
	rm -rf ./models ./notebooks 


## Create "main.py"
.PHONY: create_main
create_main:
	touch main.py


## Add dependencies from "requirements.txt" to lock file
.PHONY: update_lock_from_requirements
update_lock_from_requirements:
	uv add --dev -r requirements.txt

# ## Update "requirements.txt" from lock
.PHONY: update_requirements_from_lock
update_requirements_from_lock:
	uv export --no-hashes --no-header --no-annotate --format requirements-txt > requirements.txt

## Update "requirements.txt" and lock
.PHONY: update_project_dependencies
update_project_dependencies:
	update_lock_from_requirements
	update_requirements_from_lock
	
## Suggested to run when updating dependencies
# make update_lock_from_requirements
# make update_requirements_from_lock