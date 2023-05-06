package com.dong.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Session监听器
 */
@WebListener
public class SessionListener implements HttpSessionListener {

    private Logger log = LoggerFactory.getLogger(SessionListener.class);

    public static Integer onlineUserCount = 0;

    @Override
    public void sessionCreated(HttpSessionEvent se){
        log.info("创建Session！当前在线用户数：" + (++onlineUserCount));
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se){
        log.info("销毁Session！当前在线用户数：" + (--onlineUserCount));
    }
}
