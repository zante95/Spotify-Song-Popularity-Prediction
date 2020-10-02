**Deadline**: October 16, 2020

For week 06 we are gonna be deciding what features are not important for the
selected dataset.

### Everyone

- Get familiar with each of the datasets (info, data types, columns, etc).

- Do some exploratory analysis on your own.

- Read Carlos paper:
  https://github.com/cflores713/predictingBreastCancer/blob/master/FinalAnalysis.pdf

### Planning

- (Carlos) Try to create and outline of the whole process we are gonna follow for
  the team to read.

### Pre-processing

- (Daniel) Write script for downloading datasets.

- (Johannes) Normalize column names for each dataset.
  Input: Dataframe with bad column names.
  Output: Dataframe with normalized column names.
  Assumptions: Dataframes are new.

- (Martin) Intersect column names that are present in all dataframes.
  Input: Two or more dataframes.
  Output: Two or more dataframes with clipped columns.
  Assumptions: dataframes already have good column names.

### Data reduction

- Combine features that are reduntant (dim reduction).

- List features that arent' gonna be required for clustering.

### Data transform

- Create column for popularity weight.

