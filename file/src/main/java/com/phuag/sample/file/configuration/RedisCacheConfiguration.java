package com.phuag.sample.file.configuration;

import com.phuag.sample.common.util.JedisClusterUtil;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author phuag
 */
@Configuration
@EnableCaching
@Slf4j
public class RedisCacheConfiguration extends CachingConfigurerSupport {

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.port}")
    private int port;

    @Value("${spring.redis.timeout}")
    private int timeout;

    @Value("${spring.redis.pool.max.idle}")
    private int maxIdle;

    @Value("${spring.redis.pool.max.wait}")
    private long maxWaitMillis;

    @Value("${spring.redis.password}")
    private String password;

    @Value("${spring.redis.cluster.nodes}")
    private String nodes;


    public JedisPool getRedisPoolFactory() {
        log.info("JedisPool注入成功！！");
        log.info("redis地址：" + host + ":" + port);
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxIdle(maxIdle);
        jedisPoolConfig.setMaxWaitMillis(maxWaitMillis);
        JedisPool jedisPool = new JedisPool(jedisPoolConfig, host, port, timeout, password);
        return jedisPool;
    }

    @Bean
    public JedisClusterUtil getJedisClusterUtil() {
        log.info("开始初始化JedisCluster,nodes:{},password:{}！！", nodes, password);
        JedisClusterUtil jedisClusterUtil = new JedisClusterUtil(nodes, password);
        log.info("初始化JedisCluster成功");
        return jedisClusterUtil;
    }


}
