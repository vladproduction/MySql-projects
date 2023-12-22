import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoImpl implements Dao{
//    @Override
//    public void create(Person p) {
//        Connection c = null;
//        try{
//            c=getConnection();
//            Statement st = c.createStatement();
//            //st.execute("insert into person (name, age) values ('test' , 22)");
//            st.execute("insert into person (name, age) values ('"+p.getName()+"' , "+p.getAge()+")");
//        }catch (Exception e){
//            e.printStackTrace();
//        }finally {
//            try {
//                if(c!=null){
//                    c.close();
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
//    }

    @Override
    public void create(Person p) {
        try(Connection c = getConnection()){
            PreparedStatement ps = c.prepareStatement("insert into person (name, age) values (? , ?)");
            ps.setString(1,p.getName());
            ps.setInt(2,p.getAge());
            ps.execute();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Person> readAll() {
        List<Person> persons = new ArrayList();
        try(Connection c = getConnection()){
            PreparedStatement ps = c.prepareStatement("select * from person");

            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                int age = rs.getInt("age");
                String name = rs.getString("name");
                Person p = new Person(id,name,age);
                persons.add(p);
            }
            return persons;
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(Person current, Person candidate) {
        try(Connection c = getConnection()){
            PreparedStatement ps = c.prepareStatement("update person set name = ?, age = ? " +
                    "where name in (?) and age = ?");
            ps.setString(1,candidate.getName());
            ps.setInt(2, candidate.getAge());
            ps.setString(3,current.getName());
            ps.setInt(4, current.getAge());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void remove(int id) {
        try(Connection c = getConnection()){
            PreparedStatement ps = c.prepareStatement("delete from person where id=?;");
            ps.setInt(1,id);
            ps.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void removeAll() {

    }

    @Override
    public void makeTransaction() {
        try(Connection c = getConnection()){
            c.setAutoCommit(false);
            Person p = new Person(1,"qqq",10);
            PreparedStatement ps = c.prepareStatement("insert into person (name, age) values (? , ?)");
            ps.setString(1,p.getName());
            ps.setInt(2,p.getAge());
            ps.execute();
            PreparedStatement ps2 = c.prepareStatement("insert into person (name, age) values (? , ?)");
            Person p2 = new Person(8,"www",11);
            ps2.setString(1,p2.getName());
            ps2.setInt(2,p2.getAge());
            ps2.execute();
            c.commit();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/person","root","11111111");
    }
}
