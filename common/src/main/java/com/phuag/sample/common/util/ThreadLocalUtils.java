package com.phuag.sample.common.util;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Supplier;

/**
 *
 * @author phuag
 * @date 2017/12/6
 */
public class ThreadLocalUtils {
    public static final String USERID_KEY = "user_id";
    private static final ThreadLocal<Map<String, Object>> LOCAL = ThreadLocal.withInitial(HashMap::new);

    /**
     *
     * @return threadLocal中的全部值
     */
    public static Map<String, Object> getAll() {
        return LOCAL.get();
    }


    public static <T> T get(String key) {
        return (T) LOCAL.get().get(key);
    }

    public static <T> T get(String key, Supplier<T> supplierOnNull) {
        return (T) LOCAL.get().computeIfAbsent(key, k -> supplierOnNull.get());
    }

    /**
     * 设置一个值到ThreadLocal
     * @param key 键
     * @param value 值
     * @param <T> 值的类型
     * @return 被放入的值
     */
    public static <T> T put(String key, T value) {
        LOCAL.get().put(key, value);
        return value;
    }

    public static void remove(String key) {
        LOCAL.get().remove(key);
    }

    public static void clear() {
        LOCAL.remove();
    }

    public static <T> T getAndRemove(String key) {
        try {
            return get(key);
        } finally {
            remove(key);
        }
    }
}
