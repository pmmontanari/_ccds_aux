git init
git add .
git commit -m "CCDS defaults"
make create_environment
.venv/Scripts/activate
make requirements
make remove_models_and_notebooks
make remove_interim_data
make mv_references_gitkeep_gitignore