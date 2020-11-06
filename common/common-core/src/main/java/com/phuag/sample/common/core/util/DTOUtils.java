package com.phuag.sample.common.core.util;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;

import java.util.ArrayList;
import java.util.List;

/**
 * @author phuag
 */
public class DTOUtils {

    private static final ModelMapper INSTANCE = new ModelMapper();
    // 对象映射设置为严格模式
    static {
        INSTANCE.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
    }

    public static <S, T> T map(S source, Class<T> targetClass) {
        return INSTANCE.map(source, targetClass);
    }

    public static <S, T> void mapTo(S source, T dist) {
        INSTANCE.map(source, dist);
    }

    public static <S, T> List<T> mapList(List<S> source, Class<T> targetClass) {
        List<T> list = new ArrayList<T>();
        for (int i = 0; i < source.size(); i++) {
            T target = INSTANCE.map(source.get(i), targetClass);
            list.add(target);
        }

        return list;
    }

    public static <S, T> Page<T> mapPage(Page<S> source, Class<T> targetClass) {
        Page<T> page = new Page<T>(source.getCurrent(), source.getSize(), source.getTotal());
        List<S> list = source.getRecords();
        for (int i = 0; i < list.size(); i++) {
            T target = INSTANCE.map(list.get(i), targetClass);
            page.getRecords().add(target);
        }
        return page;
    }
}
