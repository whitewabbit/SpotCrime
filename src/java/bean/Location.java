package bean;
import java.util.*;
import java.sql.*;
import servlet.DBConnection;

public class Location {
    
    private Connection con = DBConnection.getConnection();
    
    public String[] getCrimeLocations(){
        PreparedStatement ps;
        ResultSet rs;
        
        String location[] = null;
        List<String> loc = new ArrayList();
        try {
            ps = con.prepareStatement("SELECT * FROM blotter");
            rs = ps.executeQuery();
            while(rs.next()){
                String a = rs.getString("addressline");
                String s = a + (!a.equals("")? ", ":"") + rs.getString("brgy") + ", Digos City";
                loc.add(s);
            }
        }
        catch(SQLException e){
            System.out.println("Error @ getting crime locations : " + e.getMessage());
        }
        
        location = new String[loc.size()];  
        for (int i = 0; i < loc.size(); i++) {
            location[i] = loc.get(i);
        }
        return location;
    }
    
}