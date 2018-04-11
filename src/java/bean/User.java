package bean;
public class User {
    
    private String name;
    private String username;
    private String password;
    private String location;
    
    public void setName(String name){
        this.name = name;
    }
    public String getName(){
        return this.name;
    }
    
    public void setUsername(String username){
        this.username = username;
    }
    public String getUsername(){
        return this.name;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    public String getPassword(){
        return this.password;
    }
    
    public void setLocation(String location){
        this.location = location;
    }
    public String getLocation(){
        return this.location;
    }
}