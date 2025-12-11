from loguru import logger
from tqdm import tqdm

## ---- Import paths as needed ----
# from project_name.config import (
#     DATA_DIR,
#     FIGURES_DIR,
#     INTERIM_DATA_DIR,
#     PROCESSED_DATA_DIR,
#     RAW_DATA_DIR,
#     EXTERNAL_DATA_DIR,
#     REPORTS_DIR,
#     FIGURES_DIR
# )


def main():
    # ---- REPLACE THIS WITH YOUR OWN CODE ----
    logger.info("Generating features from dataset...")
    for i in tqdm(range(10), total=10):
        if i == 5:
            logger.info("Something happened for iteration 5.")
    logger.success("Features generation complete.")
    # -----------------------------------------


if __name__ == "__main__":
    main()
