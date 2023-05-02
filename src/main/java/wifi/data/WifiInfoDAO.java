package wifi.data;

import common.JDBConnect;

import javax.servlet.ServletContext;

public class WifiInfoDAO extends JDBConnect {
    public WifiInfoDAO(ServletContext application) {
        super(application);
    }
}
