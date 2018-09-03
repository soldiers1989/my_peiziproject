package com.business.help;

import java.util.Map;
import java.util.ResourceBundle;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * redis管理类
 */
@Service
@SuppressWarnings({ "unchecked", "rawtypes" })
public class RedisManager {

    private final Logger logger = Logger.getLogger(this.getClass().toString());

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    private int timeToLive = 24 * 7 * 60 * 60;

    /**
     * 缓存开关是否打开
     * 
     * @return
     */
    public boolean isOnline() {
	try {
	    ResourceBundle resourceBundle = ResourceBundle.getBundle("init");
	    String config = resourceBundle.getString("redis.offflag");
	    if ("open".equals(config)) {
		return true;
	    }
	} catch (Exception e) {
	    logger.error(e.getMessage(), e);
	}
	return false;
    }

    public void set(String key, final Object value, final int expireTime) {
	if (this.isOnline()) {
	    if (value instanceof Map) {
		redisTemplate.opsForHash().putAll(key, (Map) value);
		redisTemplate.expire(key, expireTime, TimeUnit.SECONDS);
	    } else {
		final byte[] rawKey = rawKey(key);
		redisTemplate.execute(new RedisCallback<Object>() {
		    @Override
		    public Object doInRedis(RedisConnection connection) throws DataAccessException {
			connection.openPipeline();
			// connection.set(rawKey, objSer.serialize(value));
			connection.set(rawKey, value.toString().getBytes());
			connection.expire(rawKey, expireTime);
			return connection.closePipeline();
		    }
		});
	    }
	}
    }

    public void set(String key, Object value) {
	if (this.isOnline()) {
	    set(key, value, timeToLive);
	}
    }

    public Object get(String key) {
	if (this.isOnline()) {
	    final byte[] rawKey = rawKey(key);
	    return redisTemplate.execute(new RedisCallback<Object>() {
		@Override
		public Object doInRedis(RedisConnection connection) throws DataAccessException {
		    byte[] value = connection.get(rawKey);
		    return value == null ? null : new String(value);
		}
	    });
	} else {
	    return null;
	}
    }

    public void delete(String key) {
	redisTemplate.delete(key);
    }

    public void flushAll() {
	redisTemplate.execute(new RedisCallback<Object>() {
	    @Override
	    public Object doInRedis(RedisConnection connection) throws DataAccessException {
		connection.flushAll();

		return null;
	    }
	});
    }

    private byte[] rawKey(String key) {
	return redisTemplate.getStringSerializer().serialize(key);
    }

}
