package utils;

import models.Crops;

import java.util.Collections;
import java.util.List;

public class Pagination {

//    public static void main(String[] args) {
//
//    }

    public static List<Crops> getPage(List<Crops> sourceList, int page, int pageSize) {
        if (pageSize <= 0 || page <= 0) {
            throw new IllegalArgumentException("invalid page size: " + pageSize);
        }
        int fromIndex = (page - 1) * pageSize;
        if (sourceList == null || sourceList.size() <= fromIndex) {
            return Collections.emptyList();
        }
        // toIndex exclusive
        return sourceList.subList(fromIndex, Math.min(fromIndex + pageSize, sourceList.size()));
    }

}

/*
1, Home Garden, 1, Carrot
1, Home Garden, 2, Leaks
 */
