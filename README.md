# _ccds_aux
Tweaks on the Cookiecutter Data Science v2.0 template

> [!NOTE]
> I intend to fork the CCDS in the future to apply these changes. 
>
> For now I manually copy and paste these scripts and run my custom Make recipes.

## Philosophy
CCDS is great, but I wanted to tweak it to my workflow. 

I noticed I was always setting up the project in the same way and applying the
same modifications.

As the original CCDS, this version is very opinionated so if you don't like it,
stick to the original. It does a great job in covering the essentials.

The changes are explained below, here I will try to give my motivation to them.
* I wanted to combine **uv** as *environment_manager* and **requirements.txt**
  as *dependency_file* because I think it does not lock neither me neither
  anyone that is working with me
* Conversely, although I use **ruff** for linting and formatting, I did not want to lock out people that
  use **black**, so this option has no defaults.
* The license also has no defaults because I evaluate it in a case-per-case basis.
* I don't do data science, I just do data analysis. I don't need `./models`
* [I don't use notebooks](https://docs.google.com/presentation/d/1n2RlMdmv1p25Xy5thJUhkKGvjtV-dkAIsUXP-AL4ffI/preview#slide=id.g362da58057_0_1). I tried, but they don't fit in my workflow. This
  template is centered around pure Python scripts.
* For my workflow `./data/interim` adds an unnecessary step into the data
  pipeline. If it's processed in any way I put it in `./data/processed`
* I don't want to keep my `./references` in git because normally they are
  documents (PDFs, Power Point presentations, etc.)
* The projet module was a bit cluttered for me. I maintained only the
  `config.py` file to get access to global variables and paths. I also added a
  `_boilerplate.py` file to be the template for any other file
* I like loguru, but I don't use typer, so I removed it
* After having problems using the `Makefile` in Windows, I configured the Makefile
  to always run on bash
* The `_initialize_project.sh` perform actions that are reccomended as first steps
  in ["Using the
  template"](https://cookiecutter-data-science.drivendata.org/using-the-template/):
  1. Set up version control
  2. Create a Python virtual environment
  3. Install the dependencies


## Changes
### Default options
* **none** as *data_storage*
* **uv** as *environment_manager*
* **requirements.txt** as *dependency_file*
* **none** as *pydata_packages*
* **pytest** as *testing_framework*
* **mkddocs** as *docs*
* **none** as *include_code_scaffold*

### Folder structure
* No `./models` and `./notebooks` folder
* No `./data/interim` folder
* `./references/.gitkeep` changed to .gitignore
* Added _initialize_project.sh that does the following
    * create git repository and commit defaults
    * make and activate a virtual environment
    * install dependencies from requirements.txt

### Project module
* Maintain only `config` and `__init__.py` from code scaffold (no `dataset`,
  `features`, and `plots`)
* Include `_boilerplate.py`
* No typer

### Makefile
* Added configuration
* Added recipes to update .lock from requirements and to update requirements from lock

## TO DO
* [x] Delete notebooks folder
* [x] Adapt Makefile to sue uv
* [ ] Implement updating on the directory tree, see
  [tutorial](https://realpython.com/directory-tree-generator-python/)
* [ ] Fork CCDS and apply these changes
