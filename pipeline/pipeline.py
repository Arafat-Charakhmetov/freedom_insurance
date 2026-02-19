import polars as pl
from pipeline.config import FILEPATH, SCHEMA_OVERRIDES, DROP_COLUMNS

class Pipeline:
    def __init__(self, train_fraction = 0.8, seed = 42):
        self._train_fraction = train_fraction
        self._seed = seed
        self._train_df = None
        self._test_df = None

    def preprocess(self):
        # Scan csv file into lazy dataframe 
        self.lazy_df = pl.scan_csv(FILEPATH, schema_overrides = SCHEMA_OVERRIDES)
        
        # Drop columns
        self.lazy_df.drop(DROP_COLUMNS)

    def _load(self):
        if self._train_df is None:
            self.proprocess()
            df = self.lazy_df.collect()
            self._train_df = df.sample(fraction = self._train_fraction, seed = self._seed)
            self._test_df = df.join(self._train_df, how = "anti", on = df.columns)

    @property
    def train(self):
        self._load()
        return self._train_df

    @property
    def test(self):
        self._load()
        return self._test_df
