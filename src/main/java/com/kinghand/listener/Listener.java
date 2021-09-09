package com.kinghand.listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
import javax.servlet.*;
import javax.servlet.annotation.*;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

@WebListener
public class Listener implements ServletContextListener {

    private static final Logger logger = LoggerFactory.getLogger(Listener.class);

    public void contextInitialized(ServletContextEvent sce) {
    }

    public void contextDestroyed(ServletContextEvent sce) {
        Enumeration drivers = DriverManager.getDrivers();

        Driver d = null;

        while (drivers.hasMoreElements()) {
            try {
                d = (Driver) drivers.nextElement();

                DriverManager.deregisterDriver(d);

                logger.warn(String.format("Driver %s deregistered", d));

            } catch (SQLException ex) {
                logger.warn(String.format("Error deregistering driver %s", d), ex);

            }

        }

        AbandonedConnectionCleanupThread.uncheckedShutdown();

    }
}
