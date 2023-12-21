package services;

import configs.Config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    private Connection Connection = null;
//    private Session Session;

    public Connection ConnectionGet() {
        String DatabaseUrl = Config.Read("DatabaseUrl");
        String DatabaseUserName = Config.Read("DatabaseUserName");
//        String DatabasePassword = Config.Read("DatabasePassword");
        String DatabasePassword = Config.Read("LocalDatabasePassword");
        String DriverName = Config.Read("DriverName");
        try {
            Class.forName(DriverName);
            Connection = DriverManager.getConnection(DatabaseUrl, DatabaseUserName, DatabasePassword);
        } catch (Exception e) {
            e.printStackTrace();
//            LogUtil.getEventLog().debug("ERR:DB Connection opening failed," + e);
//            LogUtil.getErrorLog().error("ERR:DB Connection opening failed", e);
        }
        return Connection;
    }

    public void ConnectionClose() {
        try {
            if (Connection != null && !Connection.isClosed()) {
                Connection.close();
//                System.out.println("Database Connection Closed");
            }
//            if (Session != null && Session.isConnected()) {
//                Session.disconnect();
////                System.out.println("Session Disconnected");
//            }
        } catch (Exception e) {
            e.printStackTrace();
//            LogUtil.getEventLog().debug("ERR:DB Connection closing failed," + e);
//            LogUtil.getErrorLog().error("ERR:DB Connection closing failed", e);
        }
    }

}
