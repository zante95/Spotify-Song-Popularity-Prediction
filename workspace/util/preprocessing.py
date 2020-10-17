from collections import namedtuple
from difflib import SequenceMatcher


Change = namedtuple('Change', ['before', 'after'])


class ColumnRenamer:
    
    def __init__(self):
        pass
        
    def _compute_best_match(self, columns, old_name):
    
        best_match = None
        best_match_ratio = 0
        
        for colname in columns:
            ratio = SequenceMatcher(None, colname.lower(), old_name.lower()).ratio()
            if ratio >= 0.6 and ratio > best_match_ratio:
                best_match = colname
                best_match_ratio = ratio
                
        return best_match
    
    def normalize(self, columns, df):
        """
        Normalizes the column names of the given df and assigns appropriate names based
        on similarity rates when compared against the given columns. Returns a new dataframe
        with the new column names.
        """
        
        column_names = list(df.columns)
        changed = list()
        not_changed = list()
        
        for idx, colname in enumerate(column_names):
            
            best_match = self._compute_best_match(columns, colname)

            if best_match is not None:
                column_names[idx] = best_match
                changed.append(Change(colname, best_match))
                
            else:
                not_changed.append(Change(colname, None))
                
        df.columns = column_names
        return df, changed, not_changed     
    
    def map(self, columns_map, df):
        """
        Maps the column names of the given df using the column_map as a guide, where the key of the
        map is the old column name, and the value of the map is the new column name. Returns a new
        dataframe with the new column names.
        """
        
        column_names = list(df.columns)
        changed = list()
        not_changed = list()
        
        map_keys = columns_map.keys()
        
        for idx, colname in enumerate(column_names):
            
            best_match = self._compute_best_match(map_keys, colname)
            
            if best_match is not None:
                best_match_value = columns_map[best_match]
                column_names[idx] = best_match_value
                changed.append(Change(colname, best_match_value))
                
            else:
                not_changed.append(Change(colname, None))
                
        df.columns = column_names
        return df, changed, not_changed